import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/goals/cubit/goals_cubit.dart';
import 'package:dev_journey/features/goals/cubit/goals_state.dart';
import 'package:dev_journey/features/goals/goals_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<GoalsState> implements GoalsCubit {}

void main() {
  late _MockCubit cubit;
  final today = CalendarDate(2026, 10, 14);

  final reading = GoalProgress(
    goal: Goal(
      id: 'g',
      title: 'Read for 20 minutes',
      kind: GoalKind.custom,
      period: GoalPeriod.daily,
      target: 1,
      createdOn: today,
    ),
    window: GoalWindow(start: today, end: today),
    current: 0,
  );

  setUpAll(() {
    registerFallbackValue(reading);
    registerFallbackValue(GoalPeriod.daily);
  });

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.checkIn(any())).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, GoalsState state) {
    whenListen(cubit, const Stream<GoalsState>.empty(), initialState: state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<GoalsCubit>.value(value: cubit, child: const GoalsView()),
    );
  }

  testWidgets('the period, its goals, and a check-in', (tester) async {
    await pump(
      tester,
      GoalsState(today: today, status: GoalsStatus.ready, goals: [reading]),
    );

    expect(find.text('Read for 20 minutes'), findsOneWidget);
    expect(find.text('0 of 1 check-in today'), findsOneWidget);
    expect(find.text('Resets tomorrow'), findsOneWidget);

    await tester.tap(find.byTooltip('Check in'));
    verify(() => cubit.checkIn(reading)).called(1);

    await tester.tap(find.text('Weekly'));
    verify(() => cubit.selectPeriod(GoalPeriod.weekly)).called(1);
  });

  testWidgets('a period without goals', (tester) async {
    await pump(
      tester,
      GoalsState(
        today: today,
        status: GoalsStatus.ready,
        goals: [reading],
        period: GoalPeriod.monthly,
      ),
    );

    expect(find.text('No monthly goals'), findsOneWidget);
  });

  testWidgets('Add goal opens the sheet on the current period', (tester) async {
    await pump(
      tester,
      GoalsState(
        today: today,
        status: GoalsStatus.ready,
        period: GoalPeriod.weekly,
      ),
    );

    await tester.tap(find.text('Add goal'));
    await tester.pumpAndSettle();

    expect(find.text('New goal'), findsOneWidget);
    expect(
      tester
          .widget<ChoiceChip>(find.widgetWithText(ChoiceChip, 'Weekly'))
          .selected,
      isTrue,
    );
  });
}
