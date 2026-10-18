import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/domain/usecase/clear_recent_searches_use_case.dart';
import 'package:dev_journey/domain/usecase/open_resource_use_case.dart';
import 'package:dev_journey/domain/usecase/save_recent_search_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_recent_searches_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_search_results_use_case.dart';
import 'package:dev_journey/features/search/bloc/search_event.dart';
import 'package:dev_journey/features/search/bloc/search_state.dart';
import 'package:dev_journey/features/search/bloc/search_transformers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Drives global Search.
///
/// It is a **Bloc**, not a Cubit, because typing is a *stream* of events
/// that needs shaping: debounced, with stale searches cancelled. Event
/// transformers express that declaratively ([debounceRestartable]), where a
/// Cubit would need hand-written timers.
///
/// The results are live (`emit.forEach` over the index): a note edited or
/// deleted elsewhere updates them, because triggers keep the index current
/// and drift knows they do.
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._watchResults,
    this._watchRecentSearches,
    this._saveRecentSearch,
    this._clearRecentSearches,
    this._openResource, {
    @ignoreParam Duration debounce = const Duration(milliseconds: 300),
  }) : super(const SearchState()) {
    on<SearchSubscriptionRequested>(_onSubscriptionRequested);
    on<SearchQueryChanged>(
      _onQueryChanged,
      transformer: debounceRestartable(debounce),
    );
    on<SearchHitOpened>(_onHitOpened);
    on<SearchRecentSearchesCleared>((_, _) => _clearRecentSearches());
  }

  final WatchSearchResultsUseCase _watchResults;
  final WatchRecentSearchesUseCase _watchRecentSearches;
  final SaveRecentSearchUseCase _saveRecentSearch;
  final ClearRecentSearchesUseCase _clearRecentSearches;
  final OpenResourceUseCase _openResource;

  /// Shorter queries show the recent searches: one letter matches nearly
  /// everything and helps no one.
  static const minQueryLength = 2;

  Future<void> _onSubscriptionRequested(
    SearchSubscriptionRequested event,
    Emitter<SearchState> emit,
  ) => emit.forEach(
    _watchRecentSearches(),
    onData: (recent) => state.copyWith(recentSearches: recent),
  );

  Future<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();
    if (query.length < minQueryLength) {
      emit(
        state.copyWith(
          status: SearchStatus.idle,
          query: query,
          results: const SearchResults(),
        ),
      );
      return;
    }
    // The previous results stay on screen until the new ones arrive, so
    // typing doesn't flash a spinner over them.
    emit(state.copyWith(status: SearchStatus.searching, query: query));
    await emit.forEach<SearchResults>(
      _watchResults(query),
      onData: (results) =>
          state.copyWith(status: SearchStatus.results, results: results),
      onError: (_, _) => state.copyWith(
        status: SearchStatus.failure,
        results: const SearchResults(),
      ),
    );
  }

  Future<void> _onHitOpened(
    SearchHitOpened event,
    Emitter<SearchState> emit,
  ) async {
    await _saveRecentSearch(state.query);
    if (event.hit.kind != SearchKind.resource) return;
    final result = await _openResource(event.hit.id);
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          message: exception.message,
          messageSerial: state.messageSerial + 1,
        ),
      );
    }
  }
}
