import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/data/mapper/learning_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
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

  final monday = CalendarDate(2026, 10, 12);
  final wednesday = CalendarDate(2026, 10, 14);
  final at = DateTime.utc(2026, 10, 14, 12);

  Future<Map<String, CalendarDate?>> completions() async {
    final path = pathFromRows(await db.learningDao.watchPath('dart').first)!;
    return {
      for (final section in path.sections)
        for (final topic in section.topics) topic.topic.id: topic.completedOn,
    };
  }

  test("a roadmap's path, as a tree in order", () async {
    final path = pathFromRows(await db.learningDao.watchPath('dart').first)!;

    expect(path.roadmap.title, 'Dart');
    expect(
      [
        // Records holding lists compare the lists by identity: join them.
        for (final s in path.sections)
          '${s.section.id}: ${[for (final t in s.topics) t.topic.id].join(', ')}',
      ],
      ['basics: vars, functions', 'async: futures'],
    );
  });

  test('no such roadmap: no path', () async {
    expect(pathFromRows(await db.learningDao.watchPath('nope').first), isNull);
  });

  test(
    'completing twice keeps the first day; uncompleting removes it',
    () async {
      await db.learningDao.completeTopic('vars', day: monday, at: at);
      await db.learningDao.completeTopic('vars', day: wednesday, at: at);
      expect((await completions())['vars'], monday);

      await db.learningDao.uncompleteTopic('vars');
      expect((await completions())['vars'], isNull);
    },
  );

  test('completing a section completes only its open topics, today', () async {
    await db.learningDao.completeTopic('vars', day: monday, at: at);

    final completed = await db.learningDao.completeSection(
      'basics',
      day: wednesday,
      at: at,
    );

    expect(completed, 1);
    expect(await completions(), {
      'vars': monday,
      'functions': wednesday,
      'futures': null,
    });

    expect(await db.learningDao.uncompleteSection('basics'), 2);
    expect((await completions()).values.whereType<CalendarDate>(), isEmpty);
  });

  test('a topic and its state, with where it sits', () async {
    await db.learningDao.setTopicBookmarked(
      'futures',
      bookmarked: true,
      at: at,
    );

    final details = (await db.learningDao.watchTopic('futures').first)!
        .toDomain();

    expect(details.roadmap.id, 'dart');
    expect(details.section.title, 'Async');
    expect(details.item.bookmarked, isTrue);
    expect(await db.learningDao.watchTopic('nope').first, isNull);
  });

  test('active days: completions, finished challenges and check-ins, once '
      'each', () async {
    await db.learningDao.completeTopic('vars', day: monday, at: at);
    await db.learningDao.completeTopic('functions', day: monday, at: at);
    await db
        .into(db.challengeStates)
        .insert(
          ChallengeStatesCompanion.insert(
            challengeId: 'fizz',
            status: ChallengeStatus.done,
            completedOn: Value(wednesday),
            updatedAt: at,
          ),
        );

    final days = await db.learningDao.watchActiveDays().first;

    expect(days..sort((a, b) => a.yyyymmdd.compareTo(b.yyyymmdd)), [
      monday,
      wednesday,
    ]);
    expect(await db.learningDao.watchCompletedCounts().first, (
      topics: 2,
      challenges: 1,
    ));
  });
}
