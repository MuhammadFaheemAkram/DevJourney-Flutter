import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() async {
    stack = DataStack(); // Wednesday 14 October 2026
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  Future<GoalProgress> progressOf(String title) async =>
      (await stack.watchGoalProgress().first).singleWhere(
        (p) => p.goal.title == title,
      );

  group('SaveNote', () {
    test('trims the title and trailing blank space, keeps the rest', () async {
      final result = await stack.saveNote(
        const NoteDraft(title: '  Hooks  ', content: '# A\n\n  - b\n\n\n'),
      );

      final note = (result as Ok<Note>).value;
      expect(note.title, 'Hooks');
      expect(note.content, '# A\n\n  - b');
    });

    test('refuses what the editor should have caught', () async {
      final result = await stack.saveNote(
        const NoteDraft(title: ' ', content: 'text'),
      );

      expect((result as Err).exception, isA<InvalidInputException>());
    });
  });

  group('SaveGoal', () {
    test('refuses an out-of-range target', () async {
      final result = await stack.saveGoal(
        const GoalDraft(
          title: 'Too much',
          kind: GoalKind.topics,
          period: GoalPeriod.daily,
          target: 51,
        ),
      );

      expect((result as Err).exception, isA<InvalidInputException>());
    });
  });

  group('CheckInGoal', () {
    test('counts towards a custom goal, up to its target', () async {
      const title = 'Read for 20 minutes';
      expect(await stack.checkInGoal(await progressOf(title)), isA<Ok<void>>());

      final met = await progressOf(title);
      expect((met.current, met.isMet), (1, true));
      final again = await stack.checkInGoal(met);
      expect((again as Err).exception, isA<GoalAlreadyMetException>());
      expect((await progressOf(title)).current, 1);
    });

    test('an automatic goal takes no check-ins', () async {
      final result = await stack.checkInGoal(
        await progressOf('Complete 3 topics a week'),
      );

      expect((result as Err).exception, isA<AutomaticGoalException>());
    });
  });

  test("UndoCheckIn takes back today's, never an earlier window's", () async {
    const title = 'Read for 20 minutes';
    await stack.checkInGoal(await progressOf(title));

    await stack.undoCheckIn(await progressOf(title));
    expect((await progressOf(title)).current, 0);

    // Yesterday's demo check-in stays.
    await stack.undoCheckIn(await progressOf(title));
    final checkIns = (await stack.goals.watchActivity().first).checkIns;
    expect(checkIns['goal-daily-reading'], hasLength(4));
  });

  test('completing a topic moves the topic goals at once', () async {
    final progress = stack.watchGoalProgress();

    await stack.setTopicCompleted('flutter-state', completed: true);
    final after = await progress.firstWhere(
      (goals) => goals.any((p) => p.goal.title.contains('3 topics') && p.isMet),
    );

    expect(
      after.singleWhere((p) => p.goal.title.contains('this month')).current,
      9,
    );
  });
}
