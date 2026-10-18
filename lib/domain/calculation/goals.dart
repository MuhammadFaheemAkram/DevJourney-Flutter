import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';

/// The window [period] covers on [today]:
/// - daily: today;
/// - weekly: the ISO week, Monday to Sunday (the international standard, so
///   "this week" doesn't depend on the device's locale);
/// - monthly: the calendar month.
GoalWindow goalWindow(GoalPeriod period, CalendarDate today) =>
    switch (period) {
      GoalPeriod.daily => GoalWindow(start: today, end: today),
      GoalPeriod.weekly => () {
        final monday = today.addDays(1 - today.weekday);
        return GoalWindow(start: monday, end: monday.addDays(6));
      }(),
      GoalPeriod.monthly => GoalWindow(
        start: CalendarDate(today.year, today.month, 1),
        end: CalendarDate(
          today.year,
          today.month,
          CalendarDate.daysInMonth(today.year, today.month),
        ),
      ),
    };

/// [goal]'s progress in its current window, from [activity]:
/// - topics: topics completed in the window;
/// - challenges: challenges finished in the window;
/// - custom: check-ins in the window.
///
/// Nothing is stored or reset: a new window simply counts from zero.
GoalProgress goalProgress(
  Goal goal,
  LearningActivity activity, {
  required CalendarDate today,
}) {
  final window = goalWindow(goal.period, today);
  final days = switch (goal.kind) {
    GoalKind.topics => activity.topicCompletions,
    GoalKind.challenges => activity.challengeCompletions,
    GoalKind.custom => activity.checkIns[goal.id] ?? const <CalendarDate>[],
  };
  return GoalProgress(
    goal: goal,
    window: window,
    current: days.where(window.contains).length,
  );
}
