import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:material_ui/material_ui.dart';

/// A topic's or challenge's difficulty: a small outlined label. Its color
/// follows the level, and so does its icon (one, two or three bars), so it
/// never relies on color alone. Not tappable.
class DifficultyChip extends StatelessWidget {
  const DifficultyChip({super.key, required this.difficulty});

  final Difficulty difficulty;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final color = switch (difficulty) {
      Difficulty.beginner => colors.beginner,
      Difficulty.intermediate => colors.intermediate,
      Difficulty.advanced => colors.advanced,
    };
    final icon = switch (difficulty) {
      Difficulty.beginner => Icons.signal_cellular_alt_1_bar,
      Difficulty.intermediate => Icons.signal_cellular_alt_2_bar,
      Difficulty.advanced => Icons.signal_cellular_alt,
    };
    return Semantics(
      label: 'Difficulty: ${difficulty.label}',
      excludeSemantics: true,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: color)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xSmall,
            vertical: 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: AppSpacing.xxSmall),
              Flexible(
                child: Text(
                  difficulty.label,
                  style: Theme.of(context).textTheme.labelMedium
                      ?.copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
