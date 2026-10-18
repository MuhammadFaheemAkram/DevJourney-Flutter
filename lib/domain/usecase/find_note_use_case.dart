import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindNoteUseCase {
  const FindNoteUseCase(this._notes);

  final NotesRepository _notes;

  Future<Note?> call(String id) => _notes.findNote(id);
}
