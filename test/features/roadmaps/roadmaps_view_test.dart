import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_cubit.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_state.dart';
import 'package:dev_journey/features/roadmaps/roadmaps_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<RoadmapsState> implements RoadmapsCubit {}

void main() {
  late _MockCubit cubit;

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.refresh()).thenAnswer((_) async {});
  });

  RoadmapProgress roadmap(String id, String title, RoadmapCategory category) =>
      RoadmapProgress(
        roadmap: Roadmap(
          id: id,
          title: title,
          description: 'About $title',
          category: category,
        ),
        completedTopics: 3,
        totalTopics: 12,
      );

  final roadmaps = [
    roadmap('flutter', 'Flutter Developer', RoadmapCategory.mobile),
    roadmap('backend', 'Backend Developer', RoadmapCategory.backend),
  ];

  Future<void> pump(WidgetTester tester, RoadmapsState state) {
    when(() => cubit.state).thenReturn(state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<RoadmapsCubit>.value(
        value: cubit,
        child: const RoadmapsView(),
      ),
    );
  }

  testWidgets('a card per roadmap, with progress and the active one marked', (
    tester,
  ) async {
    await pump(
      tester,
      RoadmapsState(roadmaps: roadmaps, activeRoadmapId: 'flutter'),
    );

    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('Active'), findsOneWidget);
    expect(find.text('25% complete · 3 of 12 topics'), findsNWidgets(2));
  });

  testWidgets('typing searches; a chip filters', (tester) async {
    when(() => cubit.search(any())).thenReturn(null);
    when(() => cubit.filter(any())).thenReturn(null);
    registerFallbackValue(RoadmapCategory.ai);
    await pump(tester, RoadmapsState(roadmaps: roadmaps));

    await tester.enterText(find.byType(TextField), 'dart');
    await tester.tap(find.widgetWithText(ChoiceChip, 'Backend'));

    verify(() => cubit.search('dart')).called(1);
    verify(() => cubit.filter(RoadmapCategory.backend)).called(1);
  });

  testWidgets('nothing matching says so', (tester) async {
    await pump(tester, RoadmapsState(roadmaps: roadmaps, query: 'zzz'));

    expect(find.text('No roadmaps match'), findsOneWidget);
  });

  testWidgets('pull to refresh syncs', (tester) async {
    await pump(tester, RoadmapsState(roadmaps: roadmaps));

    await tester.fling(
      find.text('Flutter Developer'),
      const Offset(0, 400),
      1000,
    );
    await tester.pumpAndSettle();

    verify(() => cubit.refresh()).called(1);
  });
}
