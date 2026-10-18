import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:material_ui/material_ui.dart';

/// Roadmaps: a placeholder until Phase 3.
class RoadmapsPage extends StatelessWidget {
  const RoadmapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Roadmaps'),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () => const SearchRoute().push<void>(context),
          ),
        ],
      ),
      body: const EmptyStateView(
        icon: Icons.route_outlined,
        title: 'Roadmaps',
        message: 'Learning roadmaps with their progress arrive in Phase 3.',
      ),
    );
  }
}
