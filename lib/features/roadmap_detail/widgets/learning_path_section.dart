import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// One section on the learning path: a node on a vertical line, the
/// section's title and progress, and (when expanded) its topics and the
/// action to complete or reopen it.
///
/// The line is painted in a gutter beside the content ([_PathPainter]):
/// above the node unless it's the first section, below it unless it's the
/// last. `IntrinsicHeight` lets the gutter stretch to the content's height,
/// so the line runs unbroken past the topics.
class LearningPathSection extends StatelessWidget {
  const LearningPathSection({
    super.key,
    required this.section,
    required this.number,
    required this.count,
    required this.isFirst,
    required this.isLast,
    required this.expanded,
  });

  final SectionPath section;
  final int number;
  final int count;
  final bool isFirst;
  final bool isLast;
  final bool expanded;

  static const _gutter = 56.0;
  static const _node = 32.0;

  /// Where the node's centre sits, from the top: level with the header.
  static const _nodeCentre = AppSpacing.medium + _node / 2;

  Future<void> _setCompleted(
    BuildContext context, {
    required bool completed,
  }) async {
    final cubit = context.read<RoadmapDetailCubit>();
    final open = section.totalTopics - section.completedTopics;
    if (completed && open > 1) {
      final confirmed = await showConfirmDialog(
        context,
        title: 'Complete "${section.section.title}"?',
        message: '$open topics will be marked as completed today.',
        confirmLabel: 'Complete',
      );
      if (!confirmed) return;
    }
    await cubit.setSectionCompleted(section.section.id, completed: completed);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final success = context.appColors.success;
    final done = section.isComplete;
    final title = section.section.title;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: _gutter,
            child: CustomPaint(
              painter: _PathPainter(
                color: scheme.outlineVariant,
                isFirst: isFirst,
                isLast: isLast,
                nodeCentre: _nodeCentre,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.medium),
                  child: ExcludeSemantics(
                    child: CircleAvatar(
                      radius: _node / 2,
                      backgroundColor: done ? success : scheme.primaryContainer,
                      foregroundColor: done
                          ? scheme.surface
                          : scheme.onPrimaryContainer,
                      child: done
                          ? const Icon(Icons.check, size: 18)
                          : Text('$number', style: theme.textTheme.labelLarge),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(
                  button: true,
                  expanded: expanded,
                  label:
                      'Section $number of $count, $title, '
                      '${section.completedTopics} of ${section.totalTopics} '
                      'topics complete',
                  excludeSemantics: true,
                  child: InkWell(
                    onTap: () => context
                        .read<RoadmapDetailCubit>()
                        .toggleSection(section.section.id),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        AppSpacing.medium,
                        AppSpacing.medium,
                        AppSpacing.small,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: theme.textTheme.titleMedium),
                                Text(
                                  '${section.completedTopics} / '
                                  '${section.totalTopics}'
                                  '${done ? ' · Complete' : ''}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: done
                                        ? success
                                        : scheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            expanded ? Icons.expand_less : Icons.expand_more,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (expanded) ...[
                  for (final topic in section.topics)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.xSmall),
                      child: TopicRow(
                        item: topic,
                        onTap: () =>
                            TopicDetailRoute(topicId: topic.topic.id)
                                .push<void>(context),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSpacing.xSmall,
                        bottom: AppSpacing.small,
                      ),
                      child: done
                          ? TextButton.icon(
                              onPressed: () =>
                                  _setCompleted(context, completed: false),
                              icon: const Icon(Icons.undo),
                              label: const Text('Mark as not done'),
                            )
                          : TextButton.icon(
                              onPressed: () =>
                                  _setCompleted(context, completed: true),
                              icon: const Icon(Icons.done_all),
                              label: const Text('Mark section complete'),
                            ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The path's line through a section's gutter.
class _PathPainter extends CustomPainter {
  const _PathPainter({
    required this.color,
    required this.isFirst,
    required this.isLast,
    required this.nodeCentre,
  });

  final Color color;
  final bool isFirst;
  final bool isLast;
  final double nodeCentre;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    final x = size.width / 2;
    if (!isFirst) canvas.drawLine(Offset(x, 0), Offset(x, nodeCentre), paint);
    if (!isLast) {
      canvas.drawLine(Offset(x, nodeCentre), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_PathPainter oldDelegate) =>
      color != oldDelegate.color ||
      isFirst != oldDelegate.isFirst ||
      isLast != oldDelegate.isLast ||
      nodeCentre != oldDelegate.nodeCentre;
}
