import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/goals/widgets/goal_editor_sheet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/pump_app.dart';

void main() {
  GoalEditorResult? result;

  Future<void> open(WidgetTester tester, {Goal? existing}) async {
    result = null;
    tester.usePhoneSurface();
    await tester.pumpThemed(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await showAppSheet<GoalEditorResult>(
            context,
            (_) => GoalEditorSheet(existing: existing),
          ),
          child: const Text('Open'),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('a title is required', (tester) async {
    await open(tester);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Give the goal a title'), findsOneWidget);
    expect(result, isNull);
  });

  testWidgets('saves the kind, period and target chosen', (tester) async {
    await open(tester);
    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.remove))
          .onPressed,
      isNull,
      reason: 'the target starts at its minimum, 1',
    );

    await tester.enterText(find.byType(TextField), ' Ship it ');
    await tester.tap(find.text('Custom'));
    await tester.tap(find.text('Weekly'));
    await tester.tap(find.byTooltip('Raise the target'));
    await tester.tap(find.byTooltip('Raise the target'));
    await tester.pump();
    expect(find.text('3 check-ins this week'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(
      (result! as SaveGoal).draft,
      const GoalDraft(
        title: ' Ship it ',
        kind: GoalKind.custom,
        period: GoalPeriod.weekly,
        target: 3,
      ),
    );
  });

  testWidgets('an existing goal: filled in, and Delete after confirming', (
    tester,
  ) async {
    await open(
      tester,
      existing: Goal(
        id: 'g',
        title: 'Read',
        kind: GoalKind.custom,
        period: GoalPeriod.daily,
        target: 50,
        createdOn: CalendarDate(2026, 10, 1),
      ),
    );
    expect(find.text('Edit goal'), findsOneWidget);
    expect(find.text('50 check-ins today'), findsOneWidget);
    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.add))
          .onPressed,
      isNull,
      reason: 'the target stops at 50',
    );

    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Its check-ins are deleted too.'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Delete').last);
    await tester.pumpAndSettle();

    expect(result, isA<DeleteGoal>());
  });
}
