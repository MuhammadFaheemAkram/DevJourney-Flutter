import 'dart:async';

import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/usecase/save_solution_notes_use_case.dart';
import 'package:dev_journey/domain/usecase/set_challenge_status_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_challenge_use_case.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// One challenge: its status, hints one at a time, and solution notes saved
/// as the user types.
///
/// Notes save after a pause in typing ([notesDelay]), not on every key: one
/// write per pause instead of one per character. Leaving the screen saves
/// at once whatever is still waiting (`close`), so nothing typed is lost.
@injectable
class ChallengeDetailCubit extends Cubit<ChallengeDetailState> {
  ChallengeDetailCubit(
    this._watchChallenge,
    this._setStatus,
    this._saveNotes,
    @factoryParam this.challengeId, {
    @ignoreParam this.notesDelay = const Duration(milliseconds: 800),
  }) : super(const ChallengeDetailState());

  final WatchChallengeUseCase _watchChallenge;
  final SetChallengeStatusUseCase _setStatus;
  final SaveSolutionNotesUseCase _saveNotes;
  final String challengeId;
  final Duration notesDelay;

  StreamSubscription<ChallengeItem?>? _challenge;
  Timer? _pendingSave;

  void load() {
    _challenge ??= _watchChallenge(challengeId).listen((item) {
      if (item == null) {
        emit(state.copyWith(status: ChallengeDetailStatus.notFound));
        return;
      }
      final first = state.item == null;
      emit(
        state.copyWith(
          status: ChallengeDetailStatus.found,
          item: item,
          // The field starts from the saved notes; after that it's the
          // user's text that leads, and a save echoing back changes nothing.
          notes: first ? item.progress.solutionNotes : state.notes,
        ),
      );
    });
  }

  Future<void> setStatus(ChallengeStatus status) async =>
      _report(await _setStatus(challengeId, status));

  void showNextHint() {
    if (state.hintsShown < state.hintCount) {
      emit(state.copyWith(hintsShown: state.hintsShown + 1));
    }
  }

  void notesChanged(String notes) {
    if (notes == state.notes) return;
    emit(state.copyWith(notes: notes, notesSave: NotesSaveStatus.pending));
    _pendingSave?.cancel();
    _pendingSave = Timer(notesDelay, saveNotes);
  }

  /// Saves the notes now (also what the timer and leaving call).
  Future<void> saveNotes() async {
    _pendingSave?.cancel();
    _pendingSave = null;
    if (state.notesSave != NotesSaveStatus.pending) return;
    final notes = state.notes;
    if (!isClosed) emit(state.copyWith(notesSave: NotesSaveStatus.saving));
    final result = await _saveNotes(challengeId, notes);
    if (isClosed) return;
    // Typing during the save made it pending again: keep that.
    if (state.notesSave == NotesSaveStatus.saving) {
      emit(state.copyWith(notesSave: NotesSaveStatus.saved));
    }
    _report(result);
  }

  void _report(Result<void> result) {
    if (isClosed) return;
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          message: exception.message,
          messageSerial: state.messageSerial + 1,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _challenge?.cancel();
    if (_pendingSave != null) await saveNotes();
    return super.close();
  }
}
