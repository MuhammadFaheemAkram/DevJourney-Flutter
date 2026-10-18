import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_cubit.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_state.dart';
import 'package:dev_journey/features/analytics/widgets/completions_chart.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

/// Streaks and totals, weekly and monthly progress, each roadmap's
/// completion, and the activity heatmap. Everything live.
class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AnalyticsCubit>().state;
    final analytics = state.analytics;
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Analytics'),
      ),
      body: switch (state.status) {
        AnalyticsStatus.loading => const LoadingView(),
        AnalyticsStatus.failure => const ErrorView(
          message: "Couldn't read your progress.",
        ),
        AnalyticsStatus.ready => _Analytics(analytics: analytics!),
      },
    );
  }
}

class _Analytics extends StatelessWidget {
  const _Analytics({required this.analytics});

  final LearningAnalytics analytics;

  static String _percent(double ratio) => '${(ratio * 100).round()}%';

  @override
  Widget build(BuildContext context) {
    final a = analytics;
    final goals = a.goals.rate;
    final cards = [
      AnalyticsCard(
        icon: Icons.local_fire_department_outlined,
        label: 'Current streak',
        value: countLabel(a.streak.current, 'day'),
        detail: a.streak.todayCounts ? 'Today counts' : 'Not yet today',
      ),
      AnalyticsCard(
        icon: Icons.emoji_events_outlined,
        label: 'Longest streak',
        value: countLabel(a.streak.longest, 'day'),
      ),
      AnalyticsCard(
        icon: Icons.check_circle_outline,
        label: 'Topics completed',
        value: '${a.topicsCompleted} of ${a.totalTopics}',
        detail: '${_percent(a.completionRate)} of every roadmap',
      ),
      AnalyticsCard(
        icon: Icons.code,
        label: 'Challenges solved',
        value: '${a.challengesCompleted}',
      ),
      AnalyticsCard(
        icon: Icons.flag_outlined,
        label: 'Goals met',
        value: goals == null ? '—' : _percent(goals),
        detail: goals == null
            ? 'Set a goal to see this'
            : '${a.goals.met} of ${a.goals.total} periods, last 30 days',
      ),
    ];
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xLarge),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: context.prefersStackedLayout
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.small,
                  children: cards,
                )
              : _TwoColumns(children: cards),
        ),
        const SectionHeader('Weekly progress'),
        _Padded(
          child: CompletionsChart(
            periods: a.weekly,
            labelOf: (period) =>
                DateFormat('d/M').format(period.start.toDateTime()),
            summary: _summary(
              'Topics completed per week, last ${a.weekly.length} weeks',
              a.weekly,
              (p) => 'week of ${DateLabels.short(p.start)}',
            ),
          ),
        ),
        const SectionHeader('Monthly progress'),
        _Padded(
          child: CompletionsChart(
            periods: a.monthly,
            labelOf: (period) =>
                DateFormat('MMM').format(period.start.toDateTime()),
            summary: _summary(
              'Topics completed per month, last ${a.monthly.length} months',
              a.monthly,
              (p) => DateFormat('MMMM y').format(p.start.toDateTime()),
            ),
          ),
        ),
        const SectionHeader('Completion per roadmap'),
        for (final roadmap in a.roadmaps)
          _Padded(
            child: MergeSemantics(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    roadmap.roadmap.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSpacing.xxSmall),
                  ExcludeSemantics(
                    child: LinearProgressIndicator(
                      value: roadmap.ratio,
                      borderRadius: BorderRadius.circular(AppSpacing.xxSmall),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxSmall),
                  Text(
                    '${roadmap.completedTopics} of '
                    '${countLabel(roadmap.totalTopics, 'topic')} · '
                    '${_percent(roadmap.ratio)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        const SectionHeader('Activity'),
        _Padded(
          child: ActivityHeatmap(
            start: a.heatmapStart,
            today: a.today,
            activity: a.activity,
            summary: _activitySummary(a),
          ),
        ),
      ],
    );
  }

  static String _summary(
    String title,
    List<PeriodCount> periods,
    String Function(PeriodCount) nameOf,
  ) =>
      '$title. ${[for (final p in periods) '${nameOf(p)}: ${p.count}'].join(', ')}.';

  static String _activitySummary(LearningAnalytics a) {
    final days = a.activity.length;
    final total = a.activity.values.fold(0, (sum, n) => sum + n);
    return 'Activity heatmap, last ${LearningAnalytics.heatmapWeeks} weeks: '
        'active on ${countLabel(days, 'day')}, '
        '${countLabel(total, 'completion or check-in', 'completions or check-ins')}.';
  }
}

class _Padded extends StatelessWidget {
  const _Padded({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.medium,
      vertical: AppSpacing.xSmall,
    ),
    child: child,
  );
}

/// Cards two by two, each row as tall as its taller card.
class _TwoColumns extends StatelessWidget {
  const _TwoColumns({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.small,
      children: [
        for (var i = 0; i < children.length; i += 2)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSpacing.small,
              children: [
                Expanded(child: children[i]),
                Expanded(
                  child: i + 1 < children.length
                      ? children[i + 1]
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
