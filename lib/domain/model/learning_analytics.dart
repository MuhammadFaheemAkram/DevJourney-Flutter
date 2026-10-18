import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_analytics.freezed.dart';

/// A count over a stretch of days: a week or a month of a chart.
@freezed
abstract class PeriodCount with _$PeriodCount {
  const factory PeriodCount({
    required CalendarDate start,
    required CalendarDate end,
    required int count,
  }) = _PeriodCount;
}

/// How many goal periods were met, of those that count (see
/// `goalCompletionRate`).
@freezed
abstract class GoalCompletion with _$GoalCompletion {
  const factory GoalCompletion({required int met, required int total}) =
      _GoalCompletion;

  const GoalCompletion._();

  /// 0 to 1; `null` with nothing to count yet.
  double? get rate => total == 0 ? null : met / total;
}

/// Everything the Analytics tab shows, derived when it is read.
@freezed
abstract class LearningAnalytics with _$LearningAnalytics {
  const factory LearningAnalytics({
    required CalendarDate today,
    required LearningStreak streak,
    required int topicsCompleted,
    required int totalTopics,
    required int challengesCompleted,
    required GoalCompletion goals,

    /// Topics completed per ISO week, oldest first, this week last.
    required List<PeriodCount> weekly,

    /// Topics completed per calendar month, oldest first.
    required List<PeriodCount> monthly,
    required List<RoadmapProgress> roadmaps,

    /// Completions and check-ins per day, for the heatmap; days without any
    /// are absent.
    required Map<CalendarDate, int> activity,

    /// The heatmap's first day: a Monday, [heatmapWeeks] weeks back.
    required CalendarDate heatmapStart,
  }) = _LearningAnalytics;

  const LearningAnalytics._();

  static const heatmapWeeks = 26;

  /// Topics completed out of every topic in the catalog, 0 to 1.
  double get completionRate =>
      totalTopics == 0 ? 0 : topicsCompleted / totalTopics;
}
