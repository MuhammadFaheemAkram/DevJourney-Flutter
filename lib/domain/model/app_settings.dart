import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

/// The device's preferences. Phase 6 adds the appearance, dynamic color and
/// the daily reminder.
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
  }) = _AppSettings;
}
