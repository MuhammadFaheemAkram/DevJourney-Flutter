import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/goals/cubit/goals_cubit.dart';
import 'package:dev_journey/features/goals/cubit/goals_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  Future<GoalsCubit> open() async {
    final cubit = GoalsCubit(
      stack.watchGoalProgress,
      stack.saveGoal,
      stack.deleteGoal,
      stack.checkInGoal,
      stack.undoCheckIn,
      stack.clock,
    )..load();
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.status == GoalsStatus.ready);
    return cubit;
  }

  List<String> visible(GoalsState state) => [
    for (final p in state.visible) '${p.goal.title} ${p.current}',
  ];

  test('the goals of the chosen period', () async {
    final cubit = await open();
    expect(visible(cubit.state), ['Read for 20 minutes 0']);

    cubit.selectPeriod(GoalPeriod.weekly);
    expect(visible(cubit.state), [
      'Complete 3 topics a week 2',
      'Solve a challenge every week 0',
    ]);
  });

  test('check in, then undo', () async {
    final cubit = await open();

    await cubit.checkIn(cubit.state.visible.single);
    await waitFor(cubit, (s) => s.visible.single.isMet);

    await cubit.undoCheckIn(cubit.state.visible.single);
    await waitFor(cubit, (s) => s.visible.single.current == 0);
  });

  test('a met goal takes no more: says so', () async {
    final cubit = await open();
    await cubit.checkIn(cubit.state.visible.single);
    final met = (await waitFor(
      cubit,
      (s) => s.visible.single.isMet,
    )).visible.single;

    await cubit.checkIn(met);

    expect(cubit.state.message, contains('already met'));
  });

  test("adding a goal shows its period's tab", () async {
    final cubit = await open();

    await cubit.save(
      const GoalDraft(
        title: 'Two challenges a month',
        kind: GoalKind.challenges,
        period: GoalPeriod.monthly,
        target: 2,
      ),
    );

    expect(cubit.state.period, GoalPeriod.monthly);
    expect(cubit.state.message, 'Goal added');
    final state = await waitFor(cubit, (s) => s.visible.length == 2);
    // The demo's challenge was finished on 10 October: it counts.
    expect(visible(state).last, 'Two challenges a month 1');
  });

  test('deleting a goal', () async {
    final cubit = await open();

    await cubit.delete(cubit.state.visible.single.goal.id);

    expect(cubit.state.message, 'Goal deleted');
    await waitFor(cubit, (s) => s.visible.isEmpty);
  });
}
