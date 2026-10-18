import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:material_ui/material_ui.dart';

/// Analytics: a placeholder until Phase 6.
class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Analytics'),
      ),
      body: const EmptyStateView(
        icon: Icons.insights_outlined,
        title: 'Analytics',
        message: 'Streaks, weekly progress and the activity heatmap arrive in Phase 6.',
      ),
    );
  }
}
