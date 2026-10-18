import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:material_ui/material_ui.dart';

/// One figure: a big value, what it is, and an optional detail. Read as one
/// phrase ("Current streak, 6 days").
class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key,
    required this.label,
    required this.value,
    this.detail,
    this.icon,
  });

  final String label;
  final String value;
  final String? detail;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detail = this.detail;
    final icon = this.icon;
    return Card(
      margin: EdgeInsets.zero,
      child: MergeSemantics(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    ExcludeSemantics(
                      child: Icon(
                        icon,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xxSmall),
                  ],
                  Expanded(
                    child: Text(
                      label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xxSmall),
              Text(value, style: theme.textTheme.headlineSmall),
              if (detail != null)
                Text(
                  detail,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
