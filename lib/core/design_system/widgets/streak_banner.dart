import 'package:dev_journey/core/design_system/theme/app_colors.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:material_ui/material_ui.dart';

/// The learning streak, at the top of the Dashboard: the count with a flame,
/// and whether today already counts.
class StreakBanner extends StatelessWidget {
  const StreakBanner({super.key, required this.streak});

  final LearningStreak streak;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = context.appColors.streak;
    final current = streak.current;
    final (title, subtitle) = switch (current) {
      0 => ('Start a streak today', 'Complete a topic to begin.'),
      _ when streak.todayCounts => (
        '$current-day streak',
        'Today counts. Longest: ${streak.longest} days.',
      ),
      _ => ('$current-day streak', 'Learn something today to keep it going.'),
    };
    return Card(
      margin: const EdgeInsets.fromLTRB(
        AppSpacing.medium,
        AppSpacing.xSmall,
        AppSpacing.medium,
        AppSpacing.xSmall,
      ),
      child: MergeSemantics(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Row(
            children: [
              Icon(Icons.local_fire_department, size: 40, color: color),
              const SizedBox(width: AppSpacing.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: current == 0 ? null : color,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
