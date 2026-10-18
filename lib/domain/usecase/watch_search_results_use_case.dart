import 'package:dev_journey/domain/calculation/fts_query.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

/// Searches everything for what the user typed, kept live. The text is made
/// safe for FTS5 first; text with nothing to search for finds nothing.
@injectable
class WatchSearchResultsUseCase {
  const WatchSearchResultsUseCase(this._search);

  final SearchRepository _search;

  Stream<SearchResults> call(String text) {
    final query = ftsQuery(text);
    return query == null
        ? Stream.value(const SearchResults())
        : _search.watchResults(query);
  }
}
