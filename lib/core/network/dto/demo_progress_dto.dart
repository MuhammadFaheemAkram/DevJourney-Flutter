import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'demo_progress_dto.g.dart';

// Sample progress for "Explore with demo progress". Every date is
// *relative* (`daysAgo`), resolved against today when it loads, so the demo
// always shows a live streak and recent activity.

@JsonSerializable(createToJson: false, checked: true)
class DemoProgressDto {
  const DemoProgressDto({
    required this.completedTopics,
    required this.bookmarkedTopics,
    required this.bookmarkedResources,
    required this.notes,
    required this.goals,
    required this.challenges,
  });

  factory DemoProgressDto.fromJson(Map<String, dynamic> json) =>
      _$DemoProgressDtoFromJson(json);

  final List<DemoCompletionDto> completedTopics;
  final List<String> bookmarkedTopics;
  final List<String> bookmarkedResources;
  final List<DemoNoteDto> notes;
  final List<DemoGoalDto> goals;
  final List<DemoChallengeDto> challenges;
}

@JsonSerializable(createToJson: false, checked: true)
class DemoCompletionDto {
  const DemoCompletionDto({required this.topicId, required this.daysAgo});

  factory DemoCompletionDto.fromJson(Map<String, dynamic> json) =>
      _$DemoCompletionDtoFromJson(json);

  final String topicId;
  final int daysAgo;
}

@JsonSerializable(createToJson: false, checked: true)
class DemoNoteDto {
  const DemoNoteDto({
    required this.id,
    required this.title,
    required this.content,
    required this.daysAgo,
    this.topicId,
  });

  factory DemoNoteDto.fromJson(Map<String, dynamic> json) =>
      _$DemoNoteDtoFromJson(json);

  final String id;
  final String title;

  /// Markdown.
  final String content;
  final int daysAgo;
  final String? topicId;
}

@JsonSerializable(createToJson: false, checked: true)
class DemoGoalDto {
  const DemoGoalDto({
    required this.id,
    required this.title,
    required this.kind,
    required this.period,
    required this.target,
    required this.daysAgo,
    this.checkIns = const [],
  });

  factory DemoGoalDto.fromJson(Map<String, dynamic> json) =>
      _$DemoGoalDtoFromJson(json);

  final String id;
  final String title;
  final GoalKind kind;
  final GoalPeriod period;
  final int target;

  /// When the goal was set.
  final int daysAgo;

  /// Custom goals only: one entry per check-in, as days ago.
  final List<int> checkIns;
}

@JsonSerializable(createToJson: false, checked: true)
class DemoChallengeDto {
  const DemoChallengeDto({
    required this.challengeId,
    required this.status,
    required this.daysAgo,
    this.solutionNotes = '',
  });

  factory DemoChallengeDto.fromJson(Map<String, dynamic> json) =>
      _$DemoChallengeDtoFromJson(json);

  final String challengeId;
  final ChallengeStatus status;

  /// When it was started (in progress) or finished (done).
  final int daysAgo;
  final String solutionNotes;
}
