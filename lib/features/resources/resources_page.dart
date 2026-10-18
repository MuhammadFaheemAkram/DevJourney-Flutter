import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// Resources (from the drawer): a placeholder until Phase 5.
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const DashboardRoute().go(context),
        ),
        title: const Text('Resources'),
      ),
      body: const EmptyStateView(
        icon: Icons.local_library_outlined,
        title: 'Resources',
        message: 'Articles, videos, docs and courses arrive in Phase 5.',
      ),
    );
  }
}
