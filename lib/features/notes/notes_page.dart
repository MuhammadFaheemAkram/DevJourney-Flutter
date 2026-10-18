import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:material_ui/material_ui.dart';

/// Notes (from the drawer): a placeholder until Phase 4.
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fallbackCloseButton(
          context,
          () => const DashboardRoute().go(context),
        ),
        title: const Text('Notes'),
      ),
      body: const EmptyStateView(
        icon: Icons.sticky_note_2_outlined,
        title: 'Notes',
        message: 'Markdown notes, attached to topics, arrive in Phase 4.',
      ),
    );
  }
}
