import 'package:dev_journey/domain/model/search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

/// - **idle:** fewer than two characters typed; the recent searches show.
/// - **searching:** waiting for the first results of [query].
/// - **results:** [results] for [query] (possibly none).
/// - **failure:** the search couldn't run.
enum SearchStatus { idle, searching, results, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.idle) SearchStatus status,
    @Default('') String query,
    @Default(SearchResults()) SearchResults results,
    @Default(<String>[]) List<String> recentSearches,
    String? message,
    @Default(0) int messageSerial,
  }) = _SearchState;
}
