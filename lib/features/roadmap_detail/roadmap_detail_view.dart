import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_state.dart';
import 'package:dev_journey/features/roadmap_detail/widgets/learning_path_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// A roadmap: its progress, and its learning path of sections and topics.
class RoadmapDetailView extends StatelessWidget {
  const RoadmapDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RoadmapDetailCubit>().state;
    final path = state.path;
    return BlocListener<RoadmapDetailCubit, RoadmapDetailState>(
      listenWhen: (previous, current) =>
          previous.messageSerial != current.messageSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.message ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: fallbackCloseButton(
            context,
            () => const RoadmapsRoute().go(context),
          ),
          title: Text(path?.roadmap.title ?? 'Roadmap'),
        ),
        body: switch (state.status) {
          RoadmapDetailStatus.loading => const LoadingView(),
          RoadmapDetailStatus.notFound => EmptyStateView(
            icon: Icons.search_off,
            title: 'This roadmap no longer exists',
            message: 'It may have been removed from the catalog.',
            action: FilledButton.tonal(
              onPressed: () => const RoadmapsRoute().go(context),
              child: const Text('See all roadmaps'),
            ),
          ),
          RoadmapDetailStatus.found => _Path(state: state, path: path!),
        },
      ),
    );
  }
}

class _Path extends StatelessWidget {
  const _Path({required this.state, required this.path});

  final RoadmapDetailState state;
  final RoadmapPath path;

  @override
  Widget build(BuildContext context) {
    final sections = path.sections;
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xLarge),
      children: [
        _Header(path: path, isActive: state.isActive),
        const SectionHeader('Learning path'),
        for (final (index, section) in sections.indexed)
          LearningPathSection(
            section: section,
            number: index + 1,
            count: sections.length,
            isFirst: index == 0,
            isLast: index == sections.length - 1,
            expanded: state.expandedSectionIds.contains(section.section.id),
          ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.path, required this.isActive});

  final RoadmapPath path;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<RoadmapDetailCubit>();
    final summary = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${path.completedTopics} of '
          '${countLabel(path.totalTopics, 'topic')} completed',
          style: theme.textTheme.titleMedium,
        ),
        Text(
          '${path.roadmap.category.label} · '
          '${countLabel(path.sections.length, 'section')}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(path.roadmap.description, style: theme.textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.medium),
          if (context.prefersStackedLayout) ...[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: ProgressRing(ratio: path.ratio),
            ),
            const SizedBox(height: AppSpacing.small),
            summary,
          ] else
            Row(
              children: [
                ProgressRing(ratio: path.ratio),
                const SizedBox(width: AppSpacing.medium),
                Expanded(child: summary),
              ],
            ),
          const SizedBox(height: AppSpacing.medium),
          if (isActive)
            Row(
              children: [
                Icon(Icons.check, color: theme.colorScheme.primary),
                const SizedBox(width: AppSpacing.xSmall),
                Expanded(
                  child: Text(
                    'Your active roadmap',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          else
            FilledButton.tonal(
              onPressed: cubit.setActive,
              child: const Text('Set as active roadmap'),
            ),
        ],
      ),
    );
  }
}
