import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenges_state.freezed.dart';

enum ChallengesStatus { loading, ready, failure }

@freezed
abstract class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    @Default(ChallengesStatus.loading) ChallengesStatus status,
    @Default(<ChallengeItem>[]) List<ChallengeItem> challenges,

    /// `null`: every difficulty.
    Difficulty? difficulty,

    /// `null`: every status.
    ChallengeStatus? challengeStatus,
  }) = _ChallengesState;

  const ChallengesState._();

  /// The challenges both filters let through, in catalog order.
  List<ChallengeItem> get visible => [
    for (final item in challenges)
      if ((difficulty == null || item.challenge.difficulty == difficulty) &&
          (challengeStatus == null || item.status == challengeStatus))
        item,
  ];

  bool get isFiltered => difficulty != null || challengeStatus != null;
}
