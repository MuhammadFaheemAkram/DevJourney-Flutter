import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/features/note_editor/open_note_editor.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_cubit.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// A topic: where it sits, how hard and long it is, what it teaches, the
/// buttons to bookmark and complete it, and the user's notes on it. (Its
/// resources join in Phase 5.)
class TopicDetailView extends StatelessWidget {
  const TopicDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TopicDetailCubit>();
    final state = context.watch<TopicDetailCubit>().state;
    final item = state.details?.item;
    return BlocListener<TopicDetailCubit, TopicDetailState>(
      listenWhen: (previous, current) =>
          previous.errorSerial != current.errorSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.errorMessage ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: fallbackCloseButton(
            context,
            () => const RoadmapsRoute().go(context),
          ),
          title: const Text('Topic'),
          actions: [
            if (item != null)
              IconButton(
                tooltip: item.bookmarked ? 'Remove bookmark' : 'Bookmark',
                isSelected: item.bookmarked,
                icon: const Icon(Icons.bookmark_border),
                selectedIcon: const Icon(Icons.bookmark),
                onPressed: cubit.toggleBookmark,
              ),
          ],
        ),
        body: switch (state.status) {
          TopicDetailStatus.loading => const LoadingView(),
          TopicDetailStatus.notFound => EmptyStateView(
            icon: Icons.search_off,
            title: 'This topic no longer exists',
            message: 'It may have been removed from the catalog.',
            action: FilledButton.tonal(
              onPressed: () => const RoadmapsRoute().go(context),
              child: const Text('See all roadmaps'),
            ),
          ),
          TopicDetailStatus.found => _Details(
            details: state.details!,
            state: state,
          ),
        },
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.details, required this.state});

  final TopicDetails details;
  final TopicDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<TopicDetailCubit>();
    final item = details.item;
    final topic = item.topic;
    final completedOn = item.completedOn;
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.medium),
      children: [
        Semantics(
          label: 'In ${details.roadmap.title}, ${details.section.title}',
          excludeSemantics: true,
          child: Text(
            '${details.roadmap.title} › ${details.section.title}',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxSmall),
        Text(topic.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.xSmall,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            DifficultyChip(difficulty: topic.difficulty),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.schedule,
                  size: 18,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: AppSpacing.xxSmall),
                Text(minutesLabel(topic.estimatedMinutes)),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.medium),
        Text(topic.description, style: theme.textTheme.bodyLarge),
        if (topic.objectives.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.large),
          Semantics(
            header: true,
            child: Text(
              "What you'll learn",
              style: theme.textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          for (final objective in topic.objectives)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExcludeSemantics(
                    child: Icon(
                      Icons.arrow_right,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xxSmall),
                  Expanded(
                    child: Text(objective, style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
        ],
        const SizedBox(height: AppSpacing.xLarge),
        if (completedOn == null)
          FilledButton.icon(
            onPressed: cubit.toggleCompleted,
            icon: const Icon(Icons.check),
            label: const Text('Mark complete'),
          )
        else ...[
          FilledButton.tonalIcon(
            onPressed: cubit.toggleCompleted,
            icon: Icon(Icons.check_circle, color: context.appColors.success),
            label: const Text('Completed · tap to undo'),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            'Completed ${_dayPhrase(DateLabels.day(completedOn, today: state.today))}',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.large),
        _TopicNotes(state: state, topicId: topic.id),
      ],
    );
  }

  /// "today", "yesterday", "on Mon, 12 Oct".
  static String _dayPhrase(String label) => switch (label) {
    'Today' || 'Yesterday' => label.toLowerCase(),
    _ => 'on $label',
  };
}

/// The notes on this topic, and Add note (attached to it).
class _TopicNotes extends StatelessWidget {
  const _TopicNotes({required this.state, required this.topicId});

  final TopicDetailState state;
  final String topicId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(
                header: true,
                child: Text('Your notes', style: theme.textTheme.titleMedium),
              ),
            ),
            TextButton.icon(
              onPressed: () => openNoteEditor(context, topicId: topicId),
              icon: const Icon(Icons.add),
              label: const Text('Add note'),
            ),
          ],
        ),
        if (state.notes.isEmpty)
          Text(
            'Nothing yet. Notes you attach to this topic show here.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          )
        else
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (final (index, item) in state.notes.indexed) ...[
                  if (index > 0) const Divider(height: 1),
                  NoteRow(
                    item: item,
                    now: state.now,
                    showTopic: false,
                    onTap: () => openNoteEditor(context, noteId: item.note.id),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
