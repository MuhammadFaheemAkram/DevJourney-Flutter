import 'dart:async';

import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/usecase/delete_note_use_case.dart';
import 'package:dev_journey/domain/usecase/find_note_use_case.dart';
import 'package:dev_journey/domain/usecase/save_note_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_topic_choices_use_case.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Writes a new note (attached to [topicId] when opened from a topic), or
/// edits [noteId]'s. The draft lives here, so the Edit and Preview tabs
/// show the same text, and the discard guard knows whether it changed.
@injectable
class NoteEditorCubit extends Cubit<NoteEditorState> {
  NoteEditorCubit(
    this._findNote,
    this._saveNote,
    this._deleteNote,
    this._watchTopics,
    @factoryParam this.noteId,
    @factoryParam this.topicId,
  ) : super(const NoteEditorState());

  final FindNoteUseCase _findNote;
  final SaveNoteUseCase _saveNote;
  final DeleteNoteUseCase _deleteNote;
  final WatchTopicChoicesUseCase _watchTopics;
  final String? noteId;
  final String? topicId;

  StreamSubscription<List<TopicChoice>>? _topics;

  bool get isNew => noteId == null;

  Future<void> load() async {
    _topics ??= _watchTopics().listen(
      (topics) => emit(state.copyWith(topics: topics)),
    );
    final id = noteId;
    if (id == null) {
      final draft = NoteDraft(title: '', content: '', topicId: topicId);
      emit(
        state.copyWith(
          status: NoteEditorStatus.editing,
          original: draft,
          draft: draft,
        ),
      );
      return;
    }
    final note = await _findNote(id);
    if (isClosed) return;
    if (note == null) {
      emit(state.copyWith(status: NoteEditorStatus.notFound));
      return;
    }
    final draft = NoteDraft(
      title: note.title,
      content: note.content,
      topicId: note.topicId,
    );
    emit(
      state.copyWith(
        status: NoteEditorStatus.editing,
        original: draft,
        draft: draft,
      ),
    );
  }

  void titleChanged(String title) =>
      emit(state.copyWith(draft: state.draft.copyWith(title: title)));

  void contentChanged(String content) =>
      emit(state.copyWith(draft: state.draft.copyWith(content: content)));

  void topicChanged(String? topicId) =>
      emit(state.copyWith(draft: state.draft.copyWith(topicId: topicId)));

  /// Saves, unless there's nothing to save: an untouched note just closes,
  /// and an empty new note is discarded rather than saved.
  Future<void> save() async {
    if (state.saving) return;
    if (!state.isDirty || (isNew && state.isBlank)) {
      emit(state.copyWith(exit: const NoteDiscarded()));
      return;
    }
    final draft = state.draft;
    if (noteTitleError(draft.title) != null ||
        noteContentError(draft.content) != null) {
      emit(state.copyWith(showErrors: true));
      return;
    }
    emit(state.copyWith(saving: true));
    final result = await _saveNote(draft, id: noteId);
    if (isClosed) return;
    switch (result) {
      case Ok():
        emit(state.copyWith(saving: false, exit: const NoteSaved()));
      case Err(:final exception):
        _fail(exception.message);
    }
  }

  /// Leaves without saving (after the user confirmed the discard).
  void discard() => emit(state.copyWith(exit: const NoteDiscarded()));

  Future<void> delete() async {
    final id = noteId;
    if (id == null || state.saving) return;
    emit(state.copyWith(saving: true));
    final result = await _deleteNote(id);
    if (isClosed) return;
    switch (result) {
      case Ok(:final value):
        emit(state.copyWith(saving: false, exit: NoteDeleted(value)));
      case Err(:final exception):
        _fail(exception.message);
    }
  }

  void _fail(String message) => emit(
    state.copyWith(
      saving: false,
      errorMessage: message,
      errorSerial: state.errorSerial + 1,
    ),
  );

  @override
  Future<void> close() async {
    await _topics?.cancel();
    return super.close();
  }
}
