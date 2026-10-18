import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_cubit.dart';
import 'package:dev_journey/features/note_editor/note_editor_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// The note editor, as a full-screen dialog: new (attached to [topicId]
/// when opened from a topic), or editing [noteId].
class NoteEditorPage extends StatelessWidget {
  const NoteEditorPage({super.key, this.noteId, this.topicId});

  final String? noteId;
  final String? topicId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<NoteEditorCubit>(param1: noteId, param2: topicId)..load(),
      child: const NoteEditorView(),
    );
  }
}
