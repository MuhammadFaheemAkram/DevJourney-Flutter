import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetChallengeStatusUseCase {
  const SetChallengeStatusUseCase(this._challenges);

  final ChallengesRepository _challenges;

  Future<Result<void>> call(String id, ChallengeStatus status) =>
      _challenges.setStatus(id, status);
}
