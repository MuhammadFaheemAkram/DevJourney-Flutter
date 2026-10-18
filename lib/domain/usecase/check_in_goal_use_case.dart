import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';

/// +1 on a custom goal, today. A goal already met for its window takes no
/// more (check-ins never exceed the target), and an automatic goal takes
/// none: it counts completions by itself.
@injectable
class CheckInGoalUseCase {
  const CheckInGoalUseCase(this._goals);

  final GoalsRepository _goals;

  Future<Result<void>> call(GoalProgress progress) async {
    if (progress.goal.isAutomatic) return const Err(AutomaticGoalException());
    if (progress.isMet) return const Err(GoalAlreadyMetException());
    return _goals.checkIn(progress.goal.id);
  }
}
