import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/note.dart';

/// The user's notes.
abstract interface class NotesRepository {
  /// Notes, the most recently edited first; [query] matches titles and
  /// contents; [topicId] narrows to one topic's. Kept live.
  Stream<List<NoteItem>> watchNotes({String query = '', String? topicId});

  Future<Note?> findNote(String id);

  Future<Result<Note>> addNote(NoteDraft draft);

  /// Changes a note; its creation time stays, its edit time is now.
  Future<Result<Note>> updateNote(String id, NoteDraft draft);

  /// Deletes a note and returns it, so Undo can put it back.
  Future<Result<Note>> deleteNote(String id);

  /// Puts back a deleted note: the same id and times.
  Future<Result<void>> restoreNote(Note note);
}
