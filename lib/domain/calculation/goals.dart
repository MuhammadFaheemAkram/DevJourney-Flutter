import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
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
  return GoalProgress(
    goal: goal,
    window: window,
    current: _countIn(goal, activity, window),
  );
}

/// How often goals were met over the last [days] days.
///
/// Each goal contributes its periods that overlap those days and began
/// after it was created (a goal can't be missed before it existed):
/// - a period that has **ended** counts, met or not;
/// - the **current** period counts only once it is met: it hasn't been
///   missed yet.
///
/// So a daily goal met on 20 of the last 30 days, and not yet today, scores
/// 20 of 29.
GoalCompletion goalCompletionRate(
  Iterable<Goal> goals,
  LearningActivity activity, {
  required CalendarDate today,
  int days = 30,
}) {
  final from = today.addDays(-(days - 1));
  var met = 0;
  var total = 0;
  for (final goal in goals) {
    final current = goalWindow(goal.period, today);
    if (_countIn(goal, activity, current) >= goal.target) {
      met++;
      total++;
    }
    var window = goalWindow(goal.period, current.start.addDays(-1));
    while (window.end >= from && window.end >= goal.createdOn) {
      total++;
      if (_countIn(goal, activity, window) >= goal.target) met++;
      window = goalWindow(goal.period, window.start.addDays(-1));
    }
  }
  return GoalCompletion(met: met, total: total);
}

int _countIn(Goal goal, LearningActivity activity, GoalWindow window) {
  final days = switch (goal.kind) {
    GoalKind.topics => activity.topicCompletions,
    GoalKind.challenges => activity.challengeCompletions,
    GoalKind.custom => activity.checkIns[goal.id] ?? const <CalendarDate>[],
  };
  return days.where(window.contains).length;
}
