import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/core/design_system/widgets/difficulty_chip.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:material_ui/material_ui.dart';

/// A topic in a list: a check (done or not), the title, its difficulty and
/// time, and a bookmark mark. One button for screen readers, which hear
/// "Streams, completed, Intermediate, 45 minutes".
class TopicRow extends StatelessWidget {
  const TopicRow({super.key, required this.item, this.onTap});

  final TopicItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topic = item.topic;
    final done = item.isCompleted;
    return MergeSemantics(
      child: Semantics(
        button: onTap != null,
        value: done ? 'completed' : 'not completed',
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.small,
            ),
            child: Row(
              children: [
                ExcludeSemantics(
                  child: Icon(
                    done ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: done
                        ? context.appColors.success
                        : theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(topic.title, style: theme.textTheme.bodyLarge),
                      const SizedBox(height: AppSpacing.xxSmall),
                      Wrap(
                        spacing: AppSpacing.xSmall,
                        runSpacing: AppSpacing.xxSmall,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          DifficultyChip(difficulty: topic.difficulty),
                          Text(
                            minutesLabel(topic.estimatedMinutes),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (item.bookmarked)
                  Semantics(
                    label: 'Bookmarked',
                    child: Icon(
                      Icons.bookmark,
                      color: theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
