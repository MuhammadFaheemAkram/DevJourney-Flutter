import 'package:dev_journey/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/app_harness.dart';

void main() {
  tearDown(getIt.reset);

  group('first launch', () {
    testWidgets('opens on Welcome, without the tab bar', (tester) async {
      await pumpDevJourney(tester, onboarded: false);

      expect(find.text('Start learning'), findsOneWidget);
      expect(find.byType(NavigationBar), findsNothing);
    });

    testWidgets('a deep link waits behind Welcome', (tester) async {
      await pumpDevJourney(
        tester,
        onboarded: false,
        initialLocation: '/topics/flutter-streams',
      );

      expect(find.text('Start learning'), findsOneWidget);
    });

    for (final choice in ['Start learning', 'Explore with demo progress']) {
      testWidgets('"$choice" lands on the Dashboard, and Welcome is gone', (
        tester,
      ) async {
        await pumpDevJourney(tester, onboarded: false);

        await tester.tapAndSettle(find.text(choice));

        expect(appBarTitled('Dashboard'), findsOneWidget);
        expect(tester.selectedTab, 0);
        expect(find.text(choice), findsNothing);
      });
    }
  });

  group('tabs', () {
    testWidgets('the app opens on the Dashboard tab', (tester) async {
      await pumpDevJourney(tester);

      expect(appBarTitled('Dashboard'), findsOneWidget);
      expect(tester.selectedTab, 0);
    });

    testWidgets('each tab shows its own screen', (tester) async {
      await pumpDevJourney(tester);

      for (final (index, label) in [
        (1, 'Roadmaps'),
        (2, 'Challenges'),
        (3, 'Analytics'),
        (4, 'Settings'),
        (0, 'Dashboard'),
      ]) {
        await tester.tapAndSettle(destination(label));
        expect(tester.selectedTab, index);
        expect(appBarTitled(label), findsOneWidget);
      }
    });
  });

  group('the drawer', () {
    testWidgets('opens over the whole screen, tab bar included, from every '
        'tab', (tester) async {
      await pumpDevJourney(tester);

      for (final tab in [
        'Dashboard',
        'Roadmaps',
        'Challenges',
        'Analytics',
        'Settings',
      ]) {
        await tester.tapAndSettle(destination(tab));
        await tester.openDrawer();
        expect(find.byType(Drawer), findsOneWidget);
        // The modal barrier sits above the tab bar.
        expect(destination(tab).hitTestable(), findsNothing);
        await tester.tapAndSettle(drawerItem(tab));
        expect(find.byType(Drawer), findsNothing);
      }
    });

    testWidgets('marks the current tab, and switches tabs', (tester) async {
      await pumpDevJourney(tester);
      await tester.openDrawer();

      final selected = tester
          .widgetList<ListTile>(
            find.descendant(
              of: find.byType(Drawer),
              matching: find.byType(ListTile),
            ),
          )
          .where((tile) => tile.selected);
      expect(selected.map((tile) => (tile.title! as Text).data), ['Dashboard']);

      await tester.tapAndSettle(drawerItem('Analytics'));
      expect(appBarTitled('Analytics'), findsOneWidget);
      expect(tester.selectedTab, 3);
    });

    for (final screen in ['Notes', 'Goals', 'Resources', 'Search', 'About']) {
      testWidgets('$screen opens above the tabs, and Back returns to the '
          'tab', (tester) async {
        await pumpDevJourney(tester);
        await tester.tapAndSettle(destination('Roadmaps'));
        await tester.openDrawer();

        await tester.tapAndSettle(drawerItem(screen));
        expect(appBarTitled(screen), findsOneWidget);
        expect(find.byType(NavigationBar), findsNothing);

        await tester.tapAndSettle(find.byType(BackButton));
        expect(appBarTitled('Roadmaps'), findsOneWidget);
        expect(tester.selectedTab, 1);
      });
    }
  });

  group('search', () {
    for (final tab in ['Dashboard', 'Roadmaps']) {
      testWidgets("$tab's app bar opens Search", (tester) async {
        await pumpDevJourney(tester);
        await tester.tapAndSettle(destination(tab));

        await tester.tapAndSettle(find.byTooltip('Search'));

        expect(appBarTitled('Search'), findsOneWidget);
      });
    }
  });

  group('notes', () {
    testWidgets('"/notes/new" is the editor as a full-screen dialog, and '
        'Close returns to Notes', (tester) async {
      await pumpDevJourney(tester, initialLocation: '/notes/new');

      expect(appBarTitled('New note'), findsOneWidget);
      await tester.tapAndSettle(find.byType(CloseButton));
      expect(appBarTitled('Notes'), findsOneWidget);
    });

    testWidgets('a note link opens the editor for it', (tester) async {
      await pumpDevJourney(tester, initialLocation: '/notes/n1');

      expect(appBarTitled('Edit note'), findsOneWidget);
    });
  });

  group('deep links above the tabs', () {
    for (final (location, title, home) in [
      ('/roadmaps/flutter', 'Roadmap', 'Roadmaps'),
      ('/topics/flutter-streams', 'Topic', 'Roadmaps'),
      ('/challenges/c1', 'Challenge', 'Challenges'),
      ('/goals', 'Goals', 'Dashboard'),
    ]) {
      testWidgets('$location opens with a Close button to $home', (
        tester,
      ) async {
        await pumpDevJourney(tester, initialLocation: location);
        expect(appBarTitled(title), findsOneWidget);

        await tester.tapAndSettle(find.byTooltip('Close'));

        expect(appBarTitled(home), findsOneWidget);
      });
    }
  });

  testWidgets('an unknown location shows "Page not found", with a way back', (
    tester,
  ) async {
    await pumpDevJourney(tester, initialLocation: '/nowhere');
    expect(find.text('Page not found'), findsOneWidget);

    await tester.tapAndSettle(find.text('Go to the dashboard'));
    expect(appBarTitled('Dashboard'), findsOneWidget);
  });
}
