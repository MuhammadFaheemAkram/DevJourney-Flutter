// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogDto _$CatalogDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CatalogDto', json, ($checkedConvert) {
      final val = CatalogDto(
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        roadmaps: $checkedConvert(
          'roadmaps',
          (v) => (v as List<dynamic>)
              .map((e) => RoadmapDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        resources: $checkedConvert(
          'resources',
          (v) => (v as List<dynamic>)
              .map((e) => ResourceDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        challenges: $checkedConvert(
          'challenges',
          (v) => (v as List<dynamic>)
              .map((e) => ChallengeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

RoadmapDto _$RoadmapDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoadmapDto', json, ($checkedConvert) {
      final val = RoadmapDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        category: $checkedConvert(
          'category',
          (v) => $enumDecode(_$RoadmapCategoryEnumMap, v),
        ),
        sections: $checkedConvert(
          'sections',
          (v) => (v as List<dynamic>)
              .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

const _$RoadmapCategoryEnumMap = {
  RoadmapCategory.mobile: 'mobile',
  RoadmapCategory.backend: 'backend',
  RoadmapCategory.ai: 'ai',
  RoadmapCategory.architecture: 'architecture',
};

SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SectionDto', json, ($checkedConvert) {
      final val = SectionDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        topics: $checkedConvert(
          'topics',
          (v) => (v as List<dynamic>)
              .map((e) => TopicDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

TopicDto _$TopicDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TopicDto', json, ($checkedConvert) {
      final val = TopicDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        objectives: $checkedConvert(
          'objectives',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        difficulty: $checkedConvert(
          'difficulty',
          (v) => $enumDecode(_$DifficultyEnumMap, v),
        ),
        estimatedMinutes: $checkedConvert(
          'estimatedMinutes',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.intermediate: 'intermediate',
  Difficulty.advanced: 'advanced',
};

ResourceDto _$ResourceDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ResourceDto', json, ($checkedConvert) {
      final val = ResourceDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$ResourceTypeEnumMap, v),
        ),
        url: $checkedConvert('url', (v) => v as String),
        estimatedMinutes: $checkedConvert(
          'estimatedMinutes',
          (v) => (v as num).toInt(),
        ),
        topicId: $checkedConvert('topicId', (v) => v as String?),
      );
      return val;
    });

const _$ResourceTypeEnumMap = {
  ResourceType.article: 'article',
  ResourceType.video: 'video',
  ResourceType.documentation: 'documentation',
  ResourceType.course: 'course',
};

ChallengeDto _$ChallengeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChallengeDto', json, ($checkedConvert) {
      final val = ChallengeDto(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        category: $checkedConvert(
          'category',
          (v) => $enumDecode(_$ChallengeCategoryEnumMap, v),
        ),
        difficulty: $checkedConvert(
          'difficulty',
          (v) => $enumDecode(_$DifficultyEnumMap, v),
        ),
        prompt: $checkedConvert('prompt', (v) => v as String),
        hints: $checkedConvert(
          'hints',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    });

const _$ChallengeCategoryEnumMap = {
  ChallengeCategory.dart: 'dart',
  ChallengeCategory.ui: 'ui',
  ChallengeCategory.sql: 'sql',
  ChallengeCategory.systemDesign: 'systemDesign',
};
