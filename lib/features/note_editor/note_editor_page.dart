import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:material_ui/material_ui.dart';

/// The note editor, as a full-screen dialog: new, or editing [noteId]. A
/// placeholder until Phase 4.
///
/// Its Close button is always there (an app bar adds one only when it can
/// pop), and for a deep link with nothing underneath it goes to Notes
/// instead of popping the router's last page (conventions §11.47).
class NoteEditorPage extends StatelessWidget {
  const NoteEditorPage({super.key, this.noteId});

  final String? noteId;

  void _close(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      const NotesRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(onPressed: () => _close(context)),
        title: Text(noteId == null ? 'New note' : 'Edit note'),
      ),
      body: const EmptyStateView(
        icon: Icons.edit_note,
        title: 'Note editor',
        message: 'Writing Markdown notes arrives in Phase 4.',
      ),
    );
  }
}
