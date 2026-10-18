import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_cubit.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_state.dart';
import 'package:dev_journey/features/note_editor/widgets/topic_picker_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// A note's title, Markdown and topic, with Edit and Preview tabs.
///
/// - **Save** in the app bar; an untouched note just closes, an empty new
///   one is discarded.
/// - **Discard guard:** Close, Back or the Android back gesture asks before
///   throwing edits away (`PopScope`).
/// - **Delete** (existing notes) closes, and the screen underneath offers
///   Undo.
class NoteEditorView extends StatelessWidget {
  const NoteEditorView({super.key});

  /// Pops with the deleted note (for Undo underneath), or goes to Notes
  /// when the editor was opened by a link and is the only page
  /// (conventions §11.47).
  static void _leave(BuildContext context, [Note? deleted]) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop(deleted);
    } else {
      const NotesRoute().go(context);
    }
  }

  /// Close, Back: asks first when there are unsaved edits.
  static Future<void> _close(BuildContext context) async {
    final cubit = context.read<NoteEditorCubit>();
    if (!cubit.state.isDirty) {
      _leave(context);
      return;
    }
    final discard = await showConfirmDialog(
      context,
      title: 'Discard changes?',
      message: 'Your edits to this note will be lost.',
      confirmLabel: 'Discard',
      destructive: true,
    );
    if (discard && context.mounted) cubit.discard();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteEditorCubit>();
    final state = context.watch<NoteEditorCubit>().state;
    final editing = state.status == NoteEditorStatus.editing;
    return MultiBlocListener(
      listeners: [
        BlocListener<NoteEditorCubit, NoteEditorState>(
          listenWhen: (previous, current) =>
              previous.exit == null && current.exit != null,
          // `Navigator.pop` isn't blocked by `PopScope` (only
          // `maybePop` and the system back are), so leaving works
          // even before the guard rebuilds.
          listener: (context, state) => switch (state.exit) {
            NoteDeleted(:final note) => _leave(context, note),
            _ => _leave(context),
          },
        ),
        BlocListener<NoteEditorCubit, NoteEditorState>(
          listenWhen: (previous, current) =>
              previous.errorSerial != current.errorSerial,
          listener: (context, state) => ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMessage ?? ''))),
        ),
      ],
      child: PopScope<Object?>(
        canPop: !state.isDirty || state.exit != null,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _close(context);
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: CloseButton(onPressed: () => _close(context)),
              title: Text(cubit.isNew ? 'New note' : 'Edit note'),
              actions: [
                if (editing && !cubit.isNew)
                  IconButton(
                    tooltip: 'Delete note',
                    onPressed: state.saving ? null : cubit.delete,
                    icon: const Icon(Icons.delete_outline),
                  ),
                if (editing)
                  TextButton(
                    onPressed: state.saving ? null : cubit.save,
                    child: const Text('Save'),
                  ),
              ],
              bottom: editing
                  ? const TabBar(
                      tabs: [
                        Tab(text: 'Edit'),
                        Tab(text: 'Preview'),
                      ],
                    )
                  : null,
            ),
            body: switch (state.status) {
              NoteEditorStatus.loading => const LoadingView(),
              NoteEditorStatus.notFound => EmptyStateView(
                icon: Icons.search_off,
                title: 'This note no longer exists',
                message: 'It may have been deleted.',
                action: FilledButton.tonal(
                  onPressed: () => const NotesRoute().go(context),
                  child: const Text('See all notes'),
                ),
              ),
              NoteEditorStatus.editing => const TabBarView(
                children: [_EditTab(), _PreviewTab()],
              ),
            },
          ),
        ),
      ),
    );
  }
}

/// The fields. Their controllers start from the loaded draft and report
/// every change to the Cubit, which owns the draft.
class _EditTab extends StatefulWidget {
  const _EditTab();

  @override
  State<_EditTab> createState() => _EditTabState();
}

class _EditTabState extends State<_EditTab> with AutomaticKeepAliveClientMixin {
  late final NoteEditorCubit _cubit = context.read<NoteEditorCubit>();
  late final _title = TextEditingController(text: _cubit.state.draft.title);
  late final _content = TextEditingController(text: _cubit.state.draft.content);

  // Keeps the cursor and scroll position while Preview is shown.
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  Future<void> _pickTopic(NoteEditorState state) async {
    final picked = await showAppSheet<TopicPick>(
      context,
      (_) => TopicPickerSheet(
        topics: state.topics,
        selectedId: state.draft.topicId,
      ),
    );
    if (picked != null) _cubit.topicChanged(picked.topicId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = context.watch<NoteEditorCubit>().state;
    final topic = state.topic;
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.medium),
      children: [
        TextField(
          controller: _title,
          autofocus: _cubit.isNew && state.draft.topicId == null,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          onChanged: _cubit.titleChanged,
          decoration: InputDecoration(
            labelText: 'Title',
            errorText: state.titleError,
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Semantics(
          button: true,
          label: topic == null
              ? 'Topic: none. Attach a topic'
              : 'Topic: ${topic.title}. Change topic',
          excludeSemantics: true,
          child: InkWell(
            onTap: () => _pickTopic(state),
            borderRadius: BorderRadius.circular(AppRadius.small),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Topic',
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              child: Text(
                topic == null
                    ? 'None'
                    : '${topic.title} · ${topic.roadmapTitle}',
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        TextField(
          controller: _content,
          minLines: 10,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textCapitalization: TextCapitalization.sentences,
          onChanged: _cubit.contentChanged,
          decoration: InputDecoration(
            labelText: 'Note',
            alignLabelWithHint: true,
            hintText: '# Heading\n\n**Bold**, *italic*, `code`\n\n- A list',
            helperText: 'Markdown: see it in Preview',
            errorText: state.contentError,
          ),
        ),
      ],
    );
  }
}

/// The note as it will read: the title, then the rendered Markdown.
class _PreviewTab extends StatelessWidget {
  const _PreviewTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final draft = context.select((NoteEditorCubit cubit) => cubit.state.draft);
    final title = draft.title.trim();
    if (title.isEmpty && draft.content.trim().isEmpty) {
      return const EmptyStateView(
        icon: Icons.preview_outlined,
        title: 'Nothing to preview yet',
        message: 'Write something in Edit first.',
      );
    }
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.medium),
      children: [
        if (title.isNotEmpty) ...[
          Text(title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.medium),
        ],
        NoteMarkdown(
          data: draft.content,
          onTapLink: context.read<NoteEditorCubit>().openLink,
        ),
      ],
    );
  }
}
