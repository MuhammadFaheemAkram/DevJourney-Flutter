import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// One challenge ([challengeId]): a placeholder until Phase 5.
class ChallengeDetailPage extends StatelessWidget {
  const ChallengeDetailPage({super.key, required this.challengeId});

  final String challengeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const ChallengesRoute().go(context),
        ),
        title: const Text('Challenge'),
      ),
      body: const EmptyStateView(
        icon: Icons.code_outlined,
        title: 'Challenge',
        message:
            'A challenge, its hints and your solution notes arrive in Phase 5.',
      ),
    );
  }
}
