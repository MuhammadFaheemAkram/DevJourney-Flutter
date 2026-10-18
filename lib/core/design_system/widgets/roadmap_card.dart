import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:material_ui/material_ui.dart';

/// A roadmap in the Roadmaps tab: title, category, description, progress,
/// and "Active" on the one the Dashboard follows. One button for screen
/// readers.
class RoadmapCard extends StatelessWidget {
  const RoadmapCard({
    super.key,
    required this.progress,
    required this.isActive,
    this.onTap,
  });

  final RoadmapProgress progress;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roadmap = progress.roadmap;
    final percent = (progress.ratio * 100).round();
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.xSmall,
      ),
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
                  Wrap(
                    spacing: AppSpacing.xSmall,
                    runSpacing: AppSpacing.xxSmall,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(roadmap.title, style: theme.textTheme.titleMedium),
                      if (isActive)
                        _Badge(
                          label: 'Active',
                          color: theme.colorScheme.primary,
                        ),
                      if (progress.isComplete)
                        _Badge(
                          label: 'Complete',
                          color: context.appColors.success,
                        ),
                    ],
                  ),
                  Text(
                    roadmap.category.label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(roadmap.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: AppSpacing.small),
                  ExcludeSemantics(
                    child: LinearProgressIndicator(
                      value: progress.ratio,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(
                    '$percent% complete · ${progress.completedTopics} of '
                    '${countLabel(progress.totalTopics, 'topic')}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
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

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: color)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xSmall,
          vertical: 2,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
        ),
      ),
    );
  }
}
