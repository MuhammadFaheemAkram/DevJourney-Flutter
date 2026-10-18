import 'package:dev_journey/core/design_system/formatting/date_labels.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/calculation/markdown_preview.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:material_ui/material_ui.dart';

/// A note in a list: the title, two lines of plain text, its topic and when
/// it was last edited. One button for screen readers.
class NoteRow extends StatelessWidget {
  const NoteRow({
    super.key,
    required this.item,
    required this.now,
    this.onTap,
    this.showTopic = true,
  });

  final NoteItem item;

  /// For "5 min ago".
  final DateTime now;
  final VoidCallback? onTap;

  /// Off where every note has the same topic (on Topic detail).
  final bool showTopic;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final note = item.note;
    final preview = plainTextPreview(note.content);
    final topicTitle = showTopic ? item.topicTitle : null;
    final secondary = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    return MergeSemantics(
      child: Semantics(
        button: onTap != null,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.small,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.title, style: theme.textTheme.titleMedium),
                if (preview.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xxSmall),
                  Text(
                    preview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.xSmall),
                Wrap(
                  spacing: AppSpacing.xSmall,
                  runSpacing: AppSpacing.xxSmall,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (topicTitle != null) _TopicTag(title: topicTitle),
                    Text(
                      DateLabels.edited(note.updatedAt, now: now),
                      style: secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The attached topic, as a small tag (not a button: the row is).
class _TopicTag extends StatelessWidget {
  const _TopicTag({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Topic: $title',
      excludeSemantics: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(AppSpacing.xSmall),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xSmall,
            vertical: AppSpacing.xxSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.topic_outlined,
                size: 16,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: AppSpacing.xxSmall),
              Flexible(
                child: Text(
                  title,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
