import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:drift/drift.dart' show Value;

/// Turns the demo progress into rows, as of [now] (the device's local time).
extension DemoProgressMapping on DemoProgressDto {
  /// - **Dates move:** each `daysAgo` becomes a day counted back from today,
  ///   so the demo always shows a live streak and this week's activity.
  /// - **Checked before writing:** every topic, resource and challenge it
  ///   names exists in [catalog]; days are not in the future; goal targets
  ///   are 1–50; only custom goals have check-ins, none before the goal was
  ///   set; a finished challenge has a day. Broken data throws a
  ///   [FormatException].
  UserRows toUserRows({required DateTime now, required CatalogIds catalog}) {
    final today = CalendarDate.fromDateTime(now);
    var sequence = 0;

    void require(bool condition, String problem) {
      if (!condition) throw FormatException('Demo progress: $problem');
    }

    CalendarDate dayOf(int daysAgo, String what) {
      require(daysAgo >= 0, '$what is in the future');
      return today.addDays(-daysAgo);
    }

    /// 19:00 on [day], plus a minute per record so they keep the file's
    /// order; never later than [now].
    DateTime instantOn(CalendarDate day) {
      final instant = DateTime(
        day.year,
        day.month,
        day.day,
        19,
      ).add(Duration(minutes: sequence++));
      return (instant.isAfter(now) ? now : instant).toUtc();
    }

    final progress = [
      for (final completion in completedTopics)
        () {
          require(
            catalog.topics.contains(completion.topicId),
            'unknown topic ${completion.topicId}',
          );
          final day = dayOf(completion.daysAgo, completion.topicId);
          return TopicProgressCompanion.insert(
            topicId: completion.topicId,
            completedOn: day,
            completedAt: instantOn(day),
          );
        }(),
    ];

    final topicBookmarks = [
      for (final id in bookmarkedTopics)
        () {
          require(catalog.topics.contains(id), 'unknown topic $id');
          return TopicBookmarksCompanion.insert(
            topicId: id,
            createdAt: instantOn(today),
          );
        }(),
    ];

    final resourceBookmarks = [
      for (final id in bookmarkedResources)
        () {
          require(catalog.resources.contains(id), 'unknown resource $id');
          return ResourceBookmarksCompanion.insert(
            resourceId: id,
            createdAt: instantOn(today),
          );
        }(),
    ];

    final noteRows = [
      for (final note in notes)
        () {
          require(
            note.topicId == null || catalog.topics.contains(note.topicId),
            '${note.id}: unknown topic',
          );
          require(note.title.trim().isNotEmpty, '${note.id} has no title');
          final at = instantOn(dayOf(note.daysAgo, note.id));
          return NotesCompanion.insert(
            id: note.id,
            topicId: Value(note.topicId),
            title: note.title,
            content: note.content,
            createdAt: at,
            updatedAt: at,
          );
        }(),
    ];

    final goalRows = <GoalsCompanion>[];
    final checkInRows = <GoalCheckInsCompanion>[];
    for (final goal in goals) {
      require(goal.target >= 1 && goal.target <= 50, '${goal.id}: target');
      require(
        goal.checkIns.isEmpty || goal.kind == GoalKind.custom,
        '${goal.id}: only custom goals have check-ins',
      );
      final created = dayOf(goal.daysAgo, goal.id);
      goalRows.add(
        GoalsCompanion.insert(
          id: goal.id,
          title: goal.title,
          kind: goal.kind,
          period: goal.period,
          target: goal.target,
          createdOn: created,
          createdAt: instantOn(created),
        ),
      );
      for (final daysAgo in goal.checkIns) {
        require(daysAgo <= goal.daysAgo, '${goal.id}: a check-in before it');
        final day = dayOf(daysAgo, goal.id);
        checkInRows.add(
          GoalCheckInsCompanion.insert(
            goalId: goal.id,
            day: day,
            createdAt: instantOn(day),
          ),
        );
      }
    }

    final challengeRows = [
      for (final challenge in challenges)
        () {
          require(
            catalog.challenges.contains(challenge.challengeId),
            'unknown challenge ${challenge.challengeId}',
          );
          final day = dayOf(challenge.daysAgo, challenge.challengeId);
          final at = instantOn(day);
          return ChallengeStatesCompanion.insert(
            challengeId: challenge.challengeId,
            status: challenge.status,
            solutionNotes: Value(challenge.solutionNotes),
            startedAt: Value(
              challenge.status == ChallengeStatus.todo ? null : at,
            ),
            completedOn: Value(
              challenge.status == ChallengeStatus.done ? day : null,
            ),
            updatedAt: at,
          );
        }(),
    ];

    return UserRows(
      progress: progress,
      topicBookmarks: topicBookmarks,
      resourceBookmarks: resourceBookmarks,
      notes: noteRows,
      goals: goalRows,
      checkIns: checkInRows,
      challengeStates: challengeRows,
    );
  }
}
