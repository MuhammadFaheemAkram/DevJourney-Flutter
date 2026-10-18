import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_dto.g.dart';

// The wire shape of the learning catalog, as an API would nest it: roadmaps
// contain sections, sections contain topics. The mapper flattens it into
// rows.
//
// `checked: true` turns a missing field or a wrong type into a
// `CheckedFromJsonException` that names the field, instead of a bare cast
// error. Enums are read by name; an unknown name fails the same way.

@JsonSerializable(createToJson: false, checked: true)
class CatalogDto {
  const CatalogDto({
    required this.version,
    required this.roadmaps,
    required this.resources,
    required this.challenges,
  });

  factory CatalogDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogDtoFromJson(json);

  /// Grows with every published update.
  final int version;
  final List<RoadmapDto> roadmaps;
  final List<ResourceDto> resources;
  final List<ChallengeDto> challenges;
}

@JsonSerializable(createToJson: false, checked: true)
class RoadmapDto {
  const RoadmapDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.sections,
  });

  factory RoadmapDto.fromJson(Map<String, dynamic> json) =>
      _$RoadmapDtoFromJson(json);

  final String id;
  final String title;
  final String description;
  final RoadmapCategory category;
  final List<SectionDto> sections;
}

@JsonSerializable(createToJson: false, checked: true)
class SectionDto {
  const SectionDto({
    required this.id,
    required this.title,
    required this.topics,
  });

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);

  final String id;
  final String title;
  final List<TopicDto> topics;
}

@JsonSerializable(createToJson: false, checked: true)
class TopicDto {
  const TopicDto({
    required this.id,
    required this.title,
    required this.description,
    required this.objectives,
    required this.difficulty,
    required this.estimatedMinutes,
  });

  factory TopicDto.fromJson(Map<String, dynamic> json) =>
      _$TopicDtoFromJson(json);

  final String id;
  final String title;
  final String description;
  final List<String> objectives;
  final Difficulty difficulty;
  final int estimatedMinutes;
}

@JsonSerializable(createToJson: false, checked: true)
class ResourceDto {
  const ResourceDto({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
    required this.estimatedMinutes,
    this.topicId,
  });

  factory ResourceDto.fromJson(Map<String, dynamic> json) =>
      _$ResourceDtoFromJson(json);

  final String id;
  final String title;
  final ResourceType type;
  final String url;
  final int estimatedMinutes;
  final String? topicId;
}

@JsonSerializable(createToJson: false, checked: true)
class ChallengeDto {
  const ChallengeDto({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.prompt,
    required this.hints,
  });

  factory ChallengeDto.fromJson(Map<String, dynamic> json) =>
      _$ChallengeDtoFromJson(json);

  final String id;
  final String title;
  final ChallengeCategory category;
  final Difficulty difficulty;
  final String prompt;
  final List<String> hints;
}
