import 'package:dev_journey/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/app_harness.dart';

// Roadmaps, topics and the Dashboard on the real app, with the demo
// progress as of Wednesday 14 October 2026.
void main() {
  tearDown(getIt.reset);

  testWidgets("the Dashboard's figures, worked out by hand", (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);

    expect(find.text('6-day streak'), findsOneWidget);
    expect(find.text('7 of 12 topics completed'), findsOneWidget);
    expect(find.text('State management'), findsOneWidget);
  });

  testWidgets('Continue → complete the topic → the Dashboard follows', (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);

    await tester.tapAndSettle(find.text('Continue'));
    // The title, and a resource of the same name.
    expect(find.text('State management'), findsWidgets);
    expect(appBarTitled('Topic'), findsOneWidget);
    await tester.tap(find.text('Mark complete'));
    await tester.pumpUntilFound(find.text('Completed · tap to undo'));
    expect(find.text('Completed today'), findsOneWidget);

    await tester.tapAndSettle(find.byType(BackButton));
    await tester.pumpUntilFound(find.text('7-day streak'));
    expect(find.text('8 of 12 topics completed'), findsOneWidget);
    expect(find.text('Dependency injection'), findsOneWidget);
  });

  testWidgets('a roadmap\'s path: complete a section, after confirming', (
    tester,
  ) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/roadmaps/flutter',
    );
    expect(appBarTitled('Flutter Developer'), findsOneWidget);
    // The section with the next topic is open.
    expect(find.text('State management'), findsOneWidget);

    await tester.ensureVisible(find.text('Mark section complete'));
    await tester.pumpAndSettle();
    await tester.tapAndSettle(find.text('Mark section complete'));
    await tester.tap(find.widgetWithText(TextButton, 'Complete'));
    await tester.pumpUntilFound(find.text('3 topics completed'));

    expect(find.text('10 of 12 topics completed'), findsOneWidget);
  });

  testWidgets('Roadmaps: search, filter, and make one active', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Roadmaps'));

    await tester.enterText(find.byType(TextField), 'language models');
    await tester.pumpAndSettle();
    expect(find.text('AI Engineer'), findsOneWidget);
    expect(find.text('Flutter Developer'), findsNothing);

    await tester.tapAndSettle(find.text('AI Engineer'));
    await tester.tap(find.text('Set as active roadmap'));
    await tester.pumpUntilFound(find.text('Your active roadmap'));

    await tester.tapAndSettle(find.byType(BackButton));
    await tester.tapAndSettle(destination('Dashboard'));
    await tester.pumpUntilFound(find.text('Prompt engineering'));
    expect(find.text('0 of 7 topics completed'), findsOneWidget);
  });

  testWidgets('a bookmarked topic shows its bookmark everywhere', (
    tester,
  ) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/topics/flutter-di',
    );

    await tester.tap(find.byTooltip('Bookmark'));
    await tester.pumpUntilFound(find.byTooltip('Remove bookmark'));
  });
}
