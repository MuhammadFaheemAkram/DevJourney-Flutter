import 'package:dev_journey/core/database/app_database.dart';
import 'package:drift/drift.dart';

part 'search_dao.g.dart';

/// One match in the search index, as SQLite returns it. [title] and
/// [snippet] carry the matched words between [matchStart] and [matchEnd].
typedef SearchRow = ({
  String kind,
  String refId,
  String title,
  String snippet,
  double rank,
});

/// Reads the FTS5 index (`search.drift`). Nothing writes it here: the
/// triggers keep it in step with the content tables.
@DriftAccessor(include: {'../search.drift'})
class SearchDao extends DatabaseAccessor<AppDatabase> with _$SearchDaoMixin {
  SearchDao(super.attachedDatabase);

  /// Marks around each matched word: control characters, which no title or
  /// note contains, so the app can split them out without ambiguity.
  static const matchStart = '\u0001';
  static const matchEnd = '\u0002';

  /// The rows matching [match] (an FTS5 query; build it with `ftsQuery`,
  /// never from raw user text), best first, kept live: the triggers update
  /// the index, and drift knows they do.
  ///
  /// `bm25` takes one weight per column, `UNINDEXED` ones included: a match
  /// in the title counts ten times one in the body. Lower is better.
  Stream<List<SearchRow>> watchMatches(String match, {int limit = 60}) {
    return customSelect(
      'SELECT kind, ref_id, '
      'highlight(search_index, 2, char(1), char(2)) AS title, '
      "snippet(search_index, 3, char(1), char(2), '…', 12) AS snippet, "
      'bm25(search_index, 0.0, 0.0, 10.0, 1.0) AS rank '
      'FROM search_index WHERE search_index MATCH ? '
      'ORDER BY rank LIMIT ?',
      variables: [Variable.withString(match), Variable.withInt(limit)],
      readsFrom: {searchIndex},
    ).watch().map(
      (rows) => [
        for (final row in rows)
          (
            kind: row.read<String>('kind'),
            refId: row.read<String>('ref_id'),
            title: row.read<String>('title'),
            snippet: row.read<String>('snippet'),
            rank: row.read<double>('rank'),
          ),
      ],
    );
  }

  /// Every row of the index (for tests and the migration check).
  Future<int> indexedCount() async {
    final row = await customSelect(
      'SELECT count(*) AS n FROM search_index',
      readsFrom: {searchIndex},
    ).getSingle();
    return row.read<int>('n');
  }
}
