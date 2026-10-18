import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart' show SqliteException;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';
import '../../helpers/database.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = newTestDatabase());
  tearDown(() => db.close());

  Future<void> complete(String topicId) => db
      .into(db.topicProgress)
      .insert(
        TopicProgressCompanion.insert(
          topicId: topicId,
          completedOn: CalendarDate(2026, 10, 14),
          completedAt: DateTime.utc(2026, 10, 14, 12),
        ),
      );

  test('a first sync adds everything, and says so', () async {
    final added = await db.catalogDao.upsertCatalog(catalogDto().toRows());

    expect(added, (roadmaps: 1, topics: 3, resources: 2, challenges: 1));
  });

  test('a second sync updates in place and adds only what is new', () async {
    await db.catalogDao.upsertCatalog(catalogDto().toRows());

    final updated = catalogDto(
      roadmaps: [
        catalogDto().roadmaps.single.copyWithTopic(
          sectionIndex: 1,
          topic: topicDto('streams'),
        ),
      ],
    );
    final added = await db.catalogDao.upsertCatalog(updated.toRows());

    expect(added, (roadmaps: 0, topics: 1, resources: 0, challenges: 0));
    expect(await db.select(db.topics).get(), hasLength(4));
  });

  test(
    "a sync never touches the user's data: no REPLACE, so no cascade",
    () async {
      await db.catalogDao.upsertCatalog(catalogDto().toRows());
      await complete('vars');
      await db
          .into(db.notes)
          .insert(
            NotesCompanion.insert(
              id: 'n1',
              topicId: const Value('vars'),
              title: 'Mine',
              content: '',
              createdAt: DateTime.utc(2026),
              updatedAt: DateTime.utc(2026),
            ),
          );

      // Re-syncing the same topics: with INSERT OR REPLACE, SQLite would
      // delete each topic row first, and the CASCADE would delete the
      // progress (and SET NULL the note's topic).
      await db.catalogDao.upsertCatalog(catalogDto().toRows());

      expect(await db.select(db.topicProgress).get(), hasLength(1));
      expect((await db.select(db.notes).getSingle()).topicId, 'vars');
    },
  );

  test(
    'roadmap progress counts topics and completions, zeros included',
    () async {
      await db.catalogDao.upsertCatalog(catalogDto().toRows());
      final progress = db.catalogDao.watchRoadmapProgress();

      var rows = await progress.first;
      expect(
        [for (final (r, done, total) in rows) (r.id, done, total)],
        [('dart', 0, 3)],
      );

      await complete('vars');
      await complete('futures');
      rows = await progress.first;
      expect(
        [for (final (r, done, total) in rows) (r.id, done, total)],
        [('dart', 2, 3)],
      );
    },
  );

  test('the catalog ids, for checking references', () async {
    await db.catalogDao.upsertCatalog(catalogDto().toRows());

    final ids = await db.catalogDao.ids();

    expect(ids.topics, {'vars', 'functions', 'futures'});
    expect(ids.resources, {'tour', 'channel'});
    expect(ids.challenges, {'fizz'});
  });

  test('CHECK constraints refuse a topic that takes no time', () async {
    await db.catalogDao.upsertCatalog(catalogDto().toRows());
    final row = (await db.select(db.topics).get()).first;

    expect(
      () => db.update(db.topics).replace(row.copyWith(estimatedMinutes: 0)),
      throwsA(isA<SqliteException>()),
    );
  });
}

extension on RoadmapDto {
  /// This roadmap with [topic] appended to the section at [sectionIndex].
  RoadmapDto copyWithTopic({
    required int sectionIndex,
    required TopicDto topic,
  }) => RoadmapDto(
    id: id,
    title: title,
    description: description,
    category: category,
    sections: [
      for (final (index, section) in sections.indexed)
        index == sectionIndex
            ? SectionDto(
                id: section.id,
                title: section.title,
                topics: [...section.topics, topic],
              )
            : section,
    ],
  );
}
