import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/features/search/bloc/search_bloc.dart';
import 'package:dev_journey/features/search/bloc/search_event.dart';
import 'package:dev_journey/features/search/bloc/search_state.dart';
import 'package:dev_journey/features/search/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

void main() {
  late _MockBloc bloc;

  setUpAll(() => registerFallbackValue(const SearchSubscriptionRequested()));

  setUp(() => bloc = _MockBloc());

  Future<void> pump(WidgetTester tester, SearchState state) {
    whenListen(bloc, const Stream<SearchState>.empty(), initialState: state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<SearchBloc>.value(value: bloc, child: const SearchView()),
    );
  }

  SearchHit hit(SearchKind kind, String id, String title) => SearchHit(
    kind: kind,
    id: id,
    title: HighlightedText(text: title, matches: const [(0, 3)]),
    snippet: HighlightedText(text: 'About $title'),
    rank: -1,
  );

  testWidgets('typing reaches the Bloc', (tester) async {
    await pump(tester, const SearchState());

    await tester.enterText(find.byType(TextField), 'str');

    final event = verify(() => bloc.add(captureAny())).captured.last;
    expect((event as SearchQueryChanged).query, 'str');
    expect(event.immediate, isFalse);
  });

  testWidgets('idle: the recent searches, which search again', (tester) async {
    await pump(tester, const SearchState(recentSearches: ['streams', 'keys']));

    expect(find.text('Recent searches'), findsOneWidget);
    await tester.tap(find.text('keys'));

    final event = verify(() => bloc.add(captureAny())).captured.last;
    expect((event as SearchQueryChanged).immediate, isTrue);
    expect(find.widgetWithText(TextField, 'keys'), findsOneWidget);

    await tester.tap(find.text('Clear'));
    expect(
      verify(() => bloc.add(captureAny())).captured.last,
      isA<SearchRecentSearchesCleared>(),
    );
  });

  testWidgets('results grouped by kind, with counts', (tester) async {
    await pump(
      tester,
      SearchState(
        status: SearchStatus.results,
        query: 'str',
        results: SearchResults(
          groups: {
            SearchKind.topic: [hit(SearchKind.topic, 't', 'Streams')],
            SearchKind.resource: [
              hit(SearchKind.resource, 'r1', 'Streams docs'),
              hit(SearchKind.resource, 'r2', 'Stream video'),
            ],
          },
        ),
      ),
    );

    expect(find.text('3 results'), findsOneWidget);
    expect(find.text('Topics (1)'), findsOneWidget);
    expect(find.text('Resources (2)'), findsOneWidget);
    expect(find.text('About Streams'), findsOneWidget);

    await tester.tap(find.text('Streams docs', findRichText: true));
    final event = verify(() => bloc.add(captureAny())).captured.last;
    expect((event as SearchHitOpened).hit.id, 'r1');
  });

  testWidgets('nothing matches', (tester) async {
    await pump(
      tester,
      const SearchState(status: SearchStatus.results, query: 'zzz'),
    );

    expect(find.text('Nothing matches “zzz”'), findsOneWidget);
  });
}
