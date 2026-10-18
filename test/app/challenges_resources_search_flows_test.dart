import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/service/link_opener.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/app_harness.dart';
import '../helpers/fakes/recording_link_opener.dart';

// Challenges, resources and global search on the real app, with the demo
// progress as of Wednesday 14 October 2026.
void main() {
  tearDown(getIt.reset);

  List<Uri> openedLinks() =>
      (getIt<LinkOpener>() as RecordingLinkOpener).opened;

  testWidgets('a challenge to done, with solution notes: the Dashboard '
      'follows', (tester) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(destination('Challenges'));
    await tester.pumpUntilFound(find.text('An LRU cache'));

    await tester.tapAndSettle(find.text('An LRU cache'));
    expect(appBarTitled('Challenge'), findsOneWidget);
    await tester.tap(find.text('Done'));
    await tester.pumpUntilFound(find.bySemanticsLabel(RegExp('Done')));
    await tester.ensureVisible(find.byType(TextField));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'A map plus a list');
    // Leaving saves what's still waiting for the pause.
    await tester.tapAndSettle(find.byType(BackButton));
    await tester.settleRealAsync();

    await tester.tapAndSettle(destination('Dashboard'));
    await tester.pumpUntilFound(find.text('Read for 20 minutes'));
    await tester.scrollUntilVisible(
      find.text('Challenges solved'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    final solved = find.ancestor(
      of: find.text('Challenges solved'),
      matching: find.byType(Column),
    );
    expect(
      find.descendant(of: solved.first, matching: find.text('2')),
      findsOneWidget,
    );

    await tester.tapAndSettle(destination('Challenges'));
    await tester.tapAndSettle(find.text('An LRU cache'));
    await tester.pumpUntilFound(find.text('A map plus a list'));
  });

  testWidgets('resources: save one, see it under Saved, open it', (
    tester,
  ) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/resources',
    );
    await tester.pumpUntilFound(find.text('Sound null safety'));

    await tester.enterText(find.byType(TextField), 'null safety');
    await tester.pumpAndSettle();
    final card = find.ancestor(
      of: find.text('Sound null safety'),
      matching: find.byType(Card),
    );
    final save = find.descendant(of: card, matching: find.byType(IconButton));
    final wasSaved = tester.widget<IconButton>(save).isSelected ?? false;
    if (!wasSaved) {
      await tester.tap(save);
      await tester.pumpUntilFound(find.byTooltip('Remove from saved'));
    }

    await tester.enterText(find.byType(TextField), '');
    await tester.tapAndSettle(find.text('Saved only'));
    expect(find.text('Sound null safety'), findsOneWidget);

    await tester.tapAndSettle(find.text('Sound null safety'));
    expect(openedLinks(), [Uri.parse('https://dart.dev/null-safety')]);
  });

  testWidgets('global search → open a note; the query is remembered', (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.tapAndSettle(find.byTooltip('Search'));
    expect(appBarTitled('Search'), findsOneWidget);
    expect(find.text('Search everything'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'cheat');
    await tester.pumpUntilFound(find.text('Notes (1)'));
    await tester.tapAndSettle(
      find.text('Streams cheat sheet', findRichText: true),
    );
    await tester.pumpUntilFound(appBarTitled('Edit note'));

    await tester.tapAndSettle(find.byType(CloseButton));
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpUntilFound(find.text('Recent searches'));
    expect(find.text('cheat'), findsOneWidget);
  });

  testWidgets('search finds what changed: a note added a moment ago', (
    tester,
  ) async {
    await pumpDevJourney(tester, withDemoProgress: true);
    await tester.openDrawer();
    await tester.tapAndSettle(drawerItem('Notes'));
    await tester.pumpUntilFound(find.text('New note'));
    await tester.tapAndSettle(find.text('New note'));
    await tester.enterText(find.widgetWithText(TextField, 'Title'), 'Isolates');
    await tester.tap(find.text('Save'));
    await tester.pumpUntilFound(appBarTitled('Notes'));
    await tester.tapAndSettle(find.byType(BackButton));

    await tester.tapAndSettle(find.byTooltip('Search'));
    await tester.enterText(find.byType(TextField), 'isol');
    await tester.pumpUntilFound(find.text('Notes (1)'));
  });

  testWidgets('a resource from search opens in the browser', (tester) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/search',
    );
    await tester.enterText(find.byType(TextField), 'sound null');
    await tester.pumpUntilFound(find.text('Resources (1)'));

    await tester.tapAndSettle(
      find.text('Sound null safety', findRichText: true),
    );
    await tester.settleRealAsync();

    expect(openedLinks(), [Uri.parse('https://dart.dev/null-safety')]);
  });

  testWidgets('a topic lists its resources, which open', (tester) async {
    await pumpDevJourney(
      tester,
      withDemoProgress: true,
      initialLocation: '/topics/flutter-null-safety',
    );
    await tester.pumpUntilFound(find.text('Resources'));
    await tester.ensureVisible(find.text('Sound null safety'));
    await tester.pumpAndSettle();

    await tester.tapAndSettle(find.text('Sound null safety'));
    await tester.settleRealAsync();

    expect(openedLinks(), [Uri.parse('https://dart.dev/null-safety')]);
  });
}
