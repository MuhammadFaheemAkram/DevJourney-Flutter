import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/data/mapper/demo_progress_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Wednesday 14 October 2026, 15:00 local time.
  final now = DateTime(2026, 10, 14, 15);
  const catalog = (
    topics: {'vars', 'functions'},
    resources: {'tour'},
    challenges: {'fizz'},
  );

  DemoProgressDto demo({
    List<DemoCompletionDto> completed = const [],
    List<String> topicBookmarks = const [],
    List<DemoNoteDto> notes = const [],
    List<DemoGoalDto> goals = const [],
    List<DemoChallengeDto> challenges = const [],
  }) => DemoProgressDto(
    completedTopics: completed,
    bookmarkedTopics: topicBookmarks,
    bookmarkedResources: const [],
    notes: notes,
    goals: goals,
    challenges: challenges,
  );

  test('days count back from today; instants are 19:00 that day, in order, '
      'never after now', () {
    final rows = demo(
      completed: const [
        DemoCompletionDto(topicId: 'vars', daysAgo: 2),
        DemoCompletionDto(topicId: 'functions', daysAgo: 0),
      ],
    ).toUserRows(now: now, catalog: catalog);

    final [twoDaysAgo, today] = rows.progress;
    expect(twoDaysAgo.completedOn.value, CalendarDate(2026, 10, 12));
    expect(twoDaysAgo.completedAt.value, DateTime(2026, 10, 12, 19).toUtc());
    expect(today.completedOn.value, CalendarDate(2026, 10, 14));
    // 19:01 today is after 15:00: clamped to now.
    expect(today.completedAt.value, now.toUtc());
  });

  test('goals keep their check-ins; challenges get their status dates', () {
    final rows = demo(
      goals: const [
        DemoGoalDto(
          id: 'read',
          title: 'Read',
          kind: GoalKind.custom,
          period: GoalPeriod.daily,
          target: 1,
          daysAgo: 7,
          checkIns: [1, 2],
        ),
      ],
      challenges: const [
        DemoChallengeDto(
          challengeId: 'fizz',
          status: ChallengeStatus.done,
          daysAgo: 3,
        ),
      ],
    ).toUserRows(now: now, catalog: catalog);

    expect(rows.goals.single.createdOn.value, CalendarDate(2026, 10, 7));
    expect(
      [for (final c in rows.checkIns) c.day.value],
      [CalendarDate(2026, 10, 13), CalendarDate(2026, 10, 12)],
    );
    final state = rows.challengeStates.single;
    expect(state.completedOn.value, CalendarDate(2026, 10, 11));
    expect(state.startedAt.value, isNotNull);
  });

  group('broken data fails before anything is written', () {
    void expectBroken(DemoProgressDto dto) => expect(
      () => dto.toUserRows(now: now, catalog: catalog),
      throwsFormatException,
    );

    test('an unknown topic, resource or challenge', () {
      expectBroken(
        demo(completed: const [DemoCompletionDto(topicId: 'x', daysAgo: 1)]),
      );
      expectBroken(demo(topicBookmarks: ['x']));
      expectBroken(
        demo(
          challenges: const [
            DemoChallengeDto(
              challengeId: 'x',
              status: ChallengeStatus.done,
              daysAgo: 1,
            ),
          ],
        ),
      );
    });

    test('a day in the future', () {
      expectBroken(
        demo(
          completed: const [DemoCompletionDto(topicId: 'vars', daysAgo: -1)],
        ),
      );
    });

    DemoGoalDto goal({
      GoalKind kind = GoalKind.custom,
      int target = 1,
      List<int> checkIns = const [],
    }) => DemoGoalDto(
      id: 'g',
      title: 'G',
      kind: kind,
      period: GoalPeriod.daily,
      target: target,
      daysAgo: 5,
      checkIns: checkIns,
    );

    test('a target out of 1–50, check-ins on an automatic goal, or a check-in '
        'before the goal', () {
      expectBroken(demo(goals: [goal(target: 0)]));
      expectBroken(demo(goals: [goal(target: 51)]));
      expectBroken(
        demo(
          goals: [
            goal(kind: GoalKind.topics, checkIns: [1]),
          ],
        ),
      );
      expectBroken(
        demo(
          goals: [
            goal(checkIns: [6]),
          ],
        ),
      );
    });
  });
}
