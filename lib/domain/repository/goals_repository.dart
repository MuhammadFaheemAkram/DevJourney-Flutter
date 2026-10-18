import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';

/// The user's goals, and the activity they count.
abstract interface class GoalsRepository {
  /// Goals, oldest first, kept live.
  Stream<List<Goal>> watchGoals();

  /// Every completion and check-in, with its day, kept live.
  Stream<LearningActivity> watchActivity();

  Future<Goal?> findGoal(String id);

  Future<Result<Goal>> addGoal(GoalDraft draft);

  Future<Result<Goal>> updateGoal(String id, GoalDraft draft);

  /// Deletes a goal and its check-ins.
  Future<Result<void>> deleteGoal(String id);

  /// One check-in on [goalId], today.
  Future<Result<void>> checkIn(String goalId);

  /// Removes the latest check-in of [goalId] on or after [from].
  Future<Result<void>> undoCheckIn(String goalId, {required CalendarDate from});
}
