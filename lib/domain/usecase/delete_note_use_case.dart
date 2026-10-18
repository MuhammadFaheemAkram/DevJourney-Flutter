import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

/// Deletes a note and hands it back for Undo.
@injectable
class DeleteNoteUseCase {
  const DeleteNoteUseCase(this._notes);

  final NotesRepository _notes;

  Future<Result<Note>> call(String id) => _notes.deleteNote(id);
}
