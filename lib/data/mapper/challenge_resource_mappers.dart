import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';

extension ChallengeRowMapping on ChallengeRow {
  Challenge toDomain() => Challenge(
    id: id,
    title: title,
    category: category,
    difficulty: difficulty,
    prompt: prompt,
    hints: hints,
  );
}

extension ChallengeStateRowMapping on ChallengeStateRow {
  ChallengeProgress toDomain() => ChallengeProgress(
    status: status,
    solutionNotes: solutionNotes,
    startedAt: startedAt,
    completedOn: completedOn,
    updatedAt: updatedAt,
  );
}

/// A challenge row and its state (if touched) as one item.
ChallengeItem challengeItem(ChallengeRow challenge, ChallengeStateRow? state) =>
    ChallengeItem(
      challenge: challenge.toDomain(),
      progress: state?.toDomain() ?? const ChallengeProgress(),
    );

extension ResourceRowMapping on ResourceRow {
  Resource toDomain() => Resource(
    id: id,
    title: title,
    type: type,
    url: url,
    source: source,
    estimatedMinutes: estimatedMinutes,
    topicId: topicId,
  );
}
