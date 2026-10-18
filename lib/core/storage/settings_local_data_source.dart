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

  /// The only keys the cache loads and allows writing.
  static const allowList = {onboardedKey, activeRoadmapKey, catalogVersionKey};

  final SharedPreferencesWithCache _preferences;

  bool? get onboarded => _preferences.getBool(onboardedKey);

  String? get activeRoadmapId => _preferences.getString(activeRoadmapKey);

  int? get catalogVersion => _preferences.getInt(catalogVersionKey);

  Future<void> setOnboarded({required bool onboarded}) =>
      _preferences.setBool(onboardedKey, onboarded);

  Future<void> setActiveRoadmapId(String id) =>
      _preferences.setString(activeRoadmapKey, id);

  Future<void> setCatalogVersion(int version) =>
      _preferences.setInt(catalogVersionKey, version);
}
