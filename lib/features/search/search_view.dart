import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/features/note_editor/open_note_editor.dart';
import 'package:dev_journey/features/search/bloc/search_bloc.dart';
import 'package:dev_journey/features/search/bloc/search_event.dart';
import 'package:dev_journey/features/search/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// One field for everything: results grouped by kind with the matched words
/// in bold; the recent searches while the field is (nearly) empty.
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _field = TextEditingController();

  @override
  void dispose() {
    _field.dispose();
    super.dispose();
  }

  void _searchNow(String query) {
    _field.text = query;
    context.read<SearchBloc>().add(SearchQueryChanged(query, immediate: true));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    final state = context.watch<SearchBloc>().state;
    return BlocListener<SearchBloc, SearchState>(
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
          title: const Text('Search'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.medium,
                AppSpacing.xSmall,
                AppSpacing.medium,
                AppSpacing.xSmall,
              ),
              child: AppSearchField(
                controller: _field,
                autofocus: true,
                hintText: 'Search roadmaps, topics, notes…',
                onChanged: (query) => bloc.add(SearchQueryChanged(query)),
                onSubmitted: _searchNow,
                onCleared: () => bloc.add(const SearchQueryChanged('')),
              ),
            ),
            if (state.status == SearchStatus.searching)
              const LinearProgressIndicator(minHeight: 2)
            else
              const SizedBox(height: 2),
            Expanded(
              child: switch (state.status) {
                SearchStatus.idle => _Recent(
                  searches: state.recentSearches,
                  onSelected: _searchNow,
                ),
                SearchStatus.failure => const ErrorView(
                  message: "Couldn't search. Please try again.",
                ),
                SearchStatus.searching when state.results.isEmpty =>
                  const SizedBox.shrink(),
                SearchStatus.searching || SearchStatus.results
                    when state.results.isEmpty =>
                  EmptyStateView(
                    icon: Icons.search_off,
                    title: 'Nothing matches “${state.query}”',
                    message: 'Try fewer or other words.',
                  ),
                SearchStatus.searching ||
                SearchStatus.results => _Results(results: state.results),
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// The last searches, newest first, or what Search covers.
class _Recent extends StatelessWidget {
  const _Recent({required this.searches, required this.onSelected});

  final List<String> searches;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    if (searches.isEmpty) {
      return const EmptyStateView(
        icon: Icons.manage_search,
        title: 'Search everything',
        message:
            'Roadmaps, topics, your notes, resources and challenges, all at '
            'once.',
      );
    }
    return ListView(
      children: [
        SectionHeader(
          'Recent searches',
          action: TextButton(
            onPressed: () => context.read<SearchBloc>().add(
              const SearchRecentSearchesCleared(),
            ),
            child: const Text('Clear'),
          ),
        ),
        for (final search in searches)
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(search),
            onTap: () => onSelected(search),
          ),
      ],
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.results});

  final SearchResults results;

  static String _groupTitle(SearchKind kind) => switch (kind) {
    SearchKind.roadmap => 'Roadmaps',
    SearchKind.topic => 'Topics',
    SearchKind.note => 'Notes',
    SearchKind.resource => 'Resources',
    SearchKind.challenge => 'Challenges',
  };

  static IconData _icon(SearchKind kind) => switch (kind) {
    SearchKind.roadmap => Icons.route_outlined,
    SearchKind.topic => Icons.topic_outlined,
    SearchKind.note => Icons.sticky_note_2_outlined,
    SearchKind.resource => Icons.local_library_outlined,
    SearchKind.challenge => Icons.code,
  };

  void _open(BuildContext context, SearchHit hit) {
    context.read<SearchBloc>().add(SearchHitOpened(hit));
    switch (hit.kind) {
      case SearchKind.roadmap:
        RoadmapDetailRoute(roadmapId: hit.id).push<void>(context);
      case SearchKind.topic:
        TopicDetailRoute(topicId: hit.id).push<void>(context);
      case SearchKind.note:
        openNoteEditor(context, noteId: hit.id);
      case SearchKind.challenge:
        ChallengeDetailRoute(challengeId: hit.id).push<void>(context);
      case SearchKind.resource:
        // The Bloc opens the link in the in-app browser.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.large),
      children: [
        Semantics(
          liveRegion: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            child: Text(
              countLabel(results.count, 'result'),
              style: theme.textTheme.labelLarge,
            ),
          ),
        ),
        for (final MapEntry(key: kind, value: hits)
            in results.groups.entries) ...[
          SectionHeader('${_groupTitle(kind)} (${hits.length})'),
          for (final hit in hits)
            ListTile(
              leading: Icon(_icon(kind)),
              title: HighlightedTextView(
                text: hit.title,
                style: theme.textTheme.bodyLarge,
              ),
              subtitle: hit.snippet.text.isEmpty
                  ? null
                  : HighlightedTextView(
                      text: hit.snippet,
                      maxLines: 2,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
              trailing: kind == SearchKind.resource
                  ? const Icon(
                      Icons.open_in_new,
                      semanticLabel: 'Opens in the browser',
                    )
                  : null,
              onTap: () => _open(context, hit),
            ),
        ],
      ],
    );
  }
}
