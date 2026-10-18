import 'dart:async';

import 'package:dev_journey/core/storage/settings_local_data_source.dart';
import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// The default [SettingsRepository].
///
/// It keeps the current [AppSettings] in memory, publishes every change to
/// its watchers at once, and persists through [SettingsLocalDataSource].
/// Missing or invalid values fall back to the defaults.
@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._local) : _current = _read(_local);

  final SettingsLocalDataSource _local;
  final _changes = StreamController<AppSettings>.broadcast(sync: true);
  AppSettings _current;

  @override
  AppSettings get current => _current;

  @override
  Stream<AppSettings> watch() {
    // The current value on listen, then every change. Subscribing to the
    // changes in the same step leaves no gap for an update to slip through.
    return Stream.multi((watcher) {
      final subscription = _changes.stream.listen(watcher.add);
      watcher
        ..onCancel = subscription.cancel
        ..add(_current);
    });
  }

  @override
  Future<void> setOnboarded({required bool onboarded}) {
    _publish(_current.copyWith(onboarded: onboarded));
    return _local.setOnboarded(onboarded: onboarded);
  }

  @override
  Future<void> setActiveRoadmapId(String roadmapId) {
    _publish(_current.copyWith(activeRoadmapId: roadmapId));
    return _local.setActiveRoadmapId(roadmapId);
  }

  @override
  Future<void> setCatalogVersion(int version) {
    RangeError.checkNotNegative(version, 'version');
    _publish(_current.copyWith(catalogVersion: version));
    return _local.setCatalogVersion(version);
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) {
    _publish(_current.copyWith(themeMode: mode));
    return _local.setThemeMode(mode.name);
  }

  @override
  Future<void> setDynamicColor({required bool enabled}) {
    _publish(_current.copyWith(dynamicColor: enabled));
    return _local.setDynamicColor(enabled: enabled);
  }

  @override
  Future<void> setReminderEnabled({required bool enabled}) {
    _publish(_current.copyWith(reminderEnabled: enabled));
    return _local.setReminderEnabled(enabled: enabled);
  }

  @override
  Future<void> setReminderTime(ReminderTime time) {
    _publish(_current.copyWith(reminderTime: time));
    return _local.setReminderTime(time.toStorage());
  }

  /// Closes the change stream (for tests: the app keeps one repository for
  /// its whole lifetime).
  Future<void> dispose() => _changes.close();

  void _publish(AppSettings settings) {
    if (settings == _current) return;
    _current = settings;
    _changes.add(settings);
  }

  static AppSettings _read(SettingsLocalDataSource local) {
    const defaults = AppSettings();
    final version = local.catalogVersion;
    return AppSettings(
      onboarded: local.onboarded ?? defaults.onboarded,
      activeRoadmapId: local.activeRoadmapId,
      catalogVersion: version != null && version >= 0
          ? version
          : defaults.catalogVersion,
      themeMode:
          AppThemeMode.values.asNameMap()[local.themeMode] ??
          defaults.themeMode,
      dynamicColor: local.dynamicColor ?? defaults.dynamicColor,
      reminderEnabled: local.reminderEnabled ?? defaults.reminderEnabled,
      reminderTime:
          ReminderTime.tryParse(local.reminderTime ?? '') ??
          defaults.reminderTime,
    );
  }
}
