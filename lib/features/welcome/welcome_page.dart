import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/placeholder_onboarding.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:material_ui/material_ui.dart';

/// First launch: start learning, or explore with demo progress.
///
/// Neither button navigates. Each records the choice, and the router's
/// onboarding gate moves the user to the Dashboard. In Phase 1 both only set
/// the in-memory [PlaceholderOnboarding]; Phase 2 fetches the catalog first
/// (with a progress indicator and a retry) and asks which roadmap to start.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final onboarding = getIt<PlaceholderOnboarding>();
    return WelcomeView(
      onStartLearning: onboarding.complete,
      onExploreDemo: onboarding.complete,
    );
  }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
    required this.onStartLearning,
    required this.onExploreDemo,
  });

  final VoidCallback onStartLearning;
  final VoidCallback onExploreDemo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.large),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
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
                  const SizedBox(height: AppSpacing.xLarge),
                  FilledButton(
                    onPressed: onStartLearning,
                    child: const Text('Start learning'),
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  TextButton(
                    onPressed: onExploreDemo,
                    child: const Text('Explore with demo progress'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
