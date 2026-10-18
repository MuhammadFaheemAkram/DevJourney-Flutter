import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

/// Adds a note, or updates [id]'s. The title is trimmed; the content keeps
/// its inner formatting (Markdown cares about blank lines), losing only
/// trailing blank space. Invalid input is refused (the editor checks first).
@injectable
class SaveNoteUseCase {
  const SaveNoteUseCase(this._notes);

  final NotesRepository _notes;

  Future<Result<Note>> call(NoteDraft draft, {String? id}) async {
    final error =
        noteTitleError(draft.title) ?? noteContentError(draft.content);
    if (error != null) return Err(InvalidInputException(error));
    final tidy = draft.copyWith(
      title: draft.title.trim(),
      content: draft.content.trimRight(),
    );
    return id == null ? _notes.addNote(tidy) : _notes.updateNote(id, tidy);
  }
}
