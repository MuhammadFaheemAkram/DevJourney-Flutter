import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_summary.freezed.dart';

/// Everything the Dashboard shows, derived when it is read. Phase 4 adds
/// today's goals and recent notes, Phase 5 recent challenges.
@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required LearningStreak streak,

    /// The active roadmap's path; `null` if none is set (or it's gone).
    RoadmapPath? activeRoadmap,

    /// What to learn next in the active roadmap; `null` when it's done.
    TopicItem? nextTopic,
    required int topicsCompleted,
    required int challengesCompleted,
  }) = _DashboardSummary;
}
