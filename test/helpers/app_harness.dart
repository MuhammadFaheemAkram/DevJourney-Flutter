import 'package:dev_journey/app/dev_journey_app.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/repository/catalog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'pump_app.dart';
import 'test_dependencies.dart';

/// Starts the whole app on the real DI graph (see
/// [configureTestDependencies]): already past Welcome ([onboarded]) or on a
/// first launch, optionally on a deep link, optionally with the catalog
/// synced ([withCatalog]) and the demo progress loaded ([withDemoProgress]),
/// as of [demoNow]. [beforeLaunch] runs once the graph exists and before the
/// first frame. Pair it with `tearDown(getIt.reset)`.
Future<void> pumpDevJourney(
  WidgetTester tester, {
  bool onboarded = true,
  bool withCatalog = false,
  bool withDemoProgress = false,
  String? initialLocation,
  Future<void> Function()? beforeLaunch,
}) async {
  await configureTestDependencies(
    preferences: onboarded ? onboardedPreferences : const {},
  );
  if (withCatalog || withDemoProgress) {
    // On the real event loop: before the first pump nothing advances the
    // widget test's fake time, so even the simulated network's zero-length
    // delay (a timer) would never fire, and the test would hang (§11.44).
    await tester.runAsync(() async {
      final catalog = getIt<CatalogRepository>();
      await catalog.sync();
      if (withDemoProgress) await catalog.loadDemoProgress();
    });
  }
  await beforeLaunch?.call();
  tester.usePhoneSurface();
  await tester.pumpWidget(DevJourneyApp(initialLocation: initialLocation));
  await tester.pumpAndSettle();
}

/// The bottom bar's destination labelled [label] (a tab).
Finder destination(String label) =>
    find.descendant(of: find.byType(NavigationBar), matching: find.text(label));

/// The drawer's item labelled [label].
Finder drawerItem(String label) =>
    find.descendant(of: find.byType(Drawer), matching: find.text(label));

/// The app bar showing [title]: which screen is on top.
Finder appBarTitled(String title) => find.widgetWithText(AppBar, title);

extension AppHarness on WidgetTester {
  /// The index of the selected tab.
  int get selectedTab =>
      widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex;

  Future<void> tapAndSettle(Finder finder) async {
    await tap(finder);
    await pumpAndSettle();
  }

  /// Opens the navigation drawer from the current tab's menu button.
  Future<void> openDrawer() =>
      tapAndSettle(find.byTooltip('Open navigation menu'));

  /// Settles real-loop work in slices until [finder] finds something (a
  /// flow that alternates fake-time delays and database work needs several),
  /// failing after [attempts] slices instead of hanging.
  Future<void> pumpUntilFound(Finder finder, {int attempts = 20}) async {
    for (var i = 0; i < attempts; i++) {
      if (finder.evaluate().isNotEmpty) return;
      await settleRealAsync();
    }
    expect(finder, findsWidgets, reason: 'never appeared');
  }

  /// Lets work that runs on the real event loop finish (a database write
  /// started by a tap), then settles.
  Future<void> settleRealAsync() async {
    await runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await pumpAndSettle();
  }
}
