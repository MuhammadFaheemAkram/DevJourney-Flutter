import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/resources/cubit/resources_cubit.dart';
import 'package:dev_journey/features/resources/cubit/resources_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Articles, videos, docs and courses: search, filter by type or Saved,
/// save one, open one in the in-app browser.
class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
  late final _search = TextEditingController(
    text: context.read<ResourcesCubit>().state.query,
  );

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResourcesCubit>();
    final state = context.watch<ResourcesCubit>().state;
    return BlocListener<ResourcesCubit, ResourcesState>(
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
          title: const Text('Resources'),
        ),
        body: switch (state.status) {
          ResourcesStatus.loading => const LoadingView(),
          ResourcesStatus.failure => const ErrorView(
            message: "Couldn't read the resources.",
          ),
          ResourcesStatus.ready => ListView(
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
                    AppSearchField(
                      controller: _search,
                      hintText: 'Search resources',
                      onChanged: cubit.search,
                      onCleared: () => cubit.search(''),
                    ),
                    FilterChipGroup<ResourceType>(
                      values: ResourceType.values,
                      labelOf: (type) => type.label,
                      selected: state.type,
                      onSelected: cubit.filterByType,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: FilterChip(
                        avatar: const Icon(Icons.bookmark_outline),
                        label: const Text('Saved only'),
                        selected: state.savedOnly,
                        onSelected: (selected) =>
                            cubit.showSavedOnly(savedOnly: selected),
                      ),
                    ),
                  ],
                ),
              ),
              ..._results(context, state),
            ],
          ),
        },
      ),
    );
  }

  List<Widget> _results(BuildContext context, ResourcesState state) {
    final cubit = context.read<ResourcesCubit>();
    final visible = state.visible;
    if (visible.isEmpty) {
      return [
        if (state.savedOnly && state.query.isEmpty && state.type == null)
          const EmptyStateView(
            icon: Icons.bookmark_outline,
            title: 'Nothing saved yet',
            message: 'Tap the bookmark on a resource to keep it here.',
          )
        else
          const EmptyStateView(
            icon: Icons.search_off,
            title: 'No resources match',
            message: 'Try other words or another type.',
          ),
      ];
    }
    return [
      for (final item in visible)
        ResourceCard(
          item: item,
          onTap: () => cubit.open(item),
          onBookmark: () => cubit.toggleBookmark(item),
        ),
    ];
  }
}
