import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_cubit.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_state.dart';
import 'package:dev_journey/features/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockWelcomeCubit extends MockCubit<WelcomeState>
    implements WelcomeCubit {}

void main() {
  late _MockWelcomeCubit cubit;

  setUpAll(() => registerFallbackValue(StartChoice.learn));
  setUp(() {
    cubit = _MockWelcomeCubit();
    when(() => cubit.start(any())).thenAnswer((_) async {});
    when(() => cubit.load()).thenAnswer((_) async {});
  });

  RoadmapProgress roadmap(String id, String title, int topics) =>
      RoadmapProgress(
        roadmap: Roadmap(
          id: id,
          title: title,
          description: '',
          category: RoadmapCategory.mobile,
        ),
        completedTopics: 0,
        totalTopics: topics,
      );

  final ready = WelcomeState(
    status: WelcomeStatus.ready,
    roadmaps: [
      roadmap('flutter', 'Flutter Developer', 12),
      roadmap('backend', 'Backend Developer', 1),
    ],
    selectedRoadmapId: 'flutter',
  );

  Future<void> pump(WidgetTester tester, WelcomeState state) {
    when(() => cubit.state).thenReturn(state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<WelcomeCubit>.value(
        value: cubit,
        child: const WelcomeView(),
      ),
    );
  }

  testWidgets('while the catalog loads, a spinner', (tester) async {
    await pump(tester, const WelcomeState());

    expect(find.text('Getting your roadmaps…'), findsOneWidget);
  });

  testWidgets('a failed load explains, and Try again reloads', (tester) async {
    await pump(
      tester,
      const WelcomeState(
        status: WelcomeStatus.failed,
        errorMessage: "Couldn't reach the server.",
      ),
    );

    expect(find.text("Couldn't reach the server."), findsOneWidget);
    await tester.tap(find.text('Try again'));
    verify(() => cubit.load()).called(1);
  });

  testWidgets('the roadmaps to pick from, with their category and size', (
    tester,
  ) async {
    await pump(tester, ready);

    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('Mobile · 12 topics'), findsOneWidget);
    expect(find.text('Mobile · 1 topic'), findsOneWidget);
  });

  testWidgets('picking a roadmap selects it', (tester) async {
    when(() => cubit.select(any())).thenReturn(null);
    await pump(tester, ready);

    await tester.tap(find.text('Backend Developer'));

    verify(() => cubit.select('backend')).called(1);
  });

  testWidgets('each start reports its choice', (tester) async {
    await pump(tester, ready);

    await tester.tap(find.text('Start learning'));
    await tester.tap(find.text('Explore with demo progress'));

    verify(() => cubit.start(StartChoice.learn)).called(1);
    verify(() => cubit.start(StartChoice.demo)).called(1);
  });

  testWidgets('while starting, both buttons wait', (tester) async {
    await pump(tester, ready.copyWith(starting: StartChoice.demo));

    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
