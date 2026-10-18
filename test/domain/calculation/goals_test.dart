import 'package:dev_journey/domain/calculation/goals.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('goalWindow', () {
    final wednesday = CalendarDate(2026, 10, 14);

    test('daily: today only', () {
      expect(
        goalWindow(GoalPeriod.daily, wednesday),
        GoalWindow(start: wednesday, end: wednesday),
      );
    });

    test('weekly: the ISO week, Monday to Sunday', () {
      final week = GoalWindow(
        start: CalendarDate(2026, 10, 12),
        end: CalendarDate(2026, 10, 18),
      );
      for (var day = 12; day <= 18; day++) {
        expect(
          goalWindow(GoalPeriod.weekly, CalendarDate(2026, 10, day)),
          week,
        );
      }
      expect(week.resets, CalendarDate(2026, 10, 19));
    });

    test('weekly: a week that spans two years', () {
      // 1 January 2026 is a Thursday.
      expect(
        goalWindow(GoalPeriod.weekly, CalendarDate(2026, 1, 1)),
        GoalWindow(
          start: CalendarDate(2025, 12, 29),
          end: CalendarDate(2026, 1, 4),
        ),
      );
      // 31 December 2028 is a Sunday: the end of its week.
      expect(
        goalWindow(GoalPeriod.weekly, CalendarDate(2028, 12, 31)),
        GoalWindow(
          start: CalendarDate(2028, 12, 25),
          end: CalendarDate(2028, 12, 31),
        ),
      );
    });

    test('monthly: the calendar month, leap years included', () {
      expect(
        goalWindow(GoalPeriod.monthly, wednesday),
        GoalWindow(
          start: CalendarDate(2026, 10, 1),
          end: CalendarDate(2026, 10, 31),
        ),
      );
      expect(
        goalWindow(GoalPeriod.monthly, CalendarDate(2028, 2, 10)).end,
        CalendarDate(2028, 2, 29),
      );
      expect(
        goalWindow(GoalPeriod.monthly, CalendarDate(2026, 12, 31)).resets,
        CalendarDate(2027, 1, 1),
      );
    });
  });

  group('goalProgress', () {
    final today = CalendarDate(2026, 10, 14); // a Wednesday
    Goal goal(GoalKind kind, GoalPeriod period, {int target = 3}) => Goal(
      id: 'g',
      title: 'Goal',
      kind: kind,
      period: period,
      target: target,
      createdOn: CalendarDate(2026, 9, 1),
    );
    List<CalendarDate> days(List<int> octoberDays) => [
      for (final day in octoberDays) CalendarDate(2026, 10, day),
    ];
    final activity = LearningActivity(
      // Sunday 11 is last week; 12–14 this week.
      topicCompletions: days([1, 11, 12, 14, 14]),
      challengeCompletions: days([13]),
      checkIns: {
        'g': days([14, 14]),
        'other': days([14]),
      },
    );

    test('topics: completions in the window, each counted', () {
      expect(
        goalProgress(
          goal(GoalKind.topics, GoalPeriod.daily),
          activity,
          today: today,
        ).current,
        2,
      );
      expect(
        goalProgress(
          goal(GoalKind.topics, GoalPeriod.weekly),
          activity,
          today: today,
        ).current,
        3,
      );
      expect(
        goalProgress(
          goal(GoalKind.topics, GoalPeriod.monthly),
          activity,
          today: today,
        ).current,
        5,
      );
    });

    test('challenges: challenge completions only', () {
      expect(
        goalProgress(
          goal(GoalKind.challenges, GoalPeriod.weekly),
          activity,
          today: today,
        ).current,
        1,
      );
    });

    test("custom: this goal's check-ins only", () {
      final progress = goalProgress(
        goal(GoalKind.custom, GoalPeriod.daily, target: 2),
        activity,
        today: today,
      );
      expect(progress.current, 2);
      expect(progress.isMet, isTrue);
    });

    test('the next window starts from zero', () {
      expect(
        goalProgress(
          goal(GoalKind.topics, GoalPeriod.weekly),
          activity,
          today: CalendarDate(2026, 10, 19),
        ).current,
        0,
      );
    });

    test('the bar stops at full; the count goes on', () {
      final progress = goalProgress(
        goal(GoalKind.topics, GoalPeriod.monthly, target: 2),
        activity,
        today: today,
      );
      expect(progress.current, 5);
      expect(progress.ratio, 1);
      expect(progress.isMet, isTrue);
    });
  });
}
