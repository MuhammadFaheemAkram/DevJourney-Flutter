import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/features/note_editor/open_note_editor.dart';
import 'package:dev_journey/features/notes/cubit/notes_cubit.dart';
import 'package:dev_journey/features/notes/cubit/notes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Every note, searchable: swipe one away to delete it (with Undo), tap to
/// edit, or write a new one.
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final _search = TextEditingController(
    text: context.read<NotesCubit>().state.query,
  );

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotesCubit>();
    final state = context.watch<NotesCubit>().state;
    return MultiBlocListener(
      listeners: [
        BlocListener<NotesCubit, NotesState>(
          listenWhen: (previous, current) =>
              previous.deletedSerial != current.deletedSerial,
          listener: (context, state) {
            final deleted = state.deleted;
            if (deleted == null) return;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Deleted “${deleted.title}”'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () => cubit.restore(deleted),
                  ),
                ),
              );
          },
        ),
        BlocListener<NotesCubit, NotesState>(
          listenWhen: (previous, current) =>
              previous.errorSerial != current.errorSerial,
          listener: (context, state) => ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMessage ?? ''))),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: fallbackCloseButton(
            context,
            () => const DashboardRoute().go(context),
          ),
          title: const Text('Notes'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => openNoteEditor(context),
          icon: const Icon(Icons.edit_outlined),
          label: const Text('New note'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.medium,
                AppSpacing.xSmall,
                AppSpacing.medium,
                AppSpacing.xSmall,
              ),
              child: AppSearchField(
                controller: _search,
                hintText: 'Search notes',
                onChanged: cubit.search,
                onCleared: () => cubit.search(''),
              ),
            ),
            Expanded(child: _Body(state: state)),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final NotesState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotesCubit>();
    return switch (state.status) {
      NotesStatus.loading => const LoadingView(),
      NotesStatus.failure => const ErrorView(
        message: "Couldn't read your notes.",
      ),
      NotesStatus.ready when state.notes.isEmpty && state.query.isNotEmpty =>
        const EmptyStateView(
          icon: Icons.search_off,
          title: 'No notes match',
          message: 'Try other words.',
        ),
      NotesStatus.ready when state.notes.isEmpty => EmptyStateView(
        icon: Icons.sticky_note_2_outlined,
        title: 'No notes yet',
        message:
            'Write down what you learn, in Markdown, and attach it to a '
            'topic.',
        action: FilledButton.tonal(
          onPressed: () => openNoteEditor(context),
          child: const Text('Write a note'),
        ),
      ),
      NotesStatus.ready => ListView.separated(
        // Room for the FAB over the last note.
        padding: const EdgeInsets.only(bottom: 88),
        itemCount: state.notes.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = state.notes[index];
          return Dismissible(
            key: ValueKey(item.note.id),
            direction: DismissDirection.endToStart,
            background: const _DeleteBackground(),
            onDismissed: (_) => cubit.delete(item),
            child: NoteRow(
              item: item,
              now: state.now,
              onTap: () => openNoteEditor(context, noteId: item.note.id),
            ),
          );
        },
      ),
    };
  }
}

/// Behind a row being swiped away: what the swipe does.
class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: scheme.errorContainer,
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.large),
          child: Icon(Icons.delete_outline, color: scheme.onErrorContainer),
        ),
      ),
    );
  }
}
