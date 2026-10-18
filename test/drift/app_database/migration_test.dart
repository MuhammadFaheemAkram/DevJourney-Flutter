// ignore_for_file: unused_import
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/data/mapper/search_mappers.dart';
import 'package:dev_journey/domain/calculation/fts_query.dart';
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'generated/schema.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() => verifier = SchemaVerifier(GeneratedHelper()));

  // Every upgrade path ends in exactly the schema a fresh install creates:
  // tables, the FTS5 table, triggers, indexes.
  group('simple database migrations', () {
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // v2 adds the search index. The triggers only see new writes, so the
  // upgrade must index what a v1 user already has: the catalog and their
  // notes. User rows must come through untouched.
  group('v1 → v2', () {
    late AppDatabase db;

    setUp(() async {
      final schema = await verifier.schemaAt(1);
      schema.rawDatabase
        ..execute(
          "INSERT INTO roadmaps VALUES ('flutter', 'Flutter Developer', "
          "'Build apps', 'mobile', 0)",
        )
        ..execute(
          "INSERT INTO roadmap_sections VALUES ('dart', 'flutter', 'Dart', 0)",
        )
        ..execute(
          "INSERT INTO topics VALUES ('streams', 'flutter', 'dart', 'Streams', "
          "'Data over time', '[\"Use await for\",\"Cancel subscriptions\"]', "
          "'intermediate', 45, 0)",
        )
        ..execute(
          "INSERT INTO resources VALUES ('res', 'Using streams', 'article', "
          "'https://dart.dev/streams', 'dart.dev', 20, 'streams', 0)",
        )
        ..execute(
          "INSERT INTO challenges VALUES ('ch', 'Debounce', 'dart', "
          "'intermediate', 'Debounce a stream of events', '[]', 0)",
        )
        ..execute(
          "INSERT INTO notes VALUES ('note', 'streams', 'Isolates', "
          "'Spawn one per task', '2026-10-01T09:00:00.000Z', "
          "'2026-10-01T09:00:00.000Z')",
        )
        ..execute(
          "INSERT INTO topic_progress VALUES ('streams', 20261010, "
          "'2026-10-10T09:00:00.000Z')",
        );
      db = AppDatabase(schema.newConnection());
      await verifier.migrateAndValidate(db, 2);
    });
    tearDown(() => db.close());

    Future<List<String>> found(String text) async => [
      for (final hits in searchResultsFromRows(
        await db.searchDao.watchMatches(ftsQuery(text)!).first,
      ).groups.values)
        for (final hit in hits) '${hit.kind.name}:${hit.id}',
    ];

    test("indexes the catalog and the user's notes", () async {
      expect(await db.searchDao.indexedCount(), 5);
      expect(await found('stream'), [
        'topic:streams',
        'resource:res',
        'challenge:ch',
      ]);
      expect(await found('isolates'), ['note:note']);
      // The objectives, as text.
      expect(await found('subscriptions'), ['topic:streams']);
    });

    test('keeps the user rows', () async {
      final completed = await db.select(db.topicProgress).get();
      expect(completed.single.topicId, 'streams');
      expect((await db.select(db.notes).get()).single.title, 'Isolates');
    });

    test('the triggers work from then on', () async {
      await db.customStatement(
        "UPDATE notes SET title = 'Workers' WHERE id = 'note'",
      );

      expect(await found('isolates'), isEmpty);
      expect(await found('workers'), ['note:note']);
    });
  });
}
