import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;
  final today = CalendarDate(2026, 10, 14);

  setUp(() async {
    stack = DataStack();
    await stack.syncCatalogNow();
  });
  tearDown(() => stack.close());

  const draft = GoalDraft(
    title: 'Read',
    kind: GoalKind.custom,
    period: GoalPeriod.daily,
    target: 2,
  );

  Future<Goal> add() async =>
      ((await stack.goals.addGoal(draft)) as Ok<Goal>).value;

  test('adding: an id, created today', () async {
    final goal = await add();

    expect(goal.id, startsWith('goal_'));
    expect(goal.createdOn, today);
    expect(await stack.goals.watchGoals().first, [goal]);
  });

  test('updating changes everything but the id and creation day', () async {
    final goal = await add();

    await stack.goals.updateGoal(
      goal.id,
      draft.copyWith(title: 'Read more', period: GoalPeriod.weekly, target: 5),
    );

    expect(
      await stack.goals.findGoal(goal.id),
      goal.copyWith(title: 'Read more', period: GoalPeriod.weekly, target: 5),
    );
  });

  test('check-ins land on today, by goal; undo takes the latest', () async {
    final goal = await add();

    await stack.goals.checkIn(goal.id);
    await stack.goals.checkIn(goal.id);
    expect((await stack.goals.watchActivity().first).checkIns, {
      goal.id: [today, today],
    });

    await stack.goals.undoCheckIn(goal.id, from: today);
    expect((await stack.goals.watchActivity().first).checkIns, {
      goal.id: [today],
    });
  });

  test('deleting removes the goal and its check-ins', () async {
    final goal = await add();
    await stack.goals.checkIn(goal.id);

    await stack.goals.deleteGoal(goal.id);

    expect(await stack.goals.watchGoals().first, isEmpty);
    expect((await stack.goals.watchActivity().first).checkIns, isEmpty);
  });
}
