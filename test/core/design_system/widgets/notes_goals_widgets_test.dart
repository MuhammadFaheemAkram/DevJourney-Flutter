import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_app.dart';

void main() {
  final today = CalendarDate(2026, 10, 14); // Wednesday
  final now = DateTime(2026, 10, 14, 15);

  GoalProgress progress(GoalKind kind, {int current = 2, int target = 3}) =>
      GoalProgress(
        goal: Goal(
          id: 'g',
          title: 'Keep going',
          kind: kind,
          period: GoalPeriod.weekly,
          target: target,
          createdOn: today,
        ),
        window: GoalWindow(
          start: CalendarDate(2026, 10, 12),
          end: CalendarDate(2026, 10, 18),
        ),
        current: current,
      );

  group('GoalCard', () {
    testWidgets('progress, the count and when it resets', (tester) async {
      await tester.pumpThemed(
        GoalCard(progress: progress(GoalKind.topics), today: today),
      );

      expect(find.text('2 of 3 topics this week'), findsOneWidget);
      expect(find.text('Resets Monday'), findsOneWidget);
      expect(
        tester
            .widget<LinearProgressIndicator>(
              find.byType(LinearProgressIndicator),
            )
            .value,
        closeTo(2 / 3, 0.001),
      );
      // Automatic: no check-in buttons.
      expect(find.byTooltip('Check in'), findsNothing);
    });

    testWidgets('custom: − and +, which stop at 0 and at the target', (
      tester,
    ) async {
      var checkIns = 0;
      var undos = 0;
      Future<void> pump(GoalProgress p) => tester.pumpThemed(
        GoalCard(
          progress: p,
          today: today,
          onCheckIn: () => checkIns++,
          onUndoCheckIn: () => undos++,
        ),
      );

      await pump(progress(GoalKind.custom, current: 1));
      await tester.tap(find.byTooltip('Check in'));
      await tester.tap(find.byTooltip('Undo a check-in'));
      expect((checkIns, undos), (1, 1));

      await pump(progress(GoalKind.custom, current: 3));
      expect(find.text('Done this week · Resets Monday'), findsOneWidget);
      await tester.tap(find.byTooltip('Check in'));
      expect(checkIns, 1);

      await pump(progress(GoalKind.custom, current: 0));
      await tester.tap(find.byTooltip('Undo a check-in'));
      expect(undos, 1);
    });
  });

  testWidgets('NoteRow: title, plain preview, topic and when', (tester) async {
    await tester.pumpThemed(
      NoteRow(
        now: now,
        item: NoteItem(
          note: Note(
            id: 'n',
            title: 'Streams',
            content: '# Streams\n\n- **Single** subscription',
            createdAt: now,
            updatedAt: now.subtract(const Duration(minutes: 5)),
          ),
          topicTitle: 'Async',
        ),
      ),
    );

    expect(find.text('Streams Single subscription'), findsOneWidget);
    expect(find.text('Async'), findsOneWidget);
    expect(find.text('5 min ago'), findsOneWidget);
  });

  group('NoteMarkdown', () {
    // Our theme, not flutter/material's default (conventions §11.55): in
    // dark mode, the text must be light.
    Color? colorOf(WidgetTester tester, String text) {
      final rich = tester.widget<RichText>(
        find.byWidgetPredicate(
          (widget) =>
              widget is RichText && widget.text.toPlainText().contains(text),
        ),
      );
      Color? found;
      void visit(InlineSpan span, Color? inherited) {
        final color = span.style?.color ?? inherited;
        if (span is TextSpan) {
          if (span.text?.contains(text) ?? false) found ??= color;
          for (final child in span.children ?? const <InlineSpan>[]) {
            visit(child, color);
          }
        }
      }

      visit(rich.text, null);
      return found;
    }

    for (final theme in [AppTheme.light(), AppTheme.dark()]) {
      testWidgets('${theme.brightness.name}: text in the theme colors', (
        tester,
      ) async {
        await tester.pumpThemed(
          const NoteMarkdown(data: '# Title\n\nBody text and `code`'),
          theme: theme,
        );

        expect(colorOf(tester, 'Title'), theme.colorScheme.onSurface);
        expect(colorOf(tester, 'Body text'), theme.colorScheme.onSurface);
        expect(
          noteMarkdownStyle(theme).code?.backgroundColor,
          theme.colorScheme.surfaceContainerHighest,
        );
      });
    }
  });
}
