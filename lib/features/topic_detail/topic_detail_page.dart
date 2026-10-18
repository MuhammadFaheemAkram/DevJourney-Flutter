import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// One topic ([topicId]): a placeholder until Phase 3.
class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({super.key, required this.topicId});

  final String topicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const RoadmapsRoute().go(context),
        ),
        title: const Text('Topic'),
      ),
      body: const EmptyStateView(
        icon: Icons.menu_book_outlined,
        title: 'Topic',
        message:
            'A topic, its objectives, resources and notes arrive in Phase 3.',
      ),
    );
  }
}
