import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

/// The device's preferences.
@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    /// Whether the user has left Welcome: the catalog is stored and a
    /// roadmap was chosen.
    @Default(false) bool onboarded,

    /// The roadmap the Dashboard follows.
    String? activeRoadmapId,

    /// The version of the last catalog synced (0 before the first sync).
    @Default(0) int catalogVersion,
    @Default(AppThemeMode.system) AppThemeMode themeMode,

    /// Colors from the wallpaper (Android 12+). On by default, as Material
    /// You apps are; ignored where the device has none.
    @Default(true) bool dynamicColor,

    /// Reads "on" only while notifications are allowed: the reminder use
    /// cases turn it off if permission is denied or later revoked.
    @Default(false) bool reminderEnabled,
    @Default(ReminderTime.evening) ReminderTime reminderTime,
  }) = _AppSettings;
}
