import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:material_ui/material_ui.dart';

/// A learning resource: its type, title, source and time, and a bookmark
/// toggle. Tapping the card opens the link; the bookmark is its own button.
class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
    required this.item,
    this.onTap,
    this.onBookmark,
    this.margin = const EdgeInsets.symmetric(
      horizontal: AppSpacing.medium,
      vertical: AppSpacing.xxSmall,
    ),
  });

  final ResourceItem item;

  /// Around the card: the page's gutter in a list, none inside a padded
  /// screen (Topic detail).
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;

  static IconData iconOf(ResourceType type) => switch (type) {
    ResourceType.article => Icons.article_outlined,
    ResourceType.video => Icons.play_circle_outline,
    ResourceType.documentation => Icons.menu_book_outlined,
    ResourceType.course => Icons.school_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resource = item.resource;
    final secondary = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MergeSemantics(
              child: Semantics(
                button: onTap != null,
                hint: 'Opens in the browser',
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.medium),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExcludeSemantics(
                          child: Icon(
                            iconOf(resource.type),
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.small),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                resource.title,
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(height: AppSpacing.xxSmall),
                              Text(
                                '${resource.type.label} · ${resource.source} · '
                                '${minutesLabel(resource.estimatedMinutes)}',
                                style: secondary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xxSmall,
              right: AppSpacing.xxSmall,
            ),
            child: IconButton(
              tooltip: item.bookmarked ? 'Remove from saved' : 'Save',
              isSelected: item.bookmarked,
              icon: const Icon(Icons.bookmark_border),
              selectedIcon: const Icon(Icons.bookmark),
              onPressed: onBookmark,
            ),
          ),
        ],
      ),
    );
  }
}
