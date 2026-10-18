import 'package:dev_journey/domain/calculation/analytics.dart';
import 'package:dev_journey/domain/calculation/goals.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = CalendarDate(2026, 10, 14); // a Wednesday
  List<CalendarDate> days(List<(int, int)> monthDays) => [
    for (final (month, day) in monthDays) CalendarDate(2026, month, day),
  ];

  group('weeklyCompletions', () {
    test('ISO weeks, oldest first, this week last, zeros kept', () {
      final weeks = weeklyCompletions(
        days([(10, 12), (10, 14), (10, 11), (10, 5), (9, 1)]),
        today: today,
        weeks: 3,
      );

      expect(
        [for (final w in weeks) (w.start, w.count)],
        [
          (CalendarDate(2026, 9, 28), 0),
          (CalendarDate(2026, 10, 5), 2),
          (CalendarDate(2026, 10, 12), 2),
        ],
      );
      expect(weeks.last.end, CalendarDate(2026, 10, 18));
    });

    test('weeks that span two years', () {
      final weeks = weeklyCompletions(
        [CalendarDate(2025, 12, 30), CalendarDate(2026, 1, 2)],
        today: CalendarDate(2026, 1, 3),
        weeks: 1,
      );

      expect(weeks.single.start, CalendarDate(2025, 12, 29));
      expect(weeks.single.count, 2);
    });
  });

  test('monthlyCompletions: calendar months, back across a year', () {
    final months = monthlyCompletions(
      [
        CalendarDate(2025, 12, 31),
        CalendarDate(2026, 1, 1),
        CalendarDate(2026, 2, 28),
      ],
      today: CalendarDate(2026, 2, 10),
      months: 4,
    );

    expect(
      [for (final m in months) (m.start.month, m.count)],
      [(11, 0), (12, 1), (1, 1), (2, 1)],
    );
    expect(months.last.end, CalendarDate(2026, 2, 28));
  });

  test('activityByDay: counts per day, inside the range only', () {
    expect(
      activityByDay(
        days([(10, 1), (10, 1), (10, 3), (9, 1)]),
        from: CalendarDate(2026, 9, 30),
        to: today,
      ),
      {CalendarDate(2026, 10, 1): 2, CalendarDate(2026, 10, 3): 1},
    );
  });

  test('the heatmap starts on a Monday, its last column this week', () {
    final start = heatmapStart(today, weeks: 26);

    expect(start.weekday, DateTime.monday);
    expect(start.addDays(25 * 7), CalendarDate(2026, 10, 12));
  });

  group('goalCompletionRate', () {
    Goal goal(
      GoalKind kind,
      GoalPeriod period, {
      int target = 1,
      CalendarDate? createdOn,
    }) => Goal(
      id: 'g',
      title: 'Goal',
      kind: kind,
      period: period,
      target: target,
      createdOn: createdOn ?? CalendarDate(2026, 1, 1),
    );

    test('a daily goal: ended days count; today only once met', () {
      final reading = goal(GoalKind.custom, GoalPeriod.daily);
      final activity = LearningActivity(
        checkIns: {
          'g': days([(10, 13), (10, 12)]),
        },
      );

      final notYet = goalCompletionRate(
        [reading],
        activity,
        today: today,
        days: 5,
      );
      expect((notYet.met, notYet.total), (2, 4));

      final metToday = goalCompletionRate(
        [reading],
        LearningActivity(
          checkIns: {
            'g': days([(10, 14), (10, 13)]),
          },
        ),
        today: today,
        days: 5,
      );
      expect((metToday.met, metToday.total), (2, 5));
    });

    test('periods before the goal existed are left out', () {
      final rate = goalCompletionRate(
        [
          goal(
            GoalKind.custom,
            GoalPeriod.daily,
            createdOn: CalendarDate(2026, 10, 12),
          ),
        ],
        const LearningActivity(),
        today: today,
      );

      expect((rate.met, rate.total), (0, 2), reason: 'the 12th and 13th');
    });

    test('a weekly goal over the last 30 days', () {
      final rate = goalCompletionRate(
        [goal(GoalKind.topics, GoalPeriod.weekly, target: 2)],
        LearningActivity(topicCompletions: days([(10, 5), (10, 6), (9, 30)])),
        today: today,
      );

      // Weeks ending 11 Oct (met), 4 Oct, 27 Sep, 20 Sep; this one not met
      // yet.
      expect((rate.met, rate.total), (1, 4));
      expect(rate.rate, 0.25);
    });

    test('no goals: no rate', () {
      expect(
        goalCompletionRate(
          const [],
          const LearningActivity(),
          today: today,
        ).rate,
        isNull,
      );
    });
  });
}
