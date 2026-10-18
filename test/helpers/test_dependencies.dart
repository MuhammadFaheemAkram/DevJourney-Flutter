import 'package:clock/clock.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import 'database.dart';

/// Builds the app's real composition root for app-level tests, with these
/// swaps:
/// - preferences live in an in-memory store, pre-filled with [preferences]
///   (raw keys, as `SettingsLocalDataSource` names them);
/// - the database lives in memory (and is closed by `getIt.reset()`);
/// - the simulated network has no latency;
/// - the clock is fixed at [demoNow], so every demo date is known.
///
/// Everything else is the real code, so these tests also prove the DI graph
/// resolves. Call `getIt.reset()` in `tearDown`.
Future<void> configureTestDependencies({
  Map<String, Object> preferences = const {},
}) async {
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.withData(Map.of(preferences));
  await configureDependencies();
  getIt
    ..unregister<AppDatabase>()
    ..registerLazySingleton<AppDatabase>(
      newTestDatabase,
      dispose: (database) => database.close(),
    )
    ..unregister<NetworkSimulator>()
    ..registerLazySingleton<NetworkSimulator>(
      () => NetworkSimulator(latency: Duration.zero),
    )
    ..unregister<Clock>()
    ..registerLazySingleton<Clock>(() => Clock.fixed(demoNow));
}

/// "Now" in every test: Wednesday 14 October 2026, 15:00 local time.
final demoNow = DateTime(2026, 10, 14, 15);

/// The saved preferences of an app that is past Welcome, following the
/// Flutter roadmap.
const onboardedPreferences = {
  'settings.onboarded': true,
  'settings.activeRoadmapId': 'flutter',
};
