/// What the device offers for theming, read once before the first frame (so
/// the first frame is already in the right colors).
final class DeviceColors {
  const DeviceColors({this.wallpaperColor});

  /// The wallpaper's main color (ARGB), on Android 12+.
  final int? wallpaperColor;

  /// Whether Settings offers "Dynamic color".
  bool get supportsDynamicColor => wallpaperColor != null;
}
