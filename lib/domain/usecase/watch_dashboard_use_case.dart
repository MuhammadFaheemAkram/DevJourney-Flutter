import 'package:clock/clock.dart';
import 'package:dev_journey/domain/calculation/recommendation.dart';
import 'package:dev_journey/domain/calculation/streak.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/domain/usecase/watch_goal_progress_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

/// The Dashboard, kept live: the active roadmap's path (followed with
/// `switchMap`, so choosing another roadmap swaps the query), the active
/// days (for the streak), the completed counts, the goals' progress, the
/// latest notes and the latest challenges, combined with `combineLatest`
/// and handed to the pure calculations.
@injectable
class WatchDashboardUseCase {
  const WatchDashboardUseCase(
    this._settings,
    this._roadmaps,
    this._progress,
    this._goalProgress,
    this._notes,
    this._challenges,
    this._clock,
  );

  final SettingsRepository _settings;
  final RoadmapRepository _roadmaps;
  final ProgressRepository _progress;
  final WatchGoalProgressUseCase _goalProgress;
  final NotesRepository _notes;
  final ChallengesRepository _challenges;
  final Clock _clock;

  static const recentNotes = 3;
  static const recentChallenges = 3;

  Stream<DashboardSummary> call() {
    final activePath = _settings
        .watch()
        .map((settings) => settings.activeRoadmapId)
        .distinct()
        .switchMap(
          (id) => id == null
              ? Stream<RoadmapPath?>.value(null)
              : _roadmaps.watchRoadmapPath(id),
        );
    final learning = activePath.combineLatest(
      _progress.watchActiveDays(),
      (path, days) => (path: path, days: days),
    );
    final totals = _progress
        .watchCompletedCounts()
        .combineLatest(
          _notes.watchNotes(),
          (counts, notes) => (counts: counts, notes: notes),
        )
        .combineLatest(
          _challenges.watchRecent(limit: recentChallenges),
          (totals, challenges) => (
            counts: totals.counts,
            notes: totals.notes,
            challenges: challenges,
          ),
        );
    return learning
        .combineLatest(totals, (learning, totals) => (learning, totals))
        .combineLatest(_goalProgress(), (latest, goals) {
          final (learning, totals) = latest;
          final path = learning.path;
          final now = _clock.now();
          return DashboardSummary(
            now: now,
            streak: learningStreak(
              learning.days,
              today: CalendarDate.fromDateTime(now),
            ),
            activeRoadmap: path,
            nextTopic: path == null ? null : recommendedTopic(path),
            topicsCompleted: totals.counts.topics,
            challengesCompleted: totals.counts.challenges,
            // Daily first, then weekly, then monthly; oldest first within
            // each (`List.sort` isn't stable, so no sort).
            goals: [
              for (final period in GoalPeriod.values)
                ...goals.where((progress) => progress.goal.period == period),
            ],
            recentNotes: totals.notes.take(recentNotes).toList(),
            recentChallenges: totals.challenges,
          );
        });
  }
}
