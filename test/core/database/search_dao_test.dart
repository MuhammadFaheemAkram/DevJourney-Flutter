import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/data/mapper/search_mappers.dart';
import 'package:dev_journey/domain/calculation/fts_query.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';
import '../../helpers/database.dart';

void main() {
  late AppDatabase db;
  final at = DateTime.utc(2026, 10, 14, 12);

  setUp(() async {
    db = newTestDatabase();
    await db.catalogDao.upsertCatalog(catalogDto().toRows());
  });
  tearDown(() => db.close());

  Future<SearchResults> search(String text) async => searchResultsFromRows(
    await db.searchDao.watchMatches(ftsQuery(text)!).first,
  );

  List<String> ids(SearchResults results) => [
    for (final hits in results.groups.values)
      for (final hit in hits) '${hit.kind.name}:${hit.id}',
  ];

  Future<void> addNote(String id, String title, String content) =>
      db.notesDao.insertNote(
        NotesCompanion.insert(
          id: id,
          title: title,
          content: content,
          topicId: const Value(null),
          createdAt: at,
          updatedAt: at,
        ),
      );

  test('a sync indexes every roadmap, topic, resource and challenge', () async {
    // 1 roadmap, 3 topics, 2 resources, 1 challenge in the fixture.
    expect(await db.searchDao.indexedCount(), 7);
    expect(ids(await search('fizzbuzz')), ['challenge:fizz']);
    expect(ids(await search('youtube')), ['resource:channel']);
  });

  test('the last word matches as a prefix; all words are required', () async {
    expect(ids(await search('futu')), ['topic:futures']);
    expect(ids(await search('topic fut')), ['topic:futures']);
    expect(ids(await search('topic zebra')), isEmpty);
  });

  test('a match in the title outranks one in the body', () async {
    await addNote('body', 'Something else', 'All about isolates here');
    await addNote('title', 'Isolates', 'Something else');

    final notes = (await search('isolates')).groups[SearchKind.note]!;

    expect([for (final hit in notes) hit.id], ['title', 'body']);
  });

  test('matches come back marked, title and snippet', () async {
    await addNote('n', 'Stream tips', 'Always cancel a stream subscription.');

    final hit = (await search('stream')).groups[SearchKind.note]!.single;

    expect(
      hit.title,
      const HighlightedText(text: 'Stream tips', matches: [(0, 6)]),
    );
    expect(hit.snippet.text, contains('stream subscription'));
    expect(hit.snippet.matches, hasLength(1));
  });

  test(
    'triggers: notes are indexed as they are added, edited and deleted',
    () async {
      await addNote('n', 'Keys', 'ValueKey in lists');
      expect(ids(await search('valuekey')), ['note:n']);

      final row = (await db.notesDao.findById('n'))!;
      await db.notesDao.updateNote(row.copyWith(content: 'ObjectKey instead'));
      expect(ids(await search('valuekey')), isEmpty);
      expect(ids(await search('objectkey')), ['note:n']);

      await db.notesDao.deleteReturning('n');
      expect(ids(await search('objectkey')), isEmpty);
    },
  );

  test('a re-sync updates rows in place: no duplicates in the index', () async {
    await db.catalogDao.upsertCatalog(catalogDto().toRows());

    expect(await db.searchDao.indexedCount(), 7);
  });

  test('topic objectives are indexed as readable text', () async {
    final hit = (await search('learn')).groups[SearchKind.topic]!.first;

    // Stored as a JSON list, indexed without its brackets and quotes.
    expect(hit.snippet.text, isNot(contains('["')));
  });

  test('results are live: a new note shows up', () async {
    final results = db.searchDao.watchMatches(ftsQuery('isolates')!);
    final emissions = <int>[];
    final subscription = results.listen((rows) => emissions.add(rows.length));
    await pumpEventQueue();

    await addNote('n', 'Isolates', '');
    await pumpEventQueue();
    await subscription.cancel();

    expect(emissions, [0, 1]);
  });

  test('hostile text, made safe by ftsQuery, never breaks the query', () async {
    for (final text in ['AND', 'NEAR(a b)', '"', 'a*b', 'x OR', '-', 'NOT']) {
      final query = ftsQuery(text);
      if (query == null) continue;
      await expectLater(db.searchDao.watchMatches(query).first, completes);
    }
  });
}
