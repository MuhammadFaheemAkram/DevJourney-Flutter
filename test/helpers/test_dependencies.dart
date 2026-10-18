import 'package:clock/clock.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/service/link_opener.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import 'database.dart';
import 'fakes/fake_reminder_scheduler.dart';
import 'fakes/recording_link_opener.dart';

/// Builds the app's real composition root for app-level tests, with these
/// swaps:
/// - preferences live in an in-memory store, pre-filled with [preferences]
///   (raw keys, as `SettingsLocalDataSource` names them);
/// - the database lives in memory (and is closed by `getIt.reset()`);
/// - the simulated network has no latency;
/// - the clock is fixed at [demoNow], so every demo date is known;
/// - links are recorded by a [RecordingLinkOpener] instead of opening a
///   browser (`getIt<LinkOpener>() as RecordingLinkOpener`);
/// - notifications go to a [FakeReminderScheduler] (permission granted when
///   asked), and the app's version is 1.0.0 (1).
///
/// Everything else is the real code, so these tests also prove the DI graph
/// resolves. Call `getIt.reset()` in `tearDown`.
Future<void> configureTestDependencies({
  Map<String, Object> preferences = const {},
}) async {
  SharedPreferencesAsyncPlatform.instance =
      InMemorySharedPreferencesAsync.withData(Map.of(preferences));
  // No wallpaper palette, answered at once: an unanswered platform call
  // before the first pump would wait on fake time forever (§11.44).
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(DynamicColorPlugin.channel, (_) async => null);
  PackageInfo.setMockInitialValues(
    appName: 'DevJourney',
    packageName: 'co.bitfuse.flutter.dev_journey',
    version: '1.0.0',
    buildNumber: '1',
    buildSignature: '',
  );
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
    ..registerLazySingleton<Clock>(() => Clock.fixed(demoNow))
    ..unregister<LinkOpener>()
    ..registerLazySingleton<LinkOpener>(RecordingLinkOpener.new)
    ..unregister<ReminderScheduler>()
    ..registerLazySingleton<ReminderScheduler>(FakeReminderScheduler.new);
}

/// "Now" in every test: Wednesday 14 October 2026, 15:00 local time.
final demoNow = DateTime(2026, 10, 14, 15);

/// The saved preferences of an app that is past Welcome, following the
/// Flutter roadmap.
const onboardedPreferences = {
  'settings.onboarded': true,
  'settings.activeRoadmapId': 'flutter',
};
