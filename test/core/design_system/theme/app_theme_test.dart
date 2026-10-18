import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('AppTheme', () {
    test('builds Material 3 light and dark themes from the seed', () {
      final light = AppTheme.light();
      final dark = AppTheme.dark();

      expect(light.useMaterial3, isTrue);
      expect(light.colorScheme.brightness, Brightness.light);
      expect(dark.colorScheme.brightness, Brightness.dark);
    });

    test('registers the matching AppColors extension for each brightness', () {
      expect(AppTheme.light().extension<AppColors>(), same(AppColors.light));
      expect(AppTheme.dark().extension<AppColors>(), same(AppColors.dark));
    });

    test('any scheme can drive it (dynamic color will)', () {
      final scheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF00897B),
        brightness: Brightness.dark,
      );

      final theme = AppTheme.fromScheme(scheme);

      expect(theme.colorScheme, scheme);
      expect(theme.extension<AppColors>(), same(AppColors.dark));
    });
  });

  group('AppColors', () {
    test('lerp interpolates every token', () {
      final mid = AppColors.light.lerp(AppColors.dark, 0.5);

      Color? halfway(Color Function(AppColors) token) =>
          Color.lerp(token(AppColors.light), token(AppColors.dark), 0.5);
      expect(mid.success, halfway((c) => c.success));
      expect(mid.streak, halfway((c) => c.streak));
      expect(mid.beginner, halfway((c) => c.beginner));
      expect(mid.intermediate, halfway((c) => c.intermediate));
      expect(mid.advanced, halfway((c) => c.advanced));
    });

    test('lerp towards a missing extension keeps the current colors', () {
      expect(AppColors.light.lerp(null, 0.5), same(AppColors.light));
    });

    test('copyWith replaces only the given tokens', () {
      const purple = Color(0xFF7B1FA2);
      final copy = AppColors.light.copyWith(streak: purple);

      expect(copy.streak, purple);
      expect(copy.success, AppColors.light.success);
      expect(copy.advanced, AppColors.light.advanced);
    });
  });

  // WCAG contrast checks, so a color tweak can't silently make a label
  // unreadable. The learning colors are text and icon colors on the page,
  // on cards and on filled fields, so each must reach AA (4.5:1) on all of
  // them.
  group('Contrast in both themes', () {
    double contrast(Color a, Color b) {
      final (hi, lo) = (a.computeLuminance(), b.computeLuminance());
      return hi > lo ? (hi + 0.05) / (lo + 0.05) : (lo + 0.05) / (hi + 0.05);
    }

    for (final theme in [AppTheme.light(), AppTheme.dark()]) {
      final name = theme.colorScheme.brightness.name;
      final colors = theme.extension<AppColors>()!;
      final scheme = theme.colorScheme;
      final surfaces = {
        'the page': scheme.surface,
        'a card': scheme.surfaceContainerLow,
        'a filled field': scheme.surfaceContainerHighest,
      };

      for (final (token, color) in [
        ('success', colors.success),
        ('streak', colors.streak),
        ('beginner', colors.beginner),
        ('intermediate', colors.intermediate),
        ('advanced', colors.advanced),
      ]) {
        for (final MapEntry(key: surface, value: background)
            in surfaces.entries) {
          test('$name: $token text on $surface meets AA (4.5:1)', () {
            expect(contrast(color, background), greaterThanOrEqualTo(4.5));
          });
        }
      }
    }
  });
}
