import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_state.freezed.dart';

enum GoalsStatus { loading, ready, failure }

@freezed
abstract class GoalsState with _$GoalsState {
  const factory GoalsState({
    required CalendarDate today,
    @Default(GoalsStatus.loading) GoalsStatus status,

    /// Every goal, with its progress now.
    @Default(<GoalProgress>[]) List<GoalProgress> goals,
    @Default(GoalPeriod.daily) GoalPeriod period,

    /// One-time SnackBar text; [messageSerial] makes each one distinct.
    String? message,
    @Default(0) int messageSerial,
  }) = _GoalsState;

  const GoalsState._();

  /// The goals of the chosen period.
  List<GoalProgress> get visible => [
    for (final progress in goals)
      if (progress.goal.period == period) progress,
  ];
}
