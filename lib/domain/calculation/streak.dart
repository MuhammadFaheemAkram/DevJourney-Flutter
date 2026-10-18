import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';

/// The learning streak from the days the user was active (a topic or a
/// challenge completed, a goal checked in), as of [today].
///
/// - **Current:** consecutive active days counting back from today. If
///   today has no activity yet, it counts back from yesterday instead: the
///   streak isn't broken until today is over. One inactive day breaks it.
/// - **Longest:** the longest run of consecutive active days.
/// - Duplicates don't matter, and days after [today] (a clock change) are
///   ignored.
///
/// Days are `CalendarDate`s, so "consecutive" is calendar arithmetic: month
/// and year ends, leap years and time zones can't break it.
LearningStreak learningStreak(
  Iterable<CalendarDate> activeDays, {
  required CalendarDate today,
}) {
  final days = {
    for (final day in activeDays)
      if (day <= today) day,
  };
  if (days.isEmpty) return const LearningStreak();

  final todayCounts = days.contains(today);
  var current = 0;
  for (
    var day = todayCounts ? today : today.addDays(-1);
    days.contains(day);
    day = day.addDays(-1)
  ) {
    current++;
  }

  final sorted = days.toList()
    ..sort((a, b) => a.yyyymmdd.compareTo(b.yyyymmdd));
  var longest = 1;
  var run = 1;
  for (var i = 1; i < sorted.length; i++) {
    run = sorted[i] == sorted[i - 1].addDays(1) ? run + 1 : 1;
    if (run > longest) longest = run;
  }

  return LearningStreak(
    current: current,
    longest: longest,
    todayCounts: todayCounts,
  );
}
