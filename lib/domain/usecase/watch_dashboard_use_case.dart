import 'package:clock/clock.dart';
import 'package:dev_journey/domain/calculation/recommendation.dart';
import 'package:dev_journey/domain/calculation/streak.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

/// The Dashboard, kept live: the active roadmap's path (followed with
/// `switchMap`, so choosing another roadmap swaps the query), the active
/// days (for the streak) and the completed counts, combined with
/// `combineLatest` and handed to the pure calculations.
@injectable
class WatchDashboardUseCase {
  const WatchDashboardUseCase(
    this._settings,
    this._roadmaps,
    this._progress,
    this._clock,
  );

  final SettingsRepository _settings;
  final RoadmapRepository _roadmaps;
  final ProgressRepository _progress;
  final Clock _clock;

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
    return activePath
        .combineLatest(
          _progress.watchActiveDays(),
          (path, days) => (path: path, days: days),
        )
        .combineLatest(_progress.watchCompletedCounts(), (latest, counts) {
          final path = latest.path;
          return DashboardSummary(
            streak: learningStreak(
              latest.days,
              today: CalendarDate.fromDateTime(_clock.now()),
            ),
            activeRoadmap: path,
            nextTopic: path == null ? null : recommendedTopic(path),
            topicsCompleted: counts.topics,
            challengesCompleted: counts.challenges,
          );
        });
  }
}
