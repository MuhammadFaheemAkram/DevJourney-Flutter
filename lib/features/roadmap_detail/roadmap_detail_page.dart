import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// One roadmap's learning path ([roadmapId]): a placeholder until Phase 3.
/// Opened by a link it has nothing to go back to, so it offers Close.
class RoadmapDetailPage extends StatelessWidget {
  const RoadmapDetailPage({super.key, required this.roadmapId});

  final String roadmapId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const RoadmapsRoute().go(context),
        ),
        title: const Text('Roadmap'),
      ),
      body: const EmptyStateView(
        icon: Icons.route_outlined,
        title: 'Roadmap',
        message:
            'The learning path, its sections and topics arrive in Phase 3.',
      ),
    );
  }
}
