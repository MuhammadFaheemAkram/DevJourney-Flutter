import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/notes/cubit/notes_cubit.dart';
import 'package:dev_journey/features/notes/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Notes (from the drawer).
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotesCubit>()..load(),
      child: const NotesView(),
    );
  }
}
