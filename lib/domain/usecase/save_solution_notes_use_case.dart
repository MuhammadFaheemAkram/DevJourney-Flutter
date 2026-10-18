import 'package:characters/characters.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:injectable/injectable.dart';

/// Saves a challenge's solution notes, as typed (at most 10 000 characters).
@injectable
class SaveSolutionNotesUseCase {
  const SaveSolutionNotesUseCase(this._challenges);

  final ChallengesRepository _challenges;

  Future<Result<void>> call(String id, String notes) async {
    if (notes.characters.length > ChallengeProgress.maxSolutionNotesLength) {
      return const Err(
        InvalidInputException(
          'Solution notes are limited to '
          '${ChallengeProgress.maxSolutionNotesLength} characters',
        ),
      );
    }
    return _challenges.saveSolutionNotes(id, notes);
  }
}
