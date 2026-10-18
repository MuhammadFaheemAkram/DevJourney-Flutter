import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:injectable/injectable.dart';

/// Completes every open topic of a section (today), or uncompletes them
/// all; returns how many changed.
@injectable
class SetSectionCompletedUseCase {
  const SetSectionCompletedUseCase(this._progress);

  final ProgressRepository _progress;

  Future<Result<int>> call(String sectionId, {required bool completed}) =>
      completed
      ? _progress.completeSection(sectionId)
      : _progress.uncompleteSection(sectionId);
}
