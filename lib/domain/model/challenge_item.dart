import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_item.freezed.dart';

/// The user's work on a challenge. An untouched challenge has the defaults:
/// to do, no notes.
@freezed
abstract class ChallengeProgress with _$ChallengeProgress {
  const factory ChallengeProgress({
    @Default(ChallengeStatus.todo) ChallengeStatus status,
    @Default('') String solutionNotes,

    /// When it first went in progress.
    DateTime? startedAt,

    /// The day it was done: it counts for the streak and challenge goals.
    CalendarDate? completedOn,

    /// The last change, for "recent challenges".
    DateTime? updatedAt,
  }) = _ChallengeProgress;

  static const maxSolutionNotesLength = 10000;
}

/// A challenge with the user's progress on it.
@freezed
abstract class ChallengeItem with _$ChallengeItem {
  const factory ChallengeItem({
    required Challenge challenge,
    @Default(ChallengeProgress()) ChallengeProgress progress,
  }) = _ChallengeItem;

  const ChallengeItem._();

  ChallengeStatus get status => progress.status;
}
