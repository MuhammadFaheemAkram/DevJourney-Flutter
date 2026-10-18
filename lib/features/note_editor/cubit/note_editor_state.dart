import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_editor_state.freezed.dart';

enum NoteEditorStatus { loading, editing, notFound }

/// How the editor closed: the page pops when one is set.
sealed class NoteEditorExit {
  const NoteEditorExit();
}

final class NoteSaved extends NoteEditorExit {
  const NoteSaved();
}

/// Left without saving: nothing changed, an empty new note, or the user
/// chose to discard their edits.
final class NoteDiscarded extends NoteEditorExit {
  const NoteDiscarded();
}

/// Carries the note, so the screen underneath can offer Undo.
final class NoteDeleted extends NoteEditorExit {
  const NoteDeleted(this.note);

  final Note note;
}

@freezed
abstract class NoteEditorState with _$NoteEditorState {
  const factory NoteEditorState({
    @Default(NoteEditorStatus.loading) NoteEditorStatus status,

    /// What the note was when opened (empty for a new one), to tell whether
    /// anything changed.
    @Default(NoteDraft(title: '', content: '')) NoteDraft original,
    @Default(NoteDraft(title: '', content: '')) NoteDraft draft,

    /// Every topic a note can be attached to.
    @Default(<TopicChoice>[]) List<TopicChoice> topics,

    /// Errors show under the fields only after a first Save.
    @Default(false) bool showErrors,
    @Default(false) bool saving,
    NoteEditorExit? exit,
    String? errorMessage,
    @Default(0) int errorSerial,
  }) = _NoteEditorState;

  const NoteEditorState._();

  bool get isDirty => draft != original;

  bool get isBlank =>
      draft.title.trim().isEmpty && draft.content.trim().isEmpty;

  String? get titleError => showErrors ? noteTitleError(draft.title) : null;

  String? get contentError => noteContentError(draft.content);

  TopicChoice? get topic {
    for (final topic in topics) {
      if (topic.id == draft.topicId) return topic;
    }
    return null;
  }
}
