/// Switches for trying the app's failure and update paths
/// (Settings → Developer). Both live in memory: off at every launch.
abstract interface class DeveloperTools {
  /// The fake learning API fails every request, as if offline.
  bool get simulatesNetworkFailure;
  set simulatesNetworkFailure(bool value);

  /// The fake learning API serves the next catalog version, so a sync has
  /// something new to bring in.
  bool get publishesCatalogUpdate;
  set publishesCatalogUpdate(bool value);
}
