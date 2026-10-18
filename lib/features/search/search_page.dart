import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// Global search (from the drawer and app bars): a placeholder until Phase 5.
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const DashboardRoute().go(context),
        ),
        title: const Text('Search'),
      ),
      body: const EmptyStateView(
        icon: Icons.search,
        title: 'Search',
        message: 'Search across roadmaps, topics, notes, resources and challenges arrives in Phase 5.',
      ),
    );
  }
}
