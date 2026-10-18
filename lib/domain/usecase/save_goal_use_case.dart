import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';

/// Adds a goal, or updates [id]'s, with its title trimmed. Invalid input is
/// refused (the sheet checks first).
@injectable
class SaveGoalUseCase {
  const SaveGoalUseCase(this._goals);

  final GoalsRepository _goals;

  Future<Result<Goal>> call(GoalDraft draft, {String? id}) async {
    final error = goalTitleError(draft.title) ?? goalTargetError(draft.target);
    if (error != null) return Err(InvalidInputException(error));
    final tidy = draft.copyWith(title: draft.title.trim());
    return id == null ? _goals.addGoal(tidy) : _goals.updateGoal(id, tidy);
  }
}
