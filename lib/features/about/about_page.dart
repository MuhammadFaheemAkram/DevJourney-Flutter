import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/model/app_info.dart';
import 'package:material_ui/material_ui.dart';

/// About: what DevJourney is, its version, the open-source licenses, and
/// the same app on other platforms.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key, this._appInfo});

  final AppInfo? _appInfo;

  static const _editions = [
    (
      'Android',
      'Kotlin, Jetpack Compose (Material 3), Hilt, Room, WorkManager',
    ),
    ('iOS', 'Swift, SwiftUI, SwiftData, UserNotifications'),
    (
      'Flutter (this app)',
      'Dart, material_ui, Bloc, drift with FTS5, go_router, '
          'flutter_local_notifications',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final info = _appInfo ?? getIt<AppInfo>();
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const SettingsRoute().go(context),
        ),
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.medium),
        children: [
          Text('DevJourney', style: theme.textTheme.headlineSmall),
          Text(
            'Version ${info.versionLabel}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            'A personal developer learning hub: roadmaps, progress, notes, '
            'goals, challenges and resources, all on your device. An '
            'open-source learning project.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.large),
          Semantics(
            header: true,
            child: Text(
              'The same app on other platforms',
              style: theme.textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          for (final (platform, stack) in _editions)
            Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.xSmall),
              child: ListTile(title: Text(platform), subtitle: Text(stack)),
            ),
          const SizedBox(height: AppSpacing.medium),
          OutlinedButton.icon(
            onPressed: () => showLicensePage(
              context: context,
              applicationName: 'DevJourney',
              applicationVersion: info.versionLabel,
            ),
            icon: const Icon(Icons.article_outlined),
            label: const Text('Open-source licenses'),
          ),
        ],
      ),
    );
  }
}
