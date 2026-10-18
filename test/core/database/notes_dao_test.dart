import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';
import '../../helpers/database.dart';

void main() {
  late AppDatabase db;

  setUp(() async {
    db = newTestDatabase();
    await db.catalogDao.upsertCatalog(catalogDto().toRows());
  });
  tearDown(() => db.close());

  Future<void> add(
    String id, {
    String title = 'A note',
    String content = '',
    String? topicId,
    required int minute,
  }) {
    final at = DateTime.utc(2026, 10, 14, 12, minute);
    return db.notesDao.insertNote(
      NotesCompanion.insert(
        id: id,
        title: title,
        content: content,
        topicId: Value(topicId),
        createdAt: at,
        updatedAt: at,
      ),
    );
  }

  Future<List<String>> ids({String query = '', String? topicId}) async => [
    for (final (note, _)
        in await db.notesDao.watchNotes(query: query, topicId: topicId).first)
      note.id,
  ];

  test('newest edit first, with the topic title', () async {
    await add('a', minute: 1, topicId: 'vars');
    await add('b', minute: 3);
    await add('c', minute: 2);

    final rows = await db.notesDao.watchNotes().first;
    expect([for (final (note, _) in rows) note.id], ['b', 'c', 'a']);
    expect(rows.last.$2, 'Topic vars');
    expect(rows.first.$2, isNull);
  });

  test('search matches titles and contents, any case', () async {
    await add('a', title: 'Streams', minute: 1);
    await add('b', content: 'about STREAM controllers', minute: 2);
    await add('c', title: 'Futures', minute: 3);

    expect(await ids(query: 'stream'), ['b', 'a']);
    expect(await ids(query: '  futures '), ['c']);
  });

  test('LIKE wildcards in the search are taken literally', () async {
    await add('percent', title: 'Coverage at 50%', minute: 1);
    await add('plain', title: 'Coverage at 500', minute: 2);
    await add('under', title: 'snake_case', minute: 3);
    await add('other', title: 'snakeXcase', minute: 4);
    await add('slash', title: r'C:\path', minute: 5);

    expect(await ids(query: '50%'), ['percent']);
    expect(await ids(query: '_'), ['under']);
    expect(await ids(query: r'\'), ['slash']);
  });

  test("one topic's notes", () async {
    await add('a', topicId: 'vars', minute: 1);
    await add('b', topicId: 'futures', minute: 2);
    await add('c', topicId: 'vars', minute: 3);

    expect(await ids(topicId: 'vars'), ['c', 'a']);
  });

  test('deleting returns the note, for Undo', () async {
    await add('a', title: 'Keep me', minute: 1);

    final deleted = await db.notesDao.deleteReturning('a');

    expect(deleted?.title, 'Keep me');
    expect(await db.notesDao.findById('a'), isNull);
    expect(await db.notesDao.deleteReturning('a'), isNull);
  });

  test(
    'a topic removed from the catalog leaves its notes, unattached',
    () async {
      await add('a', topicId: 'futures', minute: 1);

      await db.customStatement("DELETE FROM topics WHERE id = 'futures'");

      expect((await db.notesDao.findById('a'))?.topicId, isNull);
    },
  );
}
