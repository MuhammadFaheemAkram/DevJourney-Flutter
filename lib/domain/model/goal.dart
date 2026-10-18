import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';

/// A learning goal: a target per day, week or month.
@freezed
abstract class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String title,
    required GoalKind kind,
    required GoalPeriod period,

    /// 1–50.
    required int target,
    required CalendarDate createdOn,
  }) = _Goal;

  const Goal._();

  static const maxTitleLength = 60;
  static const minTarget = 1;
  static const maxTarget = 50;

  /// Counted from completions, not checked in by hand.
  bool get isAutomatic => kind != GoalKind.custom;
}

/// What the goal sheet saves.
@freezed
abstract class GoalDraft with _$GoalDraft {
  const factory GoalDraft({
    required String title,
    required GoalKind kind,
    required GoalPeriod period,
    required int target,
  }) = _GoalDraft;
}

/// The days a goal counts over now: today, this ISO week (Monday to
/// Sunday), or this calendar month.
@freezed
abstract class GoalWindow with _$GoalWindow {
  const factory GoalWindow({
    required CalendarDate start,
    required CalendarDate end,
  }) = _GoalWindow;

  const GoalWindow._();

  bool contains(CalendarDate day) => day >= start && day <= end;

  /// The day the goal starts over.
  CalendarDate get resets => end.addDays(1);
}

/// A goal with its progress in the current window, derived when read.
@freezed
abstract class GoalProgress with _$GoalProgress {
  const factory GoalProgress({
    required Goal goal,
    required GoalWindow window,
    required int current,
  }) = _GoalProgress;

  const GoalProgress._();

  bool get isMet => current >= goal.target;

  /// 0 to 1, capped at 1.
  double get ratio => (current / goal.target).clamp(0, 1).toDouble();
}

/// Everything goals are counted from: one entry per completion or check-in,
/// on the day it happened.
@freezed
abstract class LearningActivity with _$LearningActivity {
  const factory LearningActivity({
    @Default(<CalendarDate>[]) List<CalendarDate> topicCompletions,
    @Default(<CalendarDate>[]) List<CalendarDate> challengeCompletions,

    /// By goal id.
    @Default(<String, List<CalendarDate>>{})
    Map<String, List<CalendarDate>> checkIns,
  }) = _LearningActivity;
}
