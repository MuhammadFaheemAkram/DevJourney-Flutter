import 'package:dev_journey/core/database/daos/search_dao.dart';
import 'package:dev_journey/data/mapper/search_mappers.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const s = SearchDao.matchStart;
  const e = SearchDao.matchEnd;

  test('marks become ranges in the plain text', () {
    expect(
      parseHighlights('Dart ${s}streams$e and ${s}stream$e controllers'),
      const HighlightedText(
        text: 'Dart streams and stream controllers',
        matches: [(5, 12), (17, 23)],
      ),
    );
  });

  test('no marks, an empty mark or an unclosed one: no ranges', () {
    expect(parseHighlights('plain').matches, isEmpty);
    expect(parseHighlights('a$s${e}b').matches, isEmpty);
    expect(parseHighlights('a${s}b'), const HighlightedText(text: 'ab'));
  });

  test('rows grouped in display order, best first, unknown kinds skipped', () {
    SearchRow row(String kind, String id, double rank) =>
        (kind: kind, refId: id, title: id, snippet: '', rank: rank);

    final results = searchResultsFromRows([
      row('note', 'n1', -5),
      row('topic', 't1', -4),
      row('note', 'n2', -3),
      row('lesson', 'x', -2),
    ]);

    expect(results.groups.keys, [SearchKind.topic, SearchKind.note]);
    expect(
      [for (final hit in results.groups[SearchKind.note]!) hit.id],
      ['n1', 'n2'],
    );
    expect(results.count, 3);
  });
}
