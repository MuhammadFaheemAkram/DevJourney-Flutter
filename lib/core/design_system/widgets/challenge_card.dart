import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/core/design_system/widgets/challenge_status_badge.dart';
import 'package:dev_journey/core/design_system/widgets/difficulty_chip.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:material_ui/material_ui.dart';

/// A challenge in a list: its title, category, difficulty and status. One
/// button for screen readers.
class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key, required this.item, this.onTap});

  final ChallengeItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final challenge = item.challenge;
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.xxSmall,
      ),
      clipBehavior: Clip.antiAlias,
      child: MergeSemantics(
        child: Semantics(
          button: onTap != null,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.category.label.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxSmall),
                  Text(challenge.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xSmall),
                  Wrap(
                    spacing: AppSpacing.small,
                    runSpacing: AppSpacing.xxSmall,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DifficultyChip(difficulty: challenge.difficulty),
                      ChallengeStatusBadge(status: item.status),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
