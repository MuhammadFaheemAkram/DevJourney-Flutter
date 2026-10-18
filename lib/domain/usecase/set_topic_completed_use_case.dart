import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:injectable/injectable.dart';

/// Marks a topic completed (today) or not.
@injectable
class SetTopicCompletedUseCase {
  const SetTopicCompletedUseCase(this._progress);

  final ProgressRepository _progress;

  Future<Result<void>> call(String topicId, {required bool completed}) =>
      completed
      ? _progress.completeTopic(topicId)
      : _progress.uncompleteTopic(topicId);
}
