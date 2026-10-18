import 'dart:async';

import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/usecase/delete_note_use_case.dart';
import 'package:dev_journey/domain/usecase/restore_note_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_notes_use_case.dart';
import 'package:dev_journey/features/notes/cubit/notes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The notes, newest edit first, narrowed by a search. Searching swaps the
/// live query (a local `LIKE` is cheap, so there's no debounce); deleting
/// hides the row at once and offers Undo.
@injectable
class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this._watchNotes, this._delete, this._restore, this._clock)
    : super(NotesState(now: _clock.now()));

  final WatchNotesUseCase _watchNotes;
  final DeleteNoteUseCase _delete;
  final RestoreNoteUseCase _restore;
  final Clock _clock;

  StreamSubscription<List<NoteItem>>? _notes;

  void load() {
    if (_notes == null) _watch();
  }

  Future<void> search(String query) async {
    if (query.trim() == state.query) return;
    emit(state.copyWith(query: query.trim()));
    await _notes?.cancel();
    _watch();
  }

  void _watch() {
    _notes = _watchNotes(query: state.query).listen(
      (notes) => emit(
        state.copyWith(
          status: NotesStatus.ready,
          notes: notes,
          now: _clock.now(),
        ),
      ),
      onError: (Object _) => emit(state.copyWith(status: NotesStatus.failure)),
    );
  }

  /// Deletes [item]'s note. The row goes from the list straight away (a
  /// swiped `Dismissible` must leave the tree in the same frame), and comes
  /// back if the delete fails.
  Future<void> delete(NoteItem item) async {
    final before = state.notes;
    emit(state.copyWith(notes: [...before]..remove(item)));
    final result = await _delete(item.note.id);
    if (isClosed) return;
    switch (result) {
      case Ok(:final value):
        emit(
          state.copyWith(
            deleted: value,
            deletedSerial: state.deletedSerial + 1,
          ),
        );
      case Err(:final exception):
        emit(
          state.copyWith(
            notes: before,
            errorMessage: exception.message,
            errorSerial: state.errorSerial + 1,
          ),
        );
    }
  }

  /// Undo: the same note back, with its id and times.
  Future<void> restore(Note note) async {
    final result = await _restore(note);
    if (isClosed) return;
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          errorMessage: exception.message,
          errorSerial: state.errorSerial + 1,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _notes?.cancel();
    return super.close();
  }
}
