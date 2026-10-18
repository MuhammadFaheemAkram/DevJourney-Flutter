import 'package:dev_journey/core/database/daos/search_dao.dart';
import 'package:dev_journey/domain/model/search.dart';

/// Splits text marked by `highlight()` / `snippet()` (a match between
/// [SearchDao.matchStart] and [SearchDao.matchEnd]) into the plain text and
/// the matched ranges.
HighlightedText parseHighlights(String marked) {
  final text = StringBuffer();
  final matches = <(int, int)>[];
  int? start;
  for (final char in marked.split('')) {
    if (char == SearchDao.matchStart) {
      start = text.length;
    } else if (char == SearchDao.matchEnd) {
      if (start != null && text.length > start) {
        matches.add((start, text.length));
      }
      start = null;
    } else {
      text.write(char);
    }
  }
  return HighlightedText(text: text.toString(), matches: matches);
}

/// The index's rows as results, grouped by kind in display order. A row of
/// an unknown kind (a newer index) is skipped.
SearchResults searchResultsFromRows(List<SearchRow> rows) {
  final groups = <SearchKind, List<SearchHit>>{
    for (final kind in SearchKind.values) kind: [],
  };
  for (final row in rows) {
    final kind = SearchKind.values.asNameMap()[row.kind];
    if (kind == null) continue;
    groups[kind]!.add(
      SearchHit(
        kind: kind,
        id: row.refId,
        title: parseHighlights(row.title),
        snippet: parseHighlights(row.snippet),
        rank: row.rank,
      ),
    );
  }
  groups.removeWhere((_, hits) => hits.isEmpty);
  return SearchResults(groups: groups);
}
