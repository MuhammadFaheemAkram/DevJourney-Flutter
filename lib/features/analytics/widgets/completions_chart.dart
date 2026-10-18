import 'dart:math' as math;

import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:material_ui/material_ui.dart';

/// Topics completed per period, as bars, with [labelOf] under each.
///
/// Screen readers hear [summary] instead of the bars: a chart has no text
/// to read, so its meaning is written out.
class CompletionsChart extends StatelessWidget {
  const CompletionsChart({
    super.key,
    required this.periods,
    required this.labelOf,
    required this.summary,
  });

  final List<PeriodCount> periods;
  final String Function(PeriodCount period) labelOf;
  final String summary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final most = periods.fold(0, (most, p) => math.max(most, p.count));
    return Semantics(
      label: summary,
      excludeSemantics: true,
      child: SizedBox(
        height: 160,
        child: BarChart(
          BarChartData(
            maxY: most == 0 ? 1 : most * 1.15,
            alignment: BarChartAlignment.spaceAround,
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: const BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              // The count over each bar: the figure, not just a height.
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: ChartAxisLabel.reservedSize(context),
                  getTitlesWidget: (value, meta) => SideTitleWidget(
                    meta: meta,
                    child: ChartAxisLabel('${periods[value.toInt()].count}'),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: ChartAxisLabel.reservedSize(context),
                  getTitlesWidget: (value, meta) => SideTitleWidget(
                    meta: meta,
                    child: ChartAxisLabel(labelOf(periods[value.toInt()])),
                  ),
                ),
              ),
            ),
            barGroups: [
              for (final (index, period) in periods.indexed)
                BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: period.count.toDouble(),
                      color: scheme.primary,
                      width: 16,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
