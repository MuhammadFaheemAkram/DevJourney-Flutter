import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:drift/drift.dart';

part 'goals_dao.g.dart';

/// Goals and their check-ins, and the completions goals count.
@DriftAccessor(tables: [Goals, GoalCheckIns, TopicProgress, ChallengeStates])
class GoalsDao extends DatabaseAccessor<AppDatabase> with _$GoalsDaoMixin {
  GoalsDao(super.attachedDatabase);

  /// Goals, oldest first (in the order added, when created together).
  Stream<List<GoalRow>> watchGoals() =>
      (select(goals)..orderBy([
            (g) => OrderingTerm.asc(g.createdAt),
            (g) => OrderingTerm.asc(g.rowId),
          ]))
          .watch();

  Future<GoalRow?> findById(String id) =>
      (select(goals)..where((g) => g.id.equals(id))).getSingleOrNull();

  Future<void> insertGoal(GoalsCompanion goal) => into(goals).insert(goal);

  Future<bool> updateGoal(GoalRow goal) => update(goals).replace(goal);

  /// Deletes the goal; its check-ins go with it (`CASCADE`).
  Future<int> deleteGoal(String id) =>
      (delete(goals)..where((g) => g.id.equals(id))).go();

  Future<void> addCheckIn(
    String goalId, {
    required CalendarDate day,
    required DateTime at,
  }) => into(goalCheckIns).insert(
    GoalCheckInsCompanion.insert(goalId: goalId, day: day, createdAt: at),
  );

  /// Removes the latest check-in of [goalId] from [from] on; returns
  /// whether there was one.
  Future<bool> removeLatestCheckIn(
    String goalId, {
    required CalendarDate from,
  }) async {
    final latest =
        await (select(goalCheckIns)
              ..where(
                (c) =>
                    c.goalId.equals(goalId) &
                    c.day.isBiggerOrEqualValue(from.yyyymmdd),
              )
              ..orderBy([(c) => OrderingTerm.desc(c.id)])
              ..limit(1))
            .getSingleOrNull();
    if (latest == null) return false;
    await (delete(goalCheckIns)..where((c) => c.id.equals(latest.id))).go();
    return true;
  }

  /// Every completion day (one per topic or challenge, so a day with two
  /// completions appears twice) and every check-in, kept live: what goal
  /// progress is counted from.
  Stream<
    ({
      List<CalendarDate> topics,
      List<CalendarDate> challenges,
      List<(String goalId, CalendarDate day)> checkIns,
    })
  >
  watchActivity() {
    return customSelect(
      "SELECT 'topic' AS kind, NULL AS goal_id, completed_on AS day "
      'FROM topic_progress '
      "UNION ALL SELECT 'challenge', NULL, completed_on FROM challenge_states "
      'WHERE completed_on IS NOT NULL '
      "UNION ALL SELECT 'check_in', goal_id, day FROM goal_check_ins",
      readsFrom: {topicProgress, challengeStates, goalCheckIns},
    ).watch().map((rows) {
      final topics = <CalendarDate>[];
      final challenges = <CalendarDate>[];
      final checkIns = <(String, CalendarDate)>[];
      for (final row in rows) {
        final day = CalendarDate.fromInt(row.read<int>('day'));
        switch (row.read<String>('kind')) {
          case 'topic':
            topics.add(day);
          case 'challenge':
            challenges.add(day);
          default:
            checkIns.add((row.read<String>('goal_id'), day));
        }
      }
      return (topics: topics, challenges: challenges, checkIns: checkIns);
    });
  }
}
