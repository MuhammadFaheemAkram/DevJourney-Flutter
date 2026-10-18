import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_path.freezed.dart';

/// A topic with the user's state on it: catalog content joined to user
/// rows when it is read.
@freezed
abstract class TopicItem with _$TopicItem {
  const factory TopicItem({
    required Topic topic,

    /// The day it was completed; `null` while it isn't.
    CalendarDate? completedOn,
    @Default(false) bool bookmarked,
  }) = _TopicItem;

  const TopicItem._();

  bool get isCompleted => completedOn != null;
}

/// A section of a roadmap, with its topics in order.
@freezed
abstract class SectionPath with _$SectionPath {
  const factory SectionPath({
    required RoadmapSection section,
    required List<TopicItem> topics,
  }) = _SectionPath;

  const SectionPath._();

  int get completedTopics => topics.where((t) => t.isCompleted).length;

  int get totalTopics => topics.length;

  bool get isComplete => topics.isNotEmpty && completedTopics == totalTopics;
}

/// A roadmap's whole learning path: its sections, each with its topics, and
/// what the user has done. Every count is derived from the topics.
@freezed
abstract class RoadmapPath with _$RoadmapPath {
  const factory RoadmapPath({
    required Roadmap roadmap,
    required List<SectionPath> sections,
  }) = _RoadmapPath;

  const RoadmapPath._();

  int get completedTopics =>
      sections.fold(0, (sum, section) => sum + section.completedTopics);

  int get totalTopics =>
      sections.fold(0, (sum, section) => sum + section.totalTopics);

  /// 0 to 1; 0 for a path with no topics.
  double get ratio => totalTopics == 0 ? 0 : completedTopics / totalTopics;
}

/// One topic, with where it sits (its roadmap and section) and its state.
@freezed
abstract class TopicDetails with _$TopicDetails {
  const factory TopicDetails({
    required TopicItem item,
    required Roadmap roadmap,
    required RoadmapSection section,
  }) = _TopicDetails;
}

/// A topic as a choice in a picker: its title and its roadmap's.
@freezed
abstract class TopicChoice with _$TopicChoice {
  const factory TopicChoice({
    required String id,
    required String title,
    required String roadmapTitle,
  }) = _TopicChoice;
}
