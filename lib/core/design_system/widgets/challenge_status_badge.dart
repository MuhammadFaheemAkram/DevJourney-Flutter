import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:material_ui/material_ui.dart';

/// Where the user is with a challenge: an icon and a word, so it never
/// relies on color alone.
class ChallengeStatusBadge extends StatelessWidget {
  const ChallengeStatusBadge({super.key, required this.status});

  final ChallengeStatus status;

  static IconData iconOf(ChallengeStatus status) => switch (status) {
    ChallengeStatus.todo => Icons.radio_button_unchecked,
    ChallengeStatus.inProgress => Icons.timelapse,
    ChallengeStatus.done => Icons.check_circle,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = switch (status) {
      ChallengeStatus.todo => theme.colorScheme.onSurfaceVariant,
      ChallengeStatus.inProgress => theme.colorScheme.primary,
      ChallengeStatus.done => context.appColors.success,
    };
    return Semantics(
      label: 'Status: ${status.label}',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconOf(status), size: 16, color: color),
          const SizedBox(width: AppSpacing.xxSmall),
          Flexible(
            child: Text(
              status.label,
              style: theme.textTheme.labelMedium?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
