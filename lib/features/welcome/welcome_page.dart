import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_cubit.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WelcomeCubit>()..load(),
      child: const WelcomeView(),
    );
  }
}

/// First launch: the catalog loads, then the user picks a roadmap and starts
/// fresh or with demo progress. Neither button navigates: the router's gate
/// follows the onboarded setting.
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WelcomeCubit>().state;
    return BlocListener<WelcomeCubit, WelcomeState>(
      listenWhen: (previous, current) =>
          previous.errorSerial != current.errorSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.errorMessage ?? ''))),
      child: Scaffold(
        body: SafeArea(
          child: switch (state.status) {
            WelcomeStatus.loading => const LoadingView(
              message: 'Getting your roadmaps…',
            ),
            WelcomeStatus.failed => ErrorView(
              message: state.errorMessage ?? '',
              onRetry: context.read<WelcomeCubit>().load,
            ),
            WelcomeStatus.ready => _Ready(state: state),
          },
        ),
      ),
    );
  }
}

class _Ready extends StatelessWidget {
  const _Ready({required this.state});

  final WelcomeState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WelcomeCubit>();
    final theme = Theme.of(context);
    final busy = state.isStarting;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.route_rounded,
                size: AppIconSize.large * 1.5,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: AppSpacing.medium),
              Text(
                'DevJourney',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xSmall),
              Text(
                'Follow a roadmap, track your progress, keep notes and '
                'build a learning streak, all on your device.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.large),
              Semantics(
                header: true,
                child: Text(
                  'Pick a roadmap to start with',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: AppSpacing.xSmall),
              RadioGroup<String>(
                groupValue: state.selectedRoadmapId,
                onChanged: (id) {
                  if (id != null) cubit.select(id);
                },
                child: Column(
                  children: [
                    for (final roadmap in state.roadmaps)
                      _RoadmapChoice(roadmap: roadmap, enabled: !busy),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.large),
              FilledButton(
                onPressed: busy ? null : () => cubit.start(StartChoice.learn),
                child: _Label(
                  text: 'Start learning',
                  busy: state.starting == StartChoice.learn,
                ),
              ),
              const SizedBox(height: AppSpacing.xSmall),
              TextButton(
                onPressed: busy ? null : () => cubit.start(StartChoice.demo),
                child: _Label(
                  text: 'Explore with demo progress',
                  busy: state.starting == StartChoice.demo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoadmapChoice extends StatelessWidget {
  const _RoadmapChoice({required this.roadmap, required this.enabled});

  final RoadmapProgress roadmap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.xxSmall),
      child: RadioListTile<String>(
        value: roadmap.roadmap.id,
        enabled: enabled,
        title: Text(roadmap.roadmap.title),
        subtitle: Text(
          '${roadmap.roadmap.category.label} · '
          '${countLabel(roadmap.totalTopics, 'topic')}',
        ),
      ),
    );
  }
}

/// A button's label, or a small spinner while its start runs.
class _Label extends StatelessWidget {
  const _Label({required this.text, required this.busy});

  final String text;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    if (!busy) return Text(text);
    return Semantics(
      label: '$text, in progress',
      child: const SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
