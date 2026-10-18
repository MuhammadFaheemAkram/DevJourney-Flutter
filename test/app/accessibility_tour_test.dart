import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/app_harness.dart';

// Every screen, in light and dark, with text at 200%: no layout overflows
// (an overflow fails the test), tap targets of at least 48 × 48, a label on
// everything tappable, and readable text contrast. Each phase adds its
// screens and states here.
void main() {
  tearDown(getIt.reset);

  for (final brightness in Brightness.values) {
    group('${brightness.name} theme, text at 200%', () {
      Future<void> open(
        WidgetTester tester, {
        required String at,
        bool onboarded = true,
        bool withDemoProgress = false,
        Future<void> Function()? beforeLaunch,
      }) async {
        tester.platformDispatcher
          ..textScaleFactorTestValue = 2
          ..platformBrightnessTestValue = brightness;
        addTearDown(tester.platformDispatcher.clearAllTestValues);
        await pumpDevJourney(
          tester,
          onboarded: onboarded,
          withDemoProgress: withDemoProgress,
          initialLocation: at,
          beforeLaunch: beforeLaunch,
        );
        // Welcome syncs the catalog on the real event loop (§11.44).
        await tester.settleRealAsync();
        // Phone width, but tall enough to lay out every item of a long list:
        // the checks below see only what is built.
        tester.view.physicalSize = const Size(390 * 3, 6000 * 3);
        await tester.pumpAndSettle();
        final context = tester.element(find.byType(Scaffold).first);
        expect(MediaQuery.textScalerOf(context).scale(10), 20);
        expect(Theme.of(context).brightness, brightness);
      }

      Future<void> expectAccessible(WidgetTester tester) async {
        final handle = tester.ensureSemantics();
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      }

      testWidgets('Welcome, the roadmaps to pick from', (tester) async {
        await open(tester, at: '/welcome', onboarded: false);
        expect(find.text('Pick a roadmap to start with'), findsOneWidget);
        await expectAccessible(tester);
      });

      testWidgets('Welcome, offline', (tester) async {
        await open(
          tester,
          at: '/welcome',
          onboarded: false,
          beforeLaunch: () async =>
              getIt<NetworkSimulator>().failRequests = true,
        );
        expect(find.text('Try again'), findsOneWidget);
        await expectAccessible(tester);
      });

      for (final (name, location) in [
        ('Dashboard, with progress', '/dashboard'),
        ('Roadmaps, with progress', '/roadmaps'),
        ('A learning path', '/roadmaps/flutter'),
        ('A topic to learn', '/topics/flutter-state'),
        ('A completed topic, with a note', '/topics/flutter-streams'),
        ('Notes, with the demo notes', '/notes'),
        ('Editing a note', '/notes/note-streams'),
        ('Goals, with progress', '/goals'),
        ('Challenges, with progress', '/challenges'),
        (
          'A challenge in progress, with notes',
          '/challenges/ch-responsive-grid',
        ),
        ('Resources, with saved ones', '/resources'),
        ('Search, before typing', '/search'),
      ]) {
        testWidgets(name, (tester) async {
          await open(tester, at: location, withDemoProgress: true);
          await expectAccessible(tester);
        });
      }

      testWidgets('completing a section: the confirmation', (tester) async {
        await open(tester, at: '/roadmaps/flutter', withDemoProgress: true);
        await tester.tap(find.text('Mark section complete'));
        await tester.pumpAndSettle();
        expect(find.text('Complete "Architecture"?'), findsOneWidget);
        await expectAccessible(tester);
      });

      testWidgets("a note's Preview", (tester) async {
        await open(tester, at: '/notes/note-streams', withDemoProgress: true);
        await tester.tap(find.text('Preview'));
        await tester.pumpAndSettle();
        expect(find.text('Always keep the `StreamSubscription`'), findsNothing);
        await expectAccessible(tester);
      });

      testWidgets('the topic picker', (tester) async {
        await open(tester, at: '/notes/new', withDemoProgress: true);
        await tester.tap(find.text('None'));
        await tester.pumpAndSettle();
        expect(find.text('Attach to a topic'), findsOneWidget);
        await expectAccessible(tester);
      });

      testWidgets('the goal sheet, editing a custom goal', (tester) async {
        await open(tester, at: '/goals', withDemoProgress: true);
        await tester.tap(find.text('Read for 20 minutes'));
        await tester.pumpAndSettle();
        expect(find.text('Edit goal'), findsOneWidget);
        await expectAccessible(tester);
      });

      testWidgets('a challenge with its hints shown', (tester) async {
        await open(
          tester,
          at: '/challenges/ch-debounce',
          withDemoProgress: true,
        );
        for (var i = 0; i < 3; i++) {
          await tester.tap(find.textContaining('hint'));
          await tester.pumpAndSettle();
        }
        expect(find.textContaining('Show'), findsNothing);
        await expectAccessible(tester);
      });

      testWidgets('search results, grouped and highlighted', (tester) async {
        await open(tester, at: '/search', withDemoProgress: true);
        await tester.enterText(find.byType(TextField), 'stream');
        await tester.pumpUntilFound(find.textContaining('results'));
        await expectAccessible(tester);
      });

      testWidgets('the navigation drawer', (tester) async {
        await open(tester, at: '/dashboard');
        await tester.openDrawer();
        expect(find.byType(Drawer), findsOneWidget);
        await expectAccessible(tester);
      });

      for (final (name, location) in [
        ('Dashboard', '/dashboard'),
        ('Roadmaps', '/roadmaps'),
        ('Challenges', '/challenges'),
        ('Analytics', '/analytics'),
        ('Settings', '/settings'),
        ('Roadmap detail', '/roadmaps/flutter'),
        ('Topic detail', '/topics/flutter-streams'),
        ('Notes', '/notes'),
        ('New note', '/notes/new'),
        ('Goals', '/goals'),
        ('Challenge detail', '/challenges/c1'),
        ('Resources', '/resources'),
        ('Search', '/search'),
        ('About', '/about'),
      ]) {
        testWidgets(name, (tester) async {
          await open(tester, at: location);
          await expectAccessible(tester);
        });
      }
    });
  }

  testWidgets('the tab labels keep their size at any text setting (a long '
      'press shows them)', (tester) async {
    tester.platformDispatcher.textScaleFactorTestValue = 3;
    addTearDown(tester.platformDispatcher.clearAllTestValues);
    await pumpDevJourney(tester);

    final label = destination('Challenges');
    final inBar = tester.element(label);
    expect(MediaQuery.textScalerOf(inBar).scale(10), 10);

    final before = find.text('Challenges').evaluate().length;
    await tester.longPress(label);
    await tester.pumpAndSettle();
    // One more: the tooltip over the bar.
    expect(find.text('Challenges'), findsNWidgets(before + 1));
  });
}
