/// The app's name and version, as About shows them.
final class AppInfo {
  const AppInfo({
    required this.name,
    required this.version,
    required this.buildNumber,
  });

  final String name;
  final String version;
  final String buildNumber;

  /// "1.0.0 (1)".
  String get versionLabel =>
      buildNumber.isEmpty ? version : '$version ($buildNumber)';
}
