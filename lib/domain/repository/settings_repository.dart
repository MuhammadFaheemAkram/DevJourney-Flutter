import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';

/// The device's preferences.
abstract interface class SettingsRepository {
  /// The settings now, synchronously: they were loaded before the first
  /// frame, so the router can decide where the app opens without waiting.
  AppSettings get current;

  /// The current settings on listen, then every change.
  Stream<AppSettings> watch();

  Future<void> setOnboarded({required bool onboarded});

  Future<void> setActiveRoadmapId(String roadmapId);

  Future<void> setCatalogVersion(int version);

  Future<void> setThemeMode(AppThemeMode mode);

  Future<void> setDynamicColor({required bool enabled});

  Future<void> setReminderEnabled({required bool enabled});

  Future<void> setReminderTime(ReminderTime time);
}
