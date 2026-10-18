import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/domain/usecase/open_resource_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_search_results_use_case.dart';
import 'package:dev_journey/features/search/bloc/search_bloc.dart';
import 'package:dev_journey/features/search/bloc/search_event.dart';
import 'package:dev_journey/features/search/bloc/search_state.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

class _MockWatchResults extends Mock implements WatchSearchResultsUseCase {}

class _MockOpenResource extends Mock implements OpenResourceUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;
  late _MockWatchResults watchResults;
  late _MockOpenResource openResource;

  SearchResults resultsFor(String id) => SearchResults(
    groups: {
      SearchKind.topic: [
        SearchHit(
          kind: SearchKind.topic,
          id: id,
          title: HighlightedText(text: id),
          snippet: const HighlightedText(text: ''),
          rank: -1,
        ),
      ],
    },
  );

  setUp(() {
    stack = DataStack();
    watchResults = _MockWatchResults();
    openResource = _MockOpenResource();
    when(() => watchResults(any())).thenAnswer(
      (invocation) => Stream.value(
        resultsFor(invocation.positionalArguments.single as String),
      ),
    );
    when(() => openResource(any())).thenAnswer((_) async => const Ok(null));
  });
  tearDown(() => stack.close());

  SearchBloc build({
    Duration debounce = const Duration(milliseconds: 10),
    bool closeAfterTest = true,
  }) {
    final bloc = SearchBloc(
      watchResults,
      stack.watchRecentSearches,
      stack.saveRecentSearch,
      stack.clearRecentSearches,
      openResource,
      debounce: debounce,
    );
    if (closeAfterTest) addTearDown(bloc.close);
    return bloc;
  }

  List<String> searched() => [
    for (final call in verify(() => watchResults(captureAny())).captured)
      call as String,
  ];

  group('timing (fake time)', () {
    // A stubbed search, so nothing here waits on the real event loop.
    test('a query waits out 300 ms, then runs', () {
      fakeAsync((time) {
        // Closed inside the fake zone it was made in: a close awaited
        // after the test would wait on fake timers forever.
        final bloc = build(
          debounce: const Duration(milliseconds: 300),
          closeAfterTest: false,
        );
        final states = <SearchState>[];
        final subscription = bloc.stream.listen(states.add);

        bloc.add(const SearchQueryChanged('streams'));
        time.elapse(const Duration(milliseconds: 299));
        verifyNever(() => watchResults(any()));
        expect(states, isEmpty);

        time.elapse(const Duration(milliseconds: 1));
        expect(searched(), ['streams']);
        expect(states.map((s) => s.status), [
          SearchStatus.searching,
          SearchStatus.results,
        ]);

        unawaited(subscription.cancel());
        unawaited(bloc.close());
        time.flushMicrotasks();
      });
    });
  });

  // Switching awaits real cancels: tested in real time with a short
  // debounce (conventions §11.29).
  group('typing', () {
    test('only the last query typed within the debounce runs', () async {
      final bloc = build()
        ..add(const SearchQueryChanged('st'))
        ..add(const SearchQueryChanged('str'))
        ..add(const SearchQueryChanged('strea'));

      await waitFor(bloc, (s) => s.status == SearchStatus.results);

      expect(searched(), ['strea']);
      expect(bloc.state.results, resultsFor('strea'));
    });

    test('fewer than two characters: idle, no search', () async {
      final bloc = build()..add(const SearchQueryChanged(' s '));

      await waitFor(bloc, (s) => s.query == 's');

      expect(bloc.state.status, SearchStatus.idle);
      verifyNever(() => watchResults(any()));
    });

    test('a newer query stops the older one\'s live results', () async {
      final older = StreamController<SearchResults>();
      addTearDown(older.close);
      when(() => watchResults('older')).thenAnswer((_) => older.stream);
      final bloc = build()
        ..add(const SearchQueryChanged('older', immediate: true));
      await waitFor(bloc, (s) => s.status == SearchStatus.searching);

      bloc.add(const SearchQueryChanged('newer', immediate: true));
      await waitFor(bloc, (s) => s.status == SearchStatus.results);
      older.add(resultsFor('stale'));
      await pumpEventQueue();

      expect(bloc.state.query, 'newer');
      expect(bloc.state.results, resultsFor('newer'));
    });

    test('results stay live', () async {
      final live = StreamController<SearchResults>();
      addTearDown(live.close);
      when(() => watchResults('notes')).thenAnswer((_) => live.stream);
      final bloc = build()
        ..add(const SearchQueryChanged('notes', immediate: true));

      live.add(resultsFor('a'));
      await waitFor(bloc, (s) => s.results == resultsFor('a'));
      live.add(resultsFor('b'));
      await waitFor(bloc, (s) => s.results == resultsFor('b'));
    });
  });

  group('recent searches', () {
    test('opening a result remembers the query; Clear empties them', () async {
      final bloc = build()
        ..add(const SearchSubscriptionRequested())
        ..add(const SearchQueryChanged('streams', immediate: true));
      await waitFor(bloc, (s) => s.status == SearchStatus.results);

      bloc.add(SearchHitOpened(resultsFor('x').groups.values.first.first));
      await waitFor(bloc, (s) => s.recentSearches.isNotEmpty);
      expect(bloc.state.recentSearches, ['streams']);

      bloc.add(const SearchRecentSearchesCleared());
      await waitFor(bloc, (s) => s.recentSearches.isEmpty);
    });
  });

  group('opening a resource', () {
    const hit = SearchHit(
      kind: SearchKind.resource,
      id: 'res-null-safety',
      title: HighlightedText(text: 'Sound null safety'),
      snippet: HighlightedText(text: 'dart.dev'),
      rank: -1,
    );

    blocTest<SearchBloc, SearchState>(
      'opens its link',
      build: build,
      act: (bloc) => bloc.add(const SearchHitOpened(hit)),
      verify: (_) => verify(() => openResource('res-null-safety')).called(1),
    );

    test('a failure is said', () async {
      when(() => openResource(any()))
          .thenAnswer((_) async => const Err(LinkOpenFailedException()));
      final bloc = build()..add(const SearchHitOpened(hit));

      await waitFor(bloc, (s) => s.messageSerial == 1);
    });
  });

  test('on the real stack: the demo, grouped and highlighted', () async {
    await stack.loadDemo();
    final bloc = SearchBloc(
      stack.watchSearchResults,
      stack.watchRecentSearches,
      stack.saveRecentSearch,
      stack.clearRecentSearches,
      stack.openResource,
      debounce: Duration.zero,
    );
    addTearDown(bloc.close);

    bloc.add(const SearchQueryChanged('cheat', immediate: true));
    final state = await waitFor(bloc, (s) => s.status == SearchStatus.results);

    final note = state.results.groups[SearchKind.note]!.single;
    expect(note.id, 'note-streams');
    expect(note.title.text, 'Streams cheat sheet');
    expect(note.title.matches, [(8, 13)]);
  });
}
