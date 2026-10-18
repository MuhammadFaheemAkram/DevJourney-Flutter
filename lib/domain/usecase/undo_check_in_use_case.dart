import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';

/// −1 on a custom goal: the latest check-in of its current window goes.
@injectable
class UndoCheckInUseCase {
  const UndoCheckInUseCase(this._goals);

  final GoalsRepository _goals;

  Future<Result<void>> call(GoalProgress progress) =>
      _goals.undoCheckIn(progress.goal.id, from: progress.window.start);
}
