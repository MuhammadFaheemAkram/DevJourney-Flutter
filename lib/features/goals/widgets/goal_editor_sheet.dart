import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:material_ui/material_ui.dart';

/// What the goal sheet decided.
sealed class GoalEditorResult {
  const GoalEditorResult();
}

final class SaveGoal extends GoalEditorResult {
  const SaveGoal(this.draft);

  final GoalDraft draft;
}

final class DeleteGoal extends GoalEditorResult {
  const DeleteGoal();
}

/// A goal's title, kind, period and target (1–50); Delete for an
/// [existing] one.
class GoalEditorSheet extends StatefulWidget {
  const GoalEditorSheet({
    super.key,
    this.existing,
    this.period = GoalPeriod.daily,
  });

  final Goal? existing;

  /// For a new goal: the tab it was added from.
  final GoalPeriod period;

  @override
  State<GoalEditorSheet> createState() => _GoalEditorSheetState();
}

class _GoalEditorSheetState extends State<GoalEditorSheet> {
  late final _title = TextEditingController(text: widget.existing?.title);
  late GoalKind _kind = widget.existing?.kind ?? GoalKind.topics;
  late GoalPeriod _period = widget.existing?.period ?? widget.period;
  late int _target = widget.existing?.target ?? 1;
  bool _showErrors = false;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  void _save() {
    if (goalTitleError(_title.text) != null) {
      setState(() => _showErrors = true);
      return;
    }
    Navigator.of(context).pop(
      SaveGoal(
        GoalDraft(
          title: _title.text,
          kind: _kind,
          period: _period,
          target: _target,
        ),
      ),
    );
  }

  Future<void> _delete(Goal goal) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Delete “${goal.title}”?',
      message: goal.isAutomatic
          ? 'Your completions stay; only the goal goes.'
          : 'Its check-ins are deleted too.',
      confirmLabel: 'Delete',
      destructive: true,
    );
    if (confirmed && mounted) Navigator.of(context).pop(const DeleteGoal());
  }

  void _setTarget(int target) =>
      setState(() => _target = target.clamp(Goal.minTarget, Goal.maxTarget));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final existing = widget.existing;
    final targetLabel = '${countLabel(_target, _kind.unit)} ${_period.current}';
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.medium,
        0,
        AppSpacing.medium,
        AppSpacing.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            existing == null ? 'New goal' : 'Edit goal',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.medium),
          TextField(
            controller: _title,
            autofocus: existing == null,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Complete 3 topics a week',
              errorText: _showErrors ? goalTitleError(_title.text) : null,
            ),
          ),
          _Section(
            title: 'What counts',
            child: _Choices<GoalKind>(
              values: GoalKind.values,
              selected: _kind,
              labelOf: (kind) => kind.label,
              onSelected: (kind) => setState(() => _kind = kind),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxSmall),
            child: Text(
              switch (_kind) {
                GoalKind.topics => 'Counted from the topics you complete.',
                GoalKind.challenges =>
                  'Counted from the challenges you finish.',
                GoalKind.custom => 'You check in by hand with +1.',
              },
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          _Section(
            title: 'How often',
            child: _Choices<GoalPeriod>(
              values: GoalPeriod.values,
              selected: _period,
              labelOf: (period) => period.label,
              onSelected: (period) => setState(() => _period = period),
            ),
          ),
          _Section(
            title: 'Target',
            child: Row(
              children: [
                IconButton.outlined(
                  tooltip: 'Lower the target',
                  onPressed: _target > Goal.minTarget
                      ? () => _setTarget(_target - 1)
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Expanded(
                  child: Semantics(
                    liveRegion: true,
                    child: Text(
                      targetLabel,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                IconButton.outlined(
                  tooltip: 'Raise the target',
                  onPressed: _target < Goal.maxTarget
                      ? () => _setTarget(_target + 1)
                      : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.large),
          Row(
            children: [
              if (existing != null)
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                  ),
                  onPressed: () => _delete(existing),
                  child: const Text('Delete'),
                ),
              const Spacer(),
              FilledButton(onPressed: _save, child: const Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(title, style: Theme.of(context).textTheme.titleSmall),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          child,
        ],
      ),
    );
  }
}

/// One choice of several, as chips that wrap.
class _Choices<T> extends StatelessWidget {
  const _Choices({
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onSelected,
  });

  final List<T> values;
  final T selected;
  final String Function(T value) labelOf;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xSmall,
      runSpacing: AppSpacing.xSmall,
      children: [
        for (final value in values)
          ChoiceChip(
            label: Text(labelOf(value)),
            selected: value == selected,
            onSelected: (_) => onSelected(value),
          ),
      ],
    );
  }
}
