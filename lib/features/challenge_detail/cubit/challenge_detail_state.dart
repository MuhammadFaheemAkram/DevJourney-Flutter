import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_detail_state.freezed.dart';

enum ChallengeDetailStatus { loading, found, notFound }

/// Where the solution notes are: saved, waiting for the typing to pause, or
/// being written.
enum NotesSaveStatus { saved, pending, saving }

@freezed
abstract class ChallengeDetailState with _$ChallengeDetailState {
  const factory ChallengeDetailState({
    @Default(ChallengeDetailStatus.loading) ChallengeDetailStatus status,
    ChallengeItem? item,

    /// How many hints are showing: they're revealed one at a time, and stay
    /// hidden again next time (a hint is a nudge, not a setting).
    @Default(0) int hintsShown,

    /// The notes as typed (the field's text), which run ahead of what's saved.
    @Default('') String notes,
    @Default(NotesSaveStatus.saved) NotesSaveStatus notesSave,
    String? message,
    @Default(0) int messageSerial,
  }) = _ChallengeDetailState;

  const ChallengeDetailState._();

  int get hintCount => item?.challenge.hints.length ?? 0;
}
