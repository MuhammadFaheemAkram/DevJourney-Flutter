import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/app_harness.dart';
import '../helpers/fakes/fake_reminder_scheduler.dart';

// Settings and Analytics on the real app, with the demo progress as of
// Wednesday 14 October 2026.
void main() {
  tearDown(getIt.reset);

  FakeReminderScheduler reminders() =>
      getIt<ReminderScheduler>() as FakeReminderScheduler;

  Future<void> scrollTo(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(
      finder,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
  }

  testWidgets('Dark, from Settings, for the whole app', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Settings'));

    await tester.tapAndSettle(find.text('Dark'));

    final context = tester.element(find.byType(Scaffold).first);
    expect(Theme.of(context).brightness, Brightness.dark);
    await tester.tapAndSettle(destination('Dashboard'));
    expect(
      Theme.of(tester.element(find.byType(Scaffold).first)).brightness,
      Brightness.dark,
    );
  });

  testWidgets('the reminder: on, denied, then on', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Settings'));
    reminders().granted = false;

    await tester.tap(find.text('Remind me to learn'));
    await tester.pumpUntilFound(find.textContaining('Allow notifications'));
    expect(reminders().scheduled, isNull);

    reminders().granted = true;
    await tester.tap(find.text('Remind me to learn'));
    await tester.pumpUntilFound(find.text('Every day at 7:00 PM'));
    expect(reminders().calls.last, 'schedule 19:00');
    expect(find.textContaining('Allow notifications'), findsNothing);

    await tester.tap(find.text('Remind me to learn'));
    await tester.pumpUntilFound(find.text('Off'));
    expect(reminders().calls.last, 'cancel');
  });

  testWidgets('reset progress: the Dashboard starts over', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    expect(find.text('6-day streak'), findsOneWidget);
    await tester.tapAndSettle(destination('Settings'));

    await scrollTo(tester, find.text('Reset progress'));
    await tester.tapAndSettle(find.text('Reset progress'));
    await tester.tap(find.widgetWithText(TextButton, 'Reset'));
    await tester.pumpUntilFound(find.textContaining('Progress reset'));

    await tester.tapAndSettle(destination('Dashboard'));
    await tester.pumpUntilFound(find.text('Start a streak today'));
  });

  testWidgets('a published catalog update, synced from Settings', (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Settings'));
    await scrollTo(tester, find.text('Publish a catalog update'));
    await tester.tapAndSettle(find.text('Publish a catalog update'));

    await scrollTo(tester, find.text('Sync catalog'));
    await tester.tap(find.text('Sync catalog'));
    await tester.pumpUntilFound(find.text('3 new topics, 3 new resources'));
    expect(find.text('Catalog version 2'), findsOneWidget);

    await tester.tapAndSettle(destination('Dashboard'));
    await tester.pumpUntilFound(find.text('7 of 13 topics completed'));
  });

  testWidgets('Analytics follows a completion', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Analytics'));
    await tester.pumpUntilFound(find.text('10 of 32'));

    await tester.tapAndSettle(destination('Dashboard'));
    await tester.tapAndSettle(find.text('Continue'));
    await tester.tap(find.text('Mark complete'));
    await tester.pumpUntilFound(find.text('Completed · tap to undo'));
    await tester.tapAndSettle(find.byType(BackButton));

    await tester.tapAndSettle(destination('Analytics'));
    await tester.pumpUntilFound(find.text('11 of 32'));
    expect(find.text('7 days'), findsWidgets);
  });

  testWidgets('About shows the version', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Settings'));
    await scrollTo(tester, find.text('About DevJourney'));
    await tester.tapAndSettle(find.text('About DevJourney'));

    expect(find.text('Version 1.0.0 (1)'), findsOneWidget);
  });
}
