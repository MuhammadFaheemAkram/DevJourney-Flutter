import 'package:dev_journey/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/app_harness.dart';

// Notes and goals on the real app, with the demo progress as of Wednesday
// 14 October 2026.
void main() {
  tearDown(getIt.reset);

  Finder field(String label) => find.widgetWithText(TextField, label);

  testWidgets('notes: write, edit, swipe away, and Undo', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.openDrawer();
    await tester.tapAndSettle(drawerItem('Notes'));
    await tester.pumpUntilFound(find.text('Streams cheat sheet'));

    await tester.tapAndSettle(find.text('New note'));
    await tester.enterText(field('Title'), 'Keys');
    await tester.enterText(field('Note'), 'Use **ValueKey** in lists.');
    await tester.tap(find.text('Save'));
    await tester.pumpUntilFound(find.text('Use ValueKey in lists.'));
    expect(appBarTitled('Notes'), findsOneWidget);

    await tester.tapAndSettle(find.text('Keys'));
    expect(appBarTitled('Edit note'), findsOneWidget);
    await tester.enterText(field('Keys'), 'Keys in lists');
    await tester.tap(find.text('Save'));
    // The title is in the editor's field too: wait for the list itself.
    await tester.pumpUntilFound(appBarTitled('Notes'));
    expect(find.text('Keys in lists'), findsOneWidget);

    await tester.drag(find.text('Keys in lists'), const Offset(-600, 0));
    await tester.pumpUntilFound(find.text('Deleted “Keys in lists”'));
    expect(find.text('Keys in lists'), findsNothing);
    await tester.tap(find.text('Undo'));
    await tester.pumpUntilFound(find.text('Keys in lists'));
  });

  testWidgets('a note from a topic is attached to it', (tester) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/topics/flutter-state',
    );
    await tester.pumpUntilFound(find.text('Mark complete'));
    // Below the resources: a lazy list builds only what's near the screen.
    await tester.scrollUntilVisible(
      find.text('Add note'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('Nothing yet'), findsOneWidget);
    await tester.tapAndSettle(find.text('Add note'));
    await tester.pumpUntilFound(
      find.text('State management · Flutter Developer'),
    );
    await tester.enterText(field('Title'), 'Pick one');
    await tester.tap(find.text('Save'));

    await tester.pumpUntilFound(appBarTitled('Topic'));
    await tester.pumpUntilFound(find.text('Pick one'));
  });

  testWidgets('deleting in the editor: Undo on the screen underneath', (
    tester,
  ) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/topics/flutter-streams',
    );
    await tester.pumpUntilFound(find.text('Completed · tap to undo'));
    await tester.scrollUntilVisible(
      find.text('Streams cheat sheet'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    await tester.tapAndSettle(find.text('Streams cheat sheet'));
    await tester.pumpUntilFound(find.byTooltip('Delete note'));
    await tester.tap(find.byTooltip('Delete note'));
    await tester.pumpUntilFound(find.text('Deleted “Streams cheat sheet”'));
    expect(appBarTitled('Topic'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await tester.pumpUntilFound(find.text('Streams cheat sheet'));
  });

  testWidgets('closing with edits asks before discarding them', (tester) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/notes',
    );
    await tester.pumpUntilFound(find.text('New note'));
    await tester.tapAndSettle(find.text('New note'));
    await tester.enterText(field('Title'), 'Half a thought');

    await tester.tapAndSettle(find.byType(CloseButton));
    expect(find.text('Discard changes?'), findsOneWidget);
    await tester.tapAndSettle(find.widgetWithText(TextButton, 'Cancel'));
    expect(appBarTitled('New note'), findsOneWidget);

    await tester.tapAndSettle(find.byType(CloseButton));
    await tester.tapAndSettle(find.widgetWithText(TextButton, 'Discard'));
    expect(appBarTitled('Notes'), findsOneWidget);
    expect(find.text('Half a thought'), findsNothing);
  });

  testWidgets('a goal reaches its target: Goals, Dashboard and streak follow', (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.pumpUntilFound(find.text('Read for 20 minutes'));
    expect(find.text('6-day streak'), findsOneWidget);
    expect(find.text('2 of 3 topics this week'), findsOneWidget);

    await tester.tapAndSettle(find.text('Read for 20 minutes'));
    expect(appBarTitled('Goals'), findsOneWidget);
    expect(find.text('0 of 1 check-in today'), findsOneWidget);
    await tester.tap(find.byTooltip('Check in'));
    await tester.pumpUntilFound(find.text('Done today · Resets tomorrow'));
    expect(find.text('1 of 1 check-in today'), findsOneWidget);

    await tester.tapAndSettle(find.byType(BackButton));
    // A check-in makes today an active day.
    await tester.pumpUntilFound(find.text('7-day streak'));
    expect(find.text('Done today · Resets tomorrow'), findsOneWidget);
  });

  testWidgets('a new goal, from the sheet', (tester) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/goals',
    );
    await tester.pumpUntilFound(find.text('Add goal'));

    await tester.tapAndSettle(find.text('Add goal'));
    await tester.enterText(field('Title'), 'Two topics a day');
    await tester.tap(find.byTooltip('Raise the target'));
    await tester.tapAndSettle(find.text('Save'));

    await tester.pumpUntilFound(find.text('Two topics a day'));
    expect(find.text('0 of 2 topics today'), findsOneWidget);
    expect(find.text('Goal added'), findsOneWidget);
  });

  testWidgets("the Dashboard's latest notes open in the editor", (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.pumpUntilFound(find.text('Read for 20 minutes'));
    final note = find.text('Interview questions to practise');

    // Below the fold, and a lazy list builds only what's near the screen.
    await tester.scrollUntilVisible(
      note,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await tester.tapAndSettle(note);

    await tester.pumpUntilFound(appBarTitled('Edit note'));
    expect(field('Interview questions to practise'), findsOneWidget);
  });
}
