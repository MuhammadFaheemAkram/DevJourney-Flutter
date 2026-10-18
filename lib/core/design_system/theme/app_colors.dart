import 'package:material_ui/material_ui.dart';

/// Learning colors that Material's [ColorScheme] has no slot for.
///
/// A [ThemeExtension] travels inside [ThemeData], so the light and dark
/// variants switch automatically (and animate via [lerp]) when the theme
/// changes. Widgets ask for an *intent* (`success`, `streak`, a difficulty)
/// instead of hard-coding raw colors.
///
/// All are text and icon colors: they sit on the page and on cards, so each
/// must reach WCAG AA (4.5:1) against those surfaces in both themes (checked
/// by a test). Color is never the only signal: a completed topic also has a
/// check, a difficulty also has its name.
@immutable
final class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.success,
    required this.streak,
    required this.beginner,
    required this.intermediate,
    required this.advanced,
  });

  /// Something completed: a topic, a section, a goal met.
  final Color success;

  /// The learning streak's flame and count.
  final Color streak;

  /// Difficulty levels, from gentle to demanding.
  final Color beginner;
  final Color intermediate;
  final Color advanced;

  static const light = AppColors(
    success: Color(0xFF146C2E),
    streak: Color(0xFFA8440B),
    beginner: Color(0xFF00695F),
    intermediate: Color(0xFF7F5000),
    advanced: Color(0xFFB3261E),
  );

  static const dark = AppColors(
    success: Color(0xFF86D993),
    streak: Color(0xFFFFB68C),
    beginner: Color(0xFF6FD9C8),
    intermediate: Color(0xFFF6BE63),
    advanced: Color(0xFFFF9C92),
  );

  @override
  AppColors copyWith({
    Color? success,
    Color? streak,
    Color? beginner,
    Color? intermediate,
    Color? advanced,
  }) {
    return AppColors(
      success: success ?? this.success,
      streak: streak ?? this.streak,
      beginner: beginner ?? this.beginner,
      intermediate: intermediate ?? this.intermediate,
      advanced: advanced ?? this.advanced,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      streak: Color.lerp(streak, other.streak, t)!,
      beginner: Color.lerp(beginner, other.beginner, t)!,
      intermediate: Color.lerp(intermediate, other.intermediate, t)!,
      advanced: Color.lerp(advanced, other.advanced, t)!,
    );
  }
}

/// Shorthand for `Theme.of(context).extension<AppColors>()!`.
extension AppColorsContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
