import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';
import '../../helpers/database.dart';

void main() {
  late AppDatabase db;
  final at = DateTime.utc(2026, 10, 14, 12);
  final monday = CalendarDate(2026, 10, 12);
  final wednesday = CalendarDate(2026, 10, 14);

  setUp(() async {
    db = newTestDatabase();
    await db.catalogDao.upsertCatalog(catalogDto().toRows());
  });
  tearDown(() => db.close());

  Future<void> addGoal(String id, {int target = 3}) => db.goalsDao.insertGoal(
    GoalsCompanion.insert(
      id: id,
      title: 'Goal $id',
      kind: GoalKind.custom,
      period: GoalPeriod.weekly,
      target: target,
      createdOn: monday,
      createdAt: at,
    ),
  );

  Future<List<CalendarDate>> checkIns(String goalId) async => [
    for (final (id, day) in (await db.goalsDao.watchActivity().first).checkIns)
      if (id == goalId) day,
  ];

  test('goals in the order added', () async {
    await addGoal('b');
    await addGoal('a');

    expect(
      [for (final g in await db.goalsDao.watchGoals().first) g.id],
      ['b', 'a'],
    );
  });

  test('a target outside 1–50 is refused by the table', () async {
    await expectLater(addGoal('zero', target: 0), throwsA(anything));
    await expectLater(addGoal('many', target: 51), throwsA(anything));
  });

  test('the activity: completions and check-ins, with their days', () async {
    await addGoal('g');
    await db.learningDao.completeTopic('vars', day: monday, at: at);
    await db.learningDao.completeTopic('futures', day: wednesday, at: at);
    await db.goalsDao.addCheckIn('g', day: wednesday, at: at);
    await db.goalsDao.addCheckIn('g', day: wednesday, at: at);

    final activity = await db.goalsDao.watchActivity().first;

    expect(activity.topics..sort((a, b) => a.yyyymmdd - b.yyyymmdd), [
      monday,
      wednesday,
    ]);
    expect(activity.challenges, isEmpty);
    expect(await checkIns('g'), [wednesday, wednesday]);
  });

  test('undo removes the latest check-in, only from the window', () async {
    await addGoal('g');
    final lastWeek = monday.addDays(-1);
    await db.goalsDao.addCheckIn('g', day: lastWeek, at: at);
    await db.goalsDao.addCheckIn('g', day: wednesday, at: at);

    expect(await db.goalsDao.removeLatestCheckIn('g', from: monday), isTrue);
    expect(await checkIns('g'), [lastWeek]);
    // Last week's stays: it isn't this window's to undo.
    expect(await db.goalsDao.removeLatestCheckIn('g', from: monday), isFalse);
    expect(await checkIns('g'), [lastWeek]);
  });

  test('deleting a goal deletes its check-ins', () async {
    await addGoal('g');
    await db.goalsDao.addCheckIn('g', day: wednesday, at: at);

    await db.goalsDao.deleteGoal('g');

    expect((await db.goalsDao.watchActivity().first).checkIns, isEmpty);
  });
}
