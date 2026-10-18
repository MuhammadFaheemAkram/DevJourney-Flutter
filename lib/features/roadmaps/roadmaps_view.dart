import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_cubit.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_state.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// The Roadmaps tab: search, category chips, and a card per roadmap. Pull
/// to refresh syncs the catalog (`RefreshIndicator.adaptive`: Material's
/// spinner on Android, the iOS one on iOS).
class RoadmapsView extends StatefulWidget {
  const RoadmapsView({super.key});

  @override
  State<RoadmapsView> createState() => _RoadmapsViewState();
}

class _RoadmapsViewState extends State<RoadmapsView> {
  late final _search = TextEditingController(
    text: context.read<RoadmapsCubit>().state.query,
  );

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RoadmapsCubit>();
    final state = context.watch<RoadmapsCubit>().state;
    return BlocListener<RoadmapsCubit, RoadmapsState>(
      listenWhen: (previous, current) =>
          previous.messageSerial != current.messageSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.message ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: const DrawerMenuButton(),
          title: const Text('Roadmaps'),
          actions: [
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () => const SearchRoute().push<void>(context),
            ),
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: cubit.refresh,
          child: CustomScrollView(
            // Pull-to-refresh needs a scrollable even when the list is short.
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.medium,
                    AppSpacing.xSmall,
                    AppSpacing.medium,
                    AppSpacing.xSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppSearchField(
                        controller: _search,
                        hintText: 'Search roadmaps',
                        onChanged: cubit.search,
                        onCleared: () => cubit.search(''),
                      ),
                      const SizedBox(height: AppSpacing.small),
                      FilterChipGroup<RoadmapCategory>(
                        values: RoadmapCategory.values,
                        labelOf: (category) => category.label,
                        selected: state.category,
                        onSelected: cubit.filter,
                      ),
                    ],
                  ),
                ),
              ),
              ..._content(context, state),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _content(BuildContext context, RoadmapsState state) {
    final errorMessage = state.errorMessage;
    if (errorMessage != null) {
      return [SliverFillRemaining(child: ErrorView(message: errorMessage))];
    }
    if (state.roadmaps == null) {
      return const [SliverFillRemaining(child: LoadingView())];
    }
    final visible = state.visible;
    if (visible.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyStateView(
            icon: Icons.search_off,
            title: state.isFiltering ? 'No roadmaps match' : 'No roadmaps yet',
            message: state.isFiltering
                ? 'Try other words, or another category.'
                : 'Pull down to sync the catalog.',
          ),
        ),
      ];
    }
    return [
      SliverList.list(
        children: [
          for (final item in visible)
            RoadmapCard(
              progress: item,
              isActive: item.roadmap.id == state.activeRoadmapId,
              onTap: () =>
                  RoadmapDetailRoute(roadmapId: item.roadmap.id)
                      .push<void>(context),
            ),
          const SizedBox(height: AppSpacing.large),
        ],
      ),
    ];
  }
}
