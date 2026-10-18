import 'package:dev_journey/core/design_system/formatting/date_labels.dart';
import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:material_ui/material_ui.dart';

/// A goal with its progress now: the title, a bar, "2 of 3 topics this
/// week" and when it resets. A custom goal also gets − and + buttons for
/// its check-ins (+ stops at the target).
class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.progress,
    required this.today,
    this.onTap,
    this.onCheckIn,
    this.onUndoCheckIn,
  });

  final GoalProgress progress;
  final CalendarDate today;
  final VoidCallback? onTap;

  /// For a custom goal; `null` hides the buttons (on the Dashboard).
  final VoidCallback? onCheckIn;
  final VoidCallback? onUndoCheckIn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final goal = progress.goal;
    final met = progress.isMet;
    final showButtons =
        !goal.isAutomatic && (onCheckIn != null || onUndoCheckIn != null);
    final summary =
        '${progress.current} of ${countLabel(goal.target, goal.kind.unit)} '
        '${goal.period.current}';
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(goal.title, style: theme.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.xSmall),
        Semantics(
          label: met ? 'Goal met' : '${(progress.ratio * 100).round()} percent',
          excludeSemantics: true,
          child: LinearProgressIndicator(
            value: progress.ratio,
            color: met ? context.appColors.success : null,
            borderRadius: BorderRadius.circular(AppSpacing.xxSmall),
          ),
        ),
        const SizedBox(height: AppSpacing.xSmall),
        Text(summary, style: theme.textTheme.bodyMedium),
        Text(
          met
              ? 'Done ${goal.period.current} · '
                    '${DateLabels.resets(progress.window.resets, today: today)}'
              : DateLabels.resets(progress.window.resets, today: today),
          style: theme.textTheme.bodySmall?.copyWith(
            color: met
                ? context.appColors.success
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
    // One button for screen readers: the tap target merges the text, as
    // in `TopicRow`. The check-in buttons stay separate.
    final body = MergeSemantics(
      child: Semantics(
        button: onTap != null,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: details,
          ),
        ),
      ),
    );
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.xxSmall,
      ),
      clipBehavior: Clip.antiAlias,
      child: showButtons
          ? Row(
              children: [
                Expanded(child: body),
                IconButton(
                  tooltip: 'Undo a check-in',
                  onPressed: progress.current > 0 ? onUndoCheckIn : null,
                  icon: const Icon(Icons.remove),
                ),
                IconButton.filledTonal(
                  tooltip: 'Check in',
                  onPressed: met ? null : onCheckIn,
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: AppSpacing.xSmall),
              ],
            )
          : body,
    );
  }
}
