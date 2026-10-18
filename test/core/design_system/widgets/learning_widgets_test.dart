import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/path_fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('StreakBanner', () {
    for (final (streak, title, subtitle) in [
      (
        const LearningStreak(),
        'Start a streak today',
        'Complete a topic to begin.',
      ),
      (
        const LearningStreak(current: 5, longest: 8),
        '5-day streak',
        'Learn something today to keep it going.',
      ),
      (
        const LearningStreak(current: 5, longest: 8, todayCounts: true),
        '5-day streak',
        'Today counts. Longest: 8 days.',
      ),
    ]) {
      testWidgets(title, (tester) async {
        await tester.pumpThemed(StreakBanner(streak: streak));

        expect(find.text(title), findsOneWidget);
        expect(find.text(subtitle), findsOneWidget);
      });
    }
  });

  testWidgets('DifficultyChip reads its level', (tester) async {
    final semantics = tester.ensureSemantics();
    await tester.pumpThemed(
      const DifficultyChip(difficulty: Difficulty.advanced),
    );

    expect(find.bySemanticsLabel('Difficulty: Advanced'), findsOneWidget);
    semantics.dispose();
  });

  testWidgets('ProgressRing shows and reads the percentage', (tester) async {
    final semantics = tester.ensureSemantics();
    await tester.pumpThemed(const ProgressRing(ratio: 7 / 12));

    expect(find.text('58%'), findsOneWidget);
    expect(find.bySemanticsLabel('58 percent complete'), findsOneWidget);
    semantics.dispose();
  });

  testWidgets('TopicRow: a check when done, and the bookmark', (tester) async {
    final semantics = tester.ensureSemantics();
    await tester.pumpThemed(
      TopicRow(
        item: topicItem(
          'streams',
          completedOn: CalendarDate(2026, 10, 9),
          bookmarked: true,
          minutes: 90,
        ),
        onTap: () {},
      ),
    );

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.byIcon(Icons.bookmark), findsOneWidget);
    expect(find.text('1 h 30 min'), findsOneWidget);
    expect(
      tester.getSemantics(find.byType(TopicRow)),
      matchesSemantics(
        label: 'Topic streams\nDifficulty: Beginner\n1 h 30 min\nBookmarked',
        value: 'completed',
        isButton: true,
        isFocusable: true,
        hasTapAction: true,
        hasFocusAction: true,
      ),
    );
    semantics.dispose();
  });

  testWidgets('FilterChipGroup: All, then each value; again clears', (
    tester,
  ) async {
    final picked = <Difficulty?>[];
    await tester.pumpThemed(
      FilterChipGroup<Difficulty>(
        values: Difficulty.values,
        labelOf: (d) => d.label,
        selected: Difficulty.beginner,
        onSelected: picked.add,
      ),
    );

    await tester.tap(find.text('Advanced'));
    await tester.tap(find.text('Beginner'));
    await tester.tap(find.text('All'));

    expect(picked, [Difficulty.advanced, null, null]);
  });

  group('the confirmation dialog adapts to the platform', () {
    Future<void> open(WidgetTester tester, TargetPlatform platform) async {
      await tester.pumpThemed(
        Builder(
          builder: (context) => TextButton(
            onPressed: () => showConfirmDialog(
              context,
              title: 'Complete?',
              message: '3 topics',
              confirmLabel: 'Complete',
            ),
            child: const Text('open'),
          ),
        ),
        theme: AppTheme.light().copyWith(platform: platform),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('Material on Android', (tester) async {
      await open(tester, TargetPlatform.android);

      // `AlertDialog.adaptive` builds a private subclass, so `byType`
      // (an exact match) can't name it; the Material buttons show it.
      expect(find.byType(CupertinoAlertDialog), findsNothing);
      expect(find.widgetWithText(TextButton, 'Complete'), findsOneWidget);
    });

    testWidgets('an iOS alert on iOS', (tester) async {
      await open(tester, TargetPlatform.iOS);

      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(
        find.widgetWithText(CupertinoDialogAction, 'Complete'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  test('minutes read as minutes and hours', () {
    expect(minutesLabel(45), '45 min');
    expect(minutesLabel(60), '1 h');
    expect(minutesLabel(150), '2 h 30 min');
  });
}
