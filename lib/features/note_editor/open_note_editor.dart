import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/usecase/restore_note_use_case.dart';
import 'package:material_ui/material_ui.dart';

/// Opens the editor: a new note (attached to [topicId], if given) or
/// [noteId]'s. If the note is deleted there, the screen it was opened from
/// shows "Deleted" with Undo, wherever that is (Notes, a topic, the
/// Dashboard).
Future<void> openNoteEditor(
  BuildContext context, {
  String? noteId,
  String? topicId,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  final deleted = noteId == null
      ? await NewNoteRoute(topicId: topicId).push<Note>(context)
      : await NoteEditorRoute(noteId: noteId).push<Note>(context);
  if (deleted == null) return;
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text('Deleted “${deleted.title}”'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => getIt<RestoreNoteUseCase>()(deleted),
        ),
      ),
    );
}
