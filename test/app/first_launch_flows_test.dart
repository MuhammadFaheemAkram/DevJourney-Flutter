import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/app_harness.dart';

// The first launch on the real app: the catalog comes from the fake API
// (zero latency here), and Welcome hands over to the Dashboard.
void main() {
  tearDown(getIt.reset);

  /// Welcome's catalog sync runs on the real event loop (§11.44).
  Future<void> letWelcomeLoad(WidgetTester tester) => tester.settleRealAsync();

  testWidgets('Welcome lists the roadmaps; Start learning opens the '
      'Dashboard with that roadmap active', (tester) async {
    await pumpDevJourney(tester, onboarded: false);
    await letWelcomeLoad(tester);

    expect(find.text('Pick a roadmap to start with'), findsOneWidget);
    await tester.tapAndSettle(find.text('System Design'));
    await tester.tap(find.text('Start learning'));
    await tester.pumpUntilFound(appBarTitled('Dashboard'));

    expect(appBarTitled('Dashboard'), findsOneWidget);
    final settings = getIt<SettingsRepository>().current;
    expect(settings.activeRoadmapId, 'system-design');
    expect(settings.catalogVersion, 1);
  });

  testWidgets('Explore with demo progress opens the Dashboard too', (
    tester,
  ) async {
    await pumpDevJourney(tester, onboarded: false);
    await letWelcomeLoad(tester);

    // Below the four roadmaps on a phone (§11.51).
    await tester.ensureVisible(find.text('Explore with demo progress'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explore with demo progress'));
    await tester.pumpUntilFound(appBarTitled('Dashboard'));

    expect(appBarTitled('Dashboard'), findsOneWidget);
    expect(getIt<SettingsRepository>().current.activeRoadmapId, 'flutter');
  });

  testWidgets('offline: an error with Try again, which recovers', (
    tester,
  ) async {
    await pumpDevJourney(
      tester,
      onboarded: false,
      beforeLaunch: () async => getIt<NetworkSimulator>().failRequests = true,
    );
    await letWelcomeLoad(tester);
    expect(find.text('Try again'), findsOneWidget);

    getIt<NetworkSimulator>().failRequests = false;
    await tester.tap(find.text('Try again'));
    await letWelcomeLoad(tester);

    expect(find.text('Pick a roadmap to start with'), findsOneWidget);
  });
}
