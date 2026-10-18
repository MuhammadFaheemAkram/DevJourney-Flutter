import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// The Dashboard: the streak, the active roadmap and what to learn next,
/// and the totals. Phase 4 adds today's goals and recent notes, Phase 5
/// recent challenges.
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DashboardCubit>().state;
    final summary = state.summary;
    final errorMessage = state.errorMessage;
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () => const SearchRoute().push<void>(context),
          ),
        ],
      ),
      body: errorMessage != null
          ? ErrorView(message: errorMessage)
          : summary == null
          ? const LoadingView()
          : _Summary(summary: summary),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final path = summary.activeRoadmap;
    final next = summary.nextTopic;
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xLarge),
      children: [
        StreakBanner(streak: summary.streak),
        if (path == null)
          EmptyStateView(
            icon: Icons.route_outlined,
            title: 'No active roadmap',
            message: 'Pick a roadmap to follow here.',
            action: FilledButton.tonal(
              onPressed: () => const RoadmapsRoute().go(context),
              child: const Text('Browse roadmaps'),
            ),
          )
        else ...[
          const SectionHeader('Your roadmap'),
          _ActiveRoadmapCard(path: path, next: next),
          if (next != null) ...[
            const SectionHeader('Next up'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              child: TopicRow(
                item: next,
                onTap: () =>
                    TopicDetailRoute(topicId: next.topic.id)
                        .push<void>(context),
              ),
            ),
          ],
        ],
        const SectionHeader('So far'),
        _Totals(summary: summary),
      ],
    );
  }
}

/// The active roadmap's progress, with Continue to the next topic.
class _ActiveRoadmapCard extends StatelessWidget {
  const _ActiveRoadmapCard({required this.path, required this.next});

  final RoadmapPath path;
  final TopicItem? next;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final next = this.next;
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(path.roadmap.title, style: theme.textTheme.titleMedium),
        Text(
          '${path.completedTopics} of '
          '${countLabel(path.totalTopics, 'topic')} completed',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (context.prefersStackedLayout) ...[
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ProgressRing(ratio: path.ratio),
              ),
              const SizedBox(height: AppSpacing.small),
              details,
            ] else
              Row(
                children: [
                  ProgressRing(ratio: path.ratio),
                  const SizedBox(width: AppSpacing.medium),
                  Expanded(child: details),
                ],
              ),
            const SizedBox(height: AppSpacing.medium),
            if (next != null)
              FilledButton(
                onPressed: () =>
                    TopicDetailRoute(topicId: next.topic.id)
                        .push<void>(context),
                child: const Text('Continue'),
              )
            else
              Text(
                'Roadmap complete. Well done!',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: context.appColors.success,
                ),
              ),
            TextButton(
              onPressed: () =>
                  RoadmapDetailRoute(roadmapId: path.roadmap.id)
                      .push<void>(context),
              child: const Text('See the learning path'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Topics and challenges completed, everywhere.
class _Totals extends StatelessWidget {
  const _Totals({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tiles = [
      for (final (label, value) in [
        ('Topics completed', summary.topicsCompleted),
        ('Challenges solved', summary.challengesCompleted),
      ])
        MergeSemantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$value', style: theme.textTheme.headlineMedium),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
    ];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: context.prefersStackedLayout
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppSpacing.small,
                children: tiles,
              )
            : Row(children: [for (final tile in tiles) Expanded(child: tile)]),
      ),
    );
  }
}
