// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'demo_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoProgressDto _$DemoProgressDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DemoProgressDto', json, ($checkedConvert) {
      final val = DemoProgressDto(
        completedTopics: $checkedConvert(
          'completedTopics',
          (v) => (v as List<dynamic>)
              .map((e) => DemoCompletionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        bookmarkedTopics: $checkedConvert(
          'bookmarkedTopics',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        bookmarkedResources: $checkedConvert(
          'bookmarkedResources',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        notes: $checkedConvert(
          'notes',
          (v) => (v as List<dynamic>)
              .map((e) => DemoNoteDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        goals: $checkedConvert(
          'goals',
          (v) => (v as List<dynamic>)
              .map((e) => DemoGoalDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        challenges: $checkedConvert(
          'challenges',
          (v) => (v as List<dynamic>)
              .map((e) => DemoChallengeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

DemoCompletionDto _$DemoCompletionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DemoCompletionDto', json, ($checkedConvert) {
      final val = DemoCompletionDto(
        topicId: $checkedConvert('topicId', (v) => v as String),
        daysAgo: $checkedConvert('daysAgo', (v) => (v as num).toInt()),
      );
      return val;
    });

DemoNoteDto _$DemoNoteDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DemoNoteDto', json, ($checkedConvert) {
      final val = DemoNoteDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        content: $checkedConvert('content', (v) => v as String),
        daysAgo: $checkedConvert('daysAgo', (v) => (v as num).toInt()),
        topicId: $checkedConvert('topicId', (v) => v as String?),
      );
      return val;
    });

DemoGoalDto _$DemoGoalDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DemoGoalDto', json, ($checkedConvert) {
      final val = DemoGoalDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        kind: $checkedConvert('kind', (v) => $enumDecode(_$GoalKindEnumMap, v)),
        period: $checkedConvert(
          'period',
          (v) => $enumDecode(_$GoalPeriodEnumMap, v),
        ),
        target: $checkedConvert('target', (v) => (v as num).toInt()),
        daysAgo: $checkedConvert('daysAgo', (v) => (v as num).toInt()),
        checkIns: $checkedConvert(
          'checkIns',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              const [],
        ),
      );
      return val;
    });

const _$GoalKindEnumMap = {
  GoalKind.topics: 'topics',
  GoalKind.challenges: 'challenges',
  GoalKind.custom: 'custom',
};

const _$GoalPeriodEnumMap = {
  GoalPeriod.daily: 'daily',
  GoalPeriod.weekly: 'weekly',
  GoalPeriod.monthly: 'monthly',
};

DemoChallengeDto _$DemoChallengeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DemoChallengeDto', json, ($checkedConvert) {
      final val = DemoChallengeDto(
        challengeId: $checkedConvert('challengeId', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$ChallengeStatusEnumMap, v),
        ),
        daysAgo: $checkedConvert('daysAgo', (v) => (v as num).toInt()),
        solutionNotes: $checkedConvert(
          'solutionNotes',
          (v) => v as String? ?? '',
        ),
      );
      return val;
    });

const _$ChallengeStatusEnumMap = {
  ChallengeStatus.todo: 'todo',
  ChallengeStatus.inProgress: 'inProgress',
  ChallengeStatus.done: 'done',
};
