import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:material_ui/material_ui.dart';

/// Dashboard: a placeholder until Phase 3.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const EmptyStateView(
        icon: Icons.dashboard_outlined,
        title: 'Dashboard',
        message: 'Your streak, the active roadmap and what to learn next arrive in Phase 3.',
      ),
    );
  }
}
