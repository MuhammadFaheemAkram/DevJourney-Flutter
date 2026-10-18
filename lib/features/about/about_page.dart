import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// About: what DevJourney is, and the open-source licenses. Phase 6 adds the
/// version and the editions on other platforms.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const DashboardRoute().go(context),
        ),
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.medium),
        children: [
          Text('DevJourney', style: theme.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            'A personal developer learning hub: roadmaps, progress, notes, '
            'goals, challenges and resources, all on your device. An '
            'open-source learning project.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.large),
          OutlinedButton.icon(
            onPressed: () => showLicensePage(
              context: context,
              applicationName: 'DevJourney',
            ),
            icon: const Icon(Icons.article_outlined),
            label: const Text('Open-source licenses'),
          ),
        ],
      ),
    );
  }
}
