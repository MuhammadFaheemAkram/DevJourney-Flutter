import 'dart:math' as math;

import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:material_ui/material_ui.dart';

/// Days as squares, a column per week (Monday on top), shaded by how much
/// happened: completions and check-ins. Painted, as a grid of ~180 cells
/// would be ~180 widgets.
///
/// Screen readers hear [summary] instead: a grid of shades has nothing to
/// read cell by cell.
class ActivityHeatmap extends StatelessWidget {
  const ActivityHeatmap({
    super.key,
    required this.start,
    required this.today,
    required this.activity,
    required this.summary,
  });

  /// A Monday: the top of the first column.
  final CalendarDate start;
  final CalendarDate today;
  final Map<CalendarDate, int> activity;
  final String summary;

  /// The shade for a day with [count] events: 0 (none) to 4 (four or more).
  static int level(int count) => math.min(count, 4);

  static List<Color> shades(ColorScheme scheme) => [
    scheme.surfaceContainerHighest,
    for (final alpha in const [0.3, 0.5, 0.75, 1.0])
      scheme.primary.withValues(alpha: alpha),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = shades(scheme);
    final weeks = (today.yyyymmddDaysSince(start) ~/ 7) + 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          label: summary,
          excludeSemantics: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              const gap = 3.0;
              final cell = math
                  .min((constraints.maxWidth - gap * (weeks - 1)) / weeks, 18)
                  .toDouble();
              return SizedBox(
                height: cell * 7 + gap * 6,
                child: CustomPaint(
                  painter: _HeatmapPainter(
                    start: start,
                    today: today,
                    weeks: weeks,
                    activity: activity,
                    colors: colors,
                    cell: cell,
                    gap: gap,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.xSmall),
        ExcludeSemantics(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Less', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: AppSpacing.xxSmall),
              for (final color in colors)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.5),
                  child: SizedBox.square(
                    dimension: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: AppSpacing.xxSmall),
              Text('More', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

extension on CalendarDate {
  /// Whole days from [other] to this date.
  int yyyymmddDaysSince(CalendarDate other) =>
      toDateTime().difference(other.toDateTime()).inDays;
}

class _HeatmapPainter extends CustomPainter {
  _HeatmapPainter({
    required this.start,
    required this.today,
    required this.weeks,
    required this.activity,
    required this.colors,
    required this.cell,
    required this.gap,
  });

  final CalendarDate start;
  final CalendarDate today;
  final int weeks;
  final Map<CalendarDate, int> activity;
  final List<Color> colors;
  final double cell;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final radius = Radius.circular(cell / 5);
    for (var week = 0; week < weeks; week++) {
      for (var weekday = 0; weekday < 7; weekday++) {
        final day = start.addDays(week * 7 + weekday);
        if (day > today) return;
        paint.color = colors[ActivityHeatmap.level(activity[day] ?? 0)];
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              week * (cell + gap),
              weekday * (cell + gap),
              cell,
              cell,
            ),
            radius,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_HeatmapPainter old) =>
      old.activity != activity ||
      old.colors != colors ||
      old.cell != cell ||
      old.today != today;
}
