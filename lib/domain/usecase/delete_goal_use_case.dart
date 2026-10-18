import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteGoalUseCase {
  const DeleteGoalUseCase(this._goals);

  final GoalsRepository _goals;

  Future<Result<void>> call(String id) => _goals.deleteGoal(id);
}
