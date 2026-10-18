import 'package:clock/clock.dart';
import 'package:dev_journey/domain/calculation/analytics.dart';
import 'package:dev_journey/domain/calculation/goals.dart';
import 'package:dev_journey/domain/calculation/streak.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

/// The Analytics tab, kept live: every dated event (the one `UNION ALL`
/// query goals already use), the goals, and each roadmap's progress,
/// combined and handed to the pure series functions.
@injectable
class WatchAnalyticsUseCase {
  const WatchAnalyticsUseCase(this._goals, this._roadmaps, this._clock);

  final GoalsRepository _goals;
  final RoadmapRepository _roadmaps;
  final Clock _clock;

  Stream<LearningAnalytics> call() => _goals
      .watchActivity()
      .combineLatest(
        _goals.watchGoals(),
        (activity, goals) => (activity: activity, goals: goals),
      )
      .combineLatest(_roadmaps.watchRoadmaps(), (latest, roadmaps) {
        final today = CalendarDate.fromDateTime(_clock.now());
        final activity = latest.activity;
        final events = allEvents(activity);
        final start = heatmapStart(
          today,
          weeks: LearningAnalytics.heatmapWeeks,
        );
        return LearningAnalytics(
          today: today,
          streak: learningStreak(events, today: today),
          topicsCompleted: activity.topicCompletions.length,
          totalTopics: roadmaps.fold(0, (sum, r) => sum + r.totalTopics),
          challengesCompleted: activity.challengeCompletions.length,
          goals: goalCompletionRate(latest.goals, activity, today: today),
          weekly: weeklyCompletions(activity.topicCompletions, today: today),
          monthly: monthlyCompletions(activity.topicCompletions, today: today),
          roadmaps: roadmaps,
          activity: activityByDay(events, from: start, to: today),
          heatmapStart: start,
        );
      });
}
