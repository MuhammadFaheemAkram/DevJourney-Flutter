import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_cubit.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_state.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// The Challenges tab: filter by difficulty and status, open one.
class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChallengesCubit>().state;
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerMenuButton(),
        title: const Text('Challenges'),
      ),
      body: switch (state.status) {
        ChallengesStatus.loading => const LoadingView(),
        ChallengesStatus.failure => const ErrorView(
          message: "Couldn't read the challenges.",
        ),
        ChallengesStatus.ready => _Challenges(state: state),
      },
    );
  }
}

class _Challenges extends StatelessWidget {
  const _Challenges({required this.state});

  final ChallengesState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChallengesCubit>();
    final visible = state.visible;
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.large),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.medium,
            AppSpacing.xSmall,
            AppSpacing.medium,
            AppSpacing.xSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.small,
            children: [
              FilterChipGroup<Difficulty>(
                values: Difficulty.values,
                labelOf: (difficulty) => difficulty.label,
                selected: state.difficulty,
                onSelected: cubit.filterByDifficulty,
                allLabel: 'Any level',
              ),
              SegmentedChoice<ChallengeStatus?>(
                values: const [null, ...ChallengeStatus.values],
                labelOf: (status) => status?.label ?? 'All',
                selected: state.challengeStatus,
                onSelected: cubit.filterByStatus,
              ),
            ],
          ),
        ),
        if (visible.isEmpty)
          EmptyStateView(
            icon: Icons.filter_alt_off_outlined,
            title: 'No challenges match',
            message: 'Try another level or status.',
            action: FilledButton.tonal(
              onPressed: cubit.clearFilters,
              child: const Text('Show all'),
            ),
          )
        else ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.xxSmall,
            ),
            child: Text(
              countLabel(visible.length, 'challenge'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          for (final item in visible)
            ChallengeCard(
              item: item,
              onTap: () =>
                  ChallengeDetailRoute(challengeId: item.challenge.id)
                      .push<void>(context),
            ),
        ],
      ],
    );
  }
}
