import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_summary.freezed.dart';

/// Everything the Dashboard shows, derived when it is read. Phase 5 adds
/// recent challenges.
@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    /// When it was derived: "today" for the goals, "5 min ago" for notes.
    required DateTime now,
    required LearningStreak streak,

    /// The active roadmap's path; `null` if none is set (or it's gone).
    RoadmapPath? activeRoadmap,

    /// What to learn next in the active roadmap; `null` when it's done.
    TopicItem? nextTopic,
    required int topicsCompleted,
    required int challengesCompleted,

    /// The goals with their current progress: daily first, then weekly,
    /// then monthly.
    @Default(<GoalProgress>[]) List<GoalProgress> goals,

    /// The latest edited notes (three at most).
    @Default(<NoteItem>[]) List<NoteItem> recentNotes,
  }) = _DashboardSummary;

  const DashboardSummary._();

  CalendarDate get today => CalendarDate.fromDateTime(now);
}
