import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';

// The learning catalog: what the fake API delivers and a sync replaces. None
// of these carry user state (completed, bookmarked): that lives in its own
// tables, keyed by these ids, so a sync can never overwrite it.

/// A learning path, such as "Flutter Developer".
@freezed
abstract class Roadmap with _$Roadmap {
  const factory Roadmap({
    required String id,
    required String title,
    required String description,
    required RoadmapCategory category,
  }) = _Roadmap;
}

/// A step of a roadmap, such as "Dart" or "Architecture".
@freezed
abstract class RoadmapSection with _$RoadmapSection {
  const factory RoadmapSection({
    required String id,
    required String roadmapId,
    required String title,
  }) = _RoadmapSection;
}

/// One thing to learn, such as "Streams".
@freezed
abstract class Topic with _$Topic {
  const factory Topic({
    required String id,
    required String roadmapId,
    required String sectionId,
    required String title,
    required String description,

    /// What the learner should be able to do afterwards.
    required List<String> objectives,
    required Difficulty difficulty,
    required int estimatedMinutes,
  }) = _Topic;
}

/// An article, video, piece of documentation or course.
@freezed
abstract class Resource with _$Resource {
  const factory Resource({
    required String id,
    required String title,
    required ResourceType type,

    /// Always `https`.
    required Uri url,

    /// Where it's published, for display: "dart.dev".
    required String source,
    required int estimatedMinutes,

    /// The topic it helps with, if any.
    String? topicId,
  }) = _Resource;
}

/// A coding challenge to practise with.
@freezed
abstract class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required String title,
    required ChallengeCategory category,
    required Difficulty difficulty,
    required String prompt,

    /// Revealed one at a time.
    required List<String> hints,
  }) = _Challenge;
}
