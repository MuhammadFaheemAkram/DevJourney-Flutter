import 'package:dev_journey/domain/calculation/goals.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';

// The chart series, from completion days. Pure, so each is tested without a
// database or a widget.

/// [days] counted per ISO week (Monday to Sunday) for the last [weeks]
/// weeks, this one included; oldest first, empty weeks as zero.
List<PeriodCount> weeklyCompletions(
  Iterable<CalendarDate> days, {
  required CalendarDate today,
  int weeks = 8,
}) {
  final thisWeek = goalWindow(GoalPeriod.weekly, today);
  return [
    for (var back = weeks - 1; back >= 0; back--)
      _count(
        days,
        thisWeek.start.addDays(-7 * back),
        thisWeek.end.addDays(-7 * back),
      ),
  ];
}

/// [days] counted per calendar month for the last [months] months, this one
/// included; oldest first.
List<PeriodCount> monthlyCompletions(
  Iterable<CalendarDate> days, {
  required CalendarDate today,
  int months = 6,
}) {
  final first = CalendarDate(today.year, today.month, 1);
  return [
    for (var back = months - 1; back >= 0; back--)
      () {
        final start = first.addMonths(-back);
        final end = CalendarDate(
          start.year,
          start.month,
          CalendarDate.daysInMonth(start.year, start.month),
        );
        return _count(days, start, end);
      }(),
  ];
}

/// How many events fell on each day from [from] to [to]; days without any
/// are left out.
Map<CalendarDate, int> activityByDay(
  Iterable<CalendarDate> events, {
  required CalendarDate from,
  required CalendarDate to,
}) {
  final counts = <CalendarDate, int>{};
  for (final day in events) {
    if (day >= from && day <= to) counts[day] = (counts[day] ?? 0) + 1;
  }
  return counts;
}

/// The Monday [weeks] − 1 weeks before this week's: the heatmap's first
/// column starts there, so its last column is this week.
CalendarDate heatmapStart(CalendarDate today, {required int weeks}) =>
    goalWindow(GoalPeriod.weekly, today).start.addDays(-7 * (weeks - 1));

/// Every dated event: completions and check-ins.
Iterable<CalendarDate> allEvents(LearningActivity activity) => [
  ...activity.topicCompletions,
  ...activity.challengeCompletions,
  for (final days in activity.checkIns.values) ...days,
];

PeriodCount _count(
  Iterable<CalendarDate> days,
  CalendarDate start,
  CalendarDate end,
) => PeriodCount(
  start: start,
  end: end,
  count: days.where((day) => day >= start && day <= end).length,
);
