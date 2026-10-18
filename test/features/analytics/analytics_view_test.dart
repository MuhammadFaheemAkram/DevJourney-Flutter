import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/features/analytics/analytics_view.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_cubit.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<AnalyticsState> implements AnalyticsCubit {}

void main() {
  final today = CalendarDate(2026, 10, 14);

  LearningAnalytics analytics({
    GoalCompletion goals = const GoalCompletion(met: 6, total: 19),
  }) => LearningAnalytics(
    today: today,
    streak: const LearningStreak(current: 6, longest: 9),
    topicsCompleted: 10,
    totalTopics: 32,
    challengesCompleted: 1,
    goals: goals,
    weekly: [
      for (var i = 7; i >= 0; i--)
        PeriodCount(
          start: today.addDays(-2 - 7 * i),
          end: today.addDays(4 - 7 * i),
          count: i == 0 ? 2 : 1,
        ),
    ],
    monthly: [
      PeriodCount(
        start: CalendarDate(2026, 10, 1),
        end: CalendarDate(2026, 10, 31),
        count: 8,
      ),
    ],
    roadmaps: const [
      RoadmapProgress(
        roadmap: Roadmap(
          id: 'flutter',
          title: 'Flutter Developer',
          description: '',
          category: RoadmapCategory.mobile,
        ),
        completedTopics: 7,
        totalTopics: 12,
      ),
    ],
    activity: {today.addDays(-1): 2},
    heatmapStart: CalendarDate(2026, 4, 20),
  );

  Future<void> pump(WidgetTester tester, LearningAnalytics a) {
    final cubit = _MockCubit();
    whenListen(
      cubit,
      const Stream<AnalyticsState>.empty(),
      initialState: AnalyticsState(status: AnalyticsStatus.ready, analytics: a),
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<AnalyticsCubit>.value(
        value: cubit,
        child: const AnalyticsView(),
      ),
    );
  }

  testWidgets('the cards, the roadmaps, the charts read as text', (
    tester,
  ) async {
    await pump(tester, analytics());

    expect(find.text('6 days'), findsOneWidget);
    expect(find.text('9 days'), findsOneWidget);
    expect(find.text('10 of 32'), findsOneWidget);
    expect(find.text('31% of every roadmap'), findsOneWidget);
    expect(find.text('32%'), findsOneWidget);
    expect(find.text('6 of 19 periods, last 30 days'), findsOneWidget);
    expect(
      find.bySemanticsLabel(
        RegExp(r'^Topics completed per week, last 8 weeks\.'),
      ),
      findsOneWidget,
    );
    // Further down a lazy list: built once scrolled to.
    await tester.scrollUntilVisible(find.text('7 of 12 topics · 58%'), 200);
    await tester.scrollUntilVisible(find.text('More'), 200);
    expect(
      find.bySemanticsLabel(
        RegExp('active on 1 day, 2 completions or check-ins'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('no goals yet', (tester) async {
    await pump(
      tester,
      analytics(goals: const GoalCompletion(met: 0, total: 0)),
    );

    expect(find.text('Set a goal to see this'), findsOneWidget);
  });
}
