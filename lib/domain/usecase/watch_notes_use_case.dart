import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchNotesUseCase {
  const WatchNotesUseCase(this._notes);

  final NotesRepository _notes;

  Stream<List<NoteItem>> call({String query = '', String? topicId}) =>
      _notes.watchNotes(query: query, topicId: topicId);
}
