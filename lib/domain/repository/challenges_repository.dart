import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';

/// Challenges and the user's progress on them.
abstract interface class ChallengesRepository {
  /// Every challenge in catalog order, kept live.
  Stream<List<ChallengeItem>> watchChallenges();

  /// One challenge; `null` if it isn't in the catalog.
  Stream<ChallengeItem?> watchChallenge(String id);

  /// The challenges worked on last, latest first.
  Stream<List<ChallengeItem>> watchRecent({required int limit});

  /// Moves a challenge to [status]. Done records today (the first time);
  /// leaving Done clears it; going back to To do clears the start too.
  Future<Result<void>> setStatus(String id, ChallengeStatus status);

  Future<Result<void>> saveSolutionNotes(String id, String notes);
}
