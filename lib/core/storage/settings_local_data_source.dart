import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Reads and writes the raw preference values. The keys live here and
/// nowhere else.
///
/// Preferences belong in `shared_preferences`: small, non-secret values the
/// device owns. Learning content and progress live in drift.
///
/// It is backed by `SharedPreferencesWithCache`, created once before `runApp`
/// (`@preResolve` in `AppModule`): reads are synchronous afterwards, and
/// writes update the cache at once and the disk asynchronously.
@lazySingleton
class SettingsLocalDataSource {
  const SettingsLocalDataSource(this._preferences);

  static const onboardedKey = 'settings.onboarded';
  static const activeRoadmapKey = 'settings.activeRoadmapId';
  static const catalogVersionKey = 'settings.catalogVersion';
  static const recentSearchesKey = 'search.recent';
  static const themeModeKey = 'settings.themeMode';
  static const dynamicColorKey = 'settings.dynamicColor';
  static const reminderEnabledKey = 'settings.reminderEnabled';
  static const reminderTimeKey = 'settings.reminderTime';

  /// The only keys the cache loads and allows writing.
  static const allowList = {
    onboardedKey,
    activeRoadmapKey,
    catalogVersionKey,
    recentSearchesKey,
    themeModeKey,
    dynamicColorKey,
    reminderEnabledKey,
    reminderTimeKey,
  };

  final SharedPreferencesWithCache _preferences;

  bool? get onboarded => _preferences.getBool(onboardedKey);

  String? get activeRoadmapId => _preferences.getString(activeRoadmapKey);

  int? get catalogVersion => _preferences.getInt(catalogVersionKey);

  List<String>? get recentSearches =>
      _preferences.getStringList(recentSearchesKey);

  /// The theme mode's name ("dark").
  String? get themeMode => _preferences.getString(themeModeKey);

  bool? get dynamicColor => _preferences.getBool(dynamicColorKey);

  bool? get reminderEnabled => _preferences.getBool(reminderEnabledKey);

  /// `HH:mm`.
  String? get reminderTime => _preferences.getString(reminderTimeKey);

  Future<void> setOnboarded({required bool onboarded}) =>
      _preferences.setBool(onboardedKey, onboarded);

  Future<void> setActiveRoadmapId(String id) =>
      _preferences.setString(activeRoadmapKey, id);

  Future<void> setCatalogVersion(int version) =>
      _preferences.setInt(catalogVersionKey, version);

  Future<void> setRecentSearches(List<String> searches) =>
      _preferences.setStringList(recentSearchesKey, searches);

  Future<void> setThemeMode(String name) =>
      _preferences.setString(themeModeKey, name);

  Future<void> setDynamicColor({required bool enabled}) =>
      _preferences.setBool(dynamicColorKey, enabled);

  Future<void> setReminderEnabled({required bool enabled}) =>
      _preferences.setBool(reminderEnabledKey, enabled);

  Future<void> setReminderTime(String hhmm) =>
      _preferences.setString(reminderTimeKey, hhmm);
}
