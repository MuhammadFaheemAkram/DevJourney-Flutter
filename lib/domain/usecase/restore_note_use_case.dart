import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

/// Undo: the same note back, with its id and times.
@injectable
class RestoreNoteUseCase {
  const RestoreNoteUseCase(this._notes);

  final NotesRepository _notes;

  Future<Result<void>> call(Note note) => _notes.restoreNote(note);
}
