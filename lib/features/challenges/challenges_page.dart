import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:material_ui/material_ui.dart';

/// Challenges: a placeholder until Phase 5.
class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Challenges'),
      ),
      body: const EmptyStateView(
        icon: Icons.code_outlined,
        title: 'Challenges',
        message: 'Coding challenges with status and solution notes arrive in Phase 5.',
      ),
    );
  }
}
