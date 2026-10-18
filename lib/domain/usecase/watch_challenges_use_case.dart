import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchChallengesUseCase {
  const WatchChallengesUseCase(this._challenges);

  final ChallengesRepository _challenges;

  Stream<List<ChallengeItem>> call() => _challenges.watchChallenges();
}
