import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:dev_journey/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:dev_journey/features/dashboard/cubit/dashboard_state.dart';
import 'package:dev_journey/features/dashboard/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/path_fixtures.dart';
import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<DashboardState> implements DashboardCubit {}

void main() {
  late _MockCubit cubit;
  final day = CalendarDate(2026, 10, 14);

  setUp(() => cubit = _MockCubit());

  Future<void> pump(WidgetTester tester, DashboardState state) {
    whenListen(
      cubit,
      const Stream<DashboardState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<DashboardCubit>.value(
        value: cubit,
        child: const DashboardView(),
      ),
    );
  }

  final path = roadmapPath([
    sectionPath('basics', [topicItem('a', completedOn: day), topicItem('b')]),
  ]);

  testWidgets('the streak, the roadmap, the next topic and the totals', (
    tester,
  ) async {
    await pump(
      tester,
      DashboardState(
        summary: DashboardSummary(
          streak: const LearningStreak(current: 3, longest: 3),
          activeRoadmap: path,
          nextTopic: path.sections.single.topics.last,
          topicsCompleted: 9,
          challengesCompleted: 2,
        ),
      ),
    );

    expect(find.text('3-day streak'), findsOneWidget);
    expect(find.text('1 of 2 topics completed'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Topic b'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('Challenges solved'), findsOneWidget);
  });

  testWidgets('a finished roadmap congratulates instead of Continue', (
    tester,
  ) async {
    await pump(
      tester,
      DashboardState(
        summary: DashboardSummary(
          streak: const LearningStreak(),
          activeRoadmap: roadmapPath([
            sectionPath('basics', [topicItem('a', completedOn: day)]),
          ]),
          topicsCompleted: 1,
          challengesCompleted: 0,
        ),
      ),
    );

    expect(find.text('Roadmap complete. Well done!'), findsOneWidget);
    expect(find.text('Continue'), findsNothing);
  });

  testWidgets('no active roadmap: a way to pick one', (tester) async {
    await pump(
      tester,
      const DashboardState(
        summary: DashboardSummary(
          streak: LearningStreak(),
          topicsCompleted: 0,
          challengesCompleted: 0,
        ),
      ),
    );

    expect(find.text('No active roadmap'), findsOneWidget);
    expect(find.text('Browse roadmaps'), findsOneWidget);
  });

  testWidgets('a spinner until the summary arrives', (tester) async {
    await pump(tester, const DashboardState());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
