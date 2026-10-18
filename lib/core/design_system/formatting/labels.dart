import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';

// How the domain's enums read on screen. Text lives in the UI layer, never
// in the domain.

extension RoadmapCategoryLabel on RoadmapCategory {
  String get label => switch (this) {
    RoadmapCategory.mobile => 'Mobile',
    RoadmapCategory.backend => 'Backend',
    RoadmapCategory.ai => 'AI',
    RoadmapCategory.architecture => 'Architecture',
  };
}

extension DifficultyLabel on Difficulty {
  String get label => switch (this) {
    Difficulty.beginner => 'Beginner',
    Difficulty.intermediate => 'Intermediate',
    Difficulty.advanced => 'Advanced',
  };
}

extension ChallengeCategoryLabel on ChallengeCategory {
  String get label => switch (this) {
    ChallengeCategory.dart => 'Dart',
    ChallengeCategory.ui => 'UI',
    ChallengeCategory.sql => 'SQL',
    ChallengeCategory.systemDesign => 'System Design',
  };
}

extension ChallengeStatusLabel on ChallengeStatus {
  String get label => switch (this) {
    ChallengeStatus.todo => 'To do',
    ChallengeStatus.inProgress => 'In progress',
    ChallengeStatus.done => 'Done',
  };
}

extension ResourceTypeLabel on ResourceType {
  String get label => switch (this) {
    ResourceType.article => 'Article',
    ResourceType.video => 'Video',
    ResourceType.documentation => 'Documentation',
    ResourceType.course => 'Course',
  };
}

extension GoalKindLabel on GoalKind {
  String get label => switch (this) {
    GoalKind.topics => 'Complete topics',
    GoalKind.challenges => 'Complete challenges',
    GoalKind.custom => 'Custom',
  };

  /// What one unit of progress is: "topic", "challenge", "check-in".
  String get unit => switch (this) {
    GoalKind.topics => 'topic',
    GoalKind.challenges => 'challenge',
    GoalKind.custom => 'check-in',
  };
}

extension GoalPeriodLabel on GoalPeriod {
  String get label => switch (this) {
    GoalPeriod.daily => 'Daily',
    GoalPeriod.weekly => 'Weekly',
    GoalPeriod.monthly => 'Monthly',
  };

  /// "today", "this week", "this month".
  String get current => switch (this) {
    GoalPeriod.daily => 'today',
    GoalPeriod.weekly => 'this week',
    GoalPeriod.monthly => 'this month',
  };
}

/// "1 topic", "12 topics".
String countLabel(int count, String singular, [String? plural]) =>
    '$count ${count == 1 ? singular : (plural ?? '${singular}s')}';

/// "45 min", "1 h", "1 h 30 min".
String minutesLabel(int minutes) {
  if (minutes < 60) return '$minutes min';
  final hours = minutes ~/ 60;
  final rest = minutes % 60;
  return rest == 0 ? '$hours h' : '$hours h $rest min';
}

extension AppThemeModeLabel on AppThemeMode {
  String get label => switch (this) {
    AppThemeMode.system => 'System',
    AppThemeMode.light => 'Light',
    AppThemeMode.dark => 'Dark',
  };
}

/// What a catalog sync brought: "3 new topics, 3 new resources", or
/// "Everything is up to date".
String syncSummary(SyncResult result) {
  if (!result.hasNewContent) return 'Everything is up to date';
  String count(int n, String what) => '$n new $what${n == 1 ? '' : 's'}';
  return [
    if (result.newRoadmaps > 0) count(result.newRoadmaps, 'roadmap'),
    if (result.newTopics > 0) count(result.newTopics, 'topic'),
    if (result.newResources > 0) count(result.newResources, 'resource'),
    if (result.newChallenges > 0) count(result.newChallenges, 'challenge'),
  ].join(', ');
}
