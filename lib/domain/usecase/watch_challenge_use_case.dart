import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchChallengeUseCase {
  const WatchChallengeUseCase(this._challenges);

  final ChallengesRepository _challenges;

  Stream<ChallengeItem?> call(String id) => _challenges.watchChallenge(id);
}
