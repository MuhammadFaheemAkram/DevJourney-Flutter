import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/goals/cubit/goals_cubit.dart';
import 'package:dev_journey/features/goals/cubit/goals_state.dart';
import 'package:dev_journey/features/goals/widgets/goal_editor_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Goals by period (Daily, Weekly, Monthly): each with its progress now.
/// Tap one to edit it; custom goals take check-ins right on the card.
class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  static Future<void> _edit(BuildContext context, [Goal? goal]) async {
    final cubit = context.read<GoalsCubit>();
    final result = await showAppSheet<GoalEditorResult>(
      context,
      (_) => GoalEditorSheet(
        existing: goal,
        period: goal?.period ?? cubit.state.period,
      ),
    );
    switch (result) {
      case SaveGoal(:final draft):
        await cubit.save(draft, id: goal?.id);
      case DeleteGoal() when goal != null:
        await cubit.delete(goal.id);
      case DeleteGoal() || null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GoalsCubit>();
    final state = context.watch<GoalsCubit>().state;
    return BlocListener<GoalsCubit, GoalsState>(
      listenWhen: (previous, current) =>
          previous.messageSerial != current.messageSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.message ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: fallbackCloseButton(
            context,
            () => const DashboardRoute().go(context),
          ),
          title: const Text('Goals'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _edit(context),
          icon: const Icon(Icons.add),
          label: const Text('Add goal'),
        ),
        body: switch (state.status) {
          GoalsStatus.loading => const LoadingView(),
          GoalsStatus.failure => const ErrorView(
            message: "Couldn't read your goals.",
          ),
          GoalsStatus.ready => ListView(
            // Room for the FAB over the last card.
            padding: const EdgeInsets.only(bottom: 88),
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: SegmentedChoice<GoalPeriod>(
                  values: GoalPeriod.values,
                  labelOf: (period) => period.label,
                  selected: state.period,
                  onSelected: cubit.selectPeriod,
                ),
              ),
              if (state.visible.isEmpty)
                EmptyStateView(
                  icon: Icons.flag_outlined,
                  title: 'No ${state.period.label.toLowerCase()} goals',
                  message: switch (state.period) {
                    GoalPeriod.daily => 'Set a small target for every day.',
                    GoalPeriod.weekly => 'Set a target for each week.',
                    GoalPeriod.monthly => 'Set a target for each month.',
                  },
                  action: FilledButton.tonal(
                    onPressed: () => _edit(context),
                    child: const Text('Add a goal'),
                  ),
                )
              else
                for (final progress in state.visible)
                  GoalCard(
                    progress: progress,
                    today: state.today,
                    onTap: () => _edit(context, progress.goal),
                    onCheckIn: () => cubit.checkIn(progress),
                    onUndoCheckIn: () => cubit.undoCheckIn(progress),
                  ),
            ],
          ),
        },
      ),
    );
  }
}
