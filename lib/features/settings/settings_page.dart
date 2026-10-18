import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:material_ui/material_ui.dart';

/// Settings: so far only About. Appearance, dynamic color, the daily
/// reminder, reset progress and the developer switches arrive in Phase 6.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(AppSpacing.medium),
            child: Text(
              'Appearance, dynamic color and the daily reminder arrive in '
              'Phase 6.',
            ),
          ),
          const SectionHeader('About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About DevJourney'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => const AboutRoute().push<void>(context),
          ),
        ],
      ),
    );
  }
}
