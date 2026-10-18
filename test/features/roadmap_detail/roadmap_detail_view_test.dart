import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_state.dart';
import 'package:dev_journey/features/roadmap_detail/roadmap_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/path_fixtures.dart';
import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<RoadmapDetailState>
    implements RoadmapDetailCubit {}

void main() {
  late _MockCubit cubit;
  final day = CalendarDate(2026, 10, 14);

  setUp(() {
    cubit = _MockCubit();
    when(
      () =>
          cubit.setSectionCompleted(any(), completed: any(named: 'completed')),
    ).thenAnswer((_) async {});
    when(() => cubit.setActive()).thenAnswer((_) async {});
  });

  final path = roadmapPath([
    sectionPath('basics', [
      topicItem('a', completedOn: day),
      topicItem('b', completedOn: day),
    ]),
    sectionPath('async', [
      topicItem('c', sectionId: 'async'),
      topicItem('d', sectionId: 'async'),
    ]),
  ]);

  Future<void> pump(WidgetTester tester, RoadmapDetailState state) {
    when(() => cubit.state).thenReturn(state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<RoadmapDetailCubit>.value(
        value: cubit,
        child: const RoadmapDetailView(),
      ),
    );
  }

  RoadmapDetailState found({Set<String> expanded = const {'async'}}) =>
      RoadmapDetailState(
        status: RoadmapDetailStatus.found,
        path: path,
        expandedSectionIds: expanded,
      );

  testWidgets('progress, the path, and the open section\'s topics', (
    tester,
  ) async {
    await pump(tester, found());

    expect(find.text('2 of 4 topics completed'), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
    expect(find.text('2 / 2 · Complete'), findsOneWidget);
    expect(find.text('Topic c'), findsOneWidget);
    expect(find.text('Topic a'), findsNothing); // its section is closed
  });

  testWidgets('a section reads its place, progress and state', (tester) async {
    final semantics = tester.ensureSemantics();
    await pump(tester, found());

    expect(
      find.bySemanticsLabel(
        'Section 2 of 2, Section async, 0 of 2 topics complete',
      ),
      findsOneWidget,
    );
    semantics.dispose();
  });

  testWidgets('tapping a section toggles it', (tester) async {
    when(() => cubit.toggleSection(any())).thenReturn(null);
    await pump(tester, found());

    await tester.tap(find.text('Section basics'));

    verify(() => cubit.toggleSection('basics')).called(1);
  });

  testWidgets('completing a section of several topics asks first', (
    tester,
  ) async {
    await pump(tester, found());

    await tester.tap(find.text('Mark section complete'));
    await tester.pumpAndSettle();
    expect(find.text('Complete "Section async"?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    verifyNever(
      () =>
          cubit.setSectionCompleted(any(), completed: any(named: 'completed')),
    );

    await tester.tap(find.text('Mark section complete'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Complete'));
    await tester.pumpAndSettle();
    verify(() => cubit.setSectionCompleted('async', completed: true)).called(1);
  });

  testWidgets('a completed section offers to reopen it, without asking', (
    tester,
  ) async {
    await pump(tester, found(expanded: {'basics'}));

    await tester.tap(find.text('Mark as not done'));
    await tester.pumpAndSettle();

    verify(() => cubit.setSectionCompleted('basics', completed: false))
        .called(1);
  });

  testWidgets('not active: a button makes it so', (tester) async {
    await pump(tester, found());

    await tester.tap(find.text('Set as active roadmap'));

    verify(() => cubit.setActive()).called(1);
  });

  testWidgets('active: says so', (tester) async {
    await pump(tester, found().copyWith(isActive: true));

    expect(find.text('Your active roadmap'), findsOneWidget);
    expect(find.text('Set as active roadmap'), findsNothing);
  });
}
