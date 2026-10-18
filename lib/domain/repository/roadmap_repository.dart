import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';

/// Roadmaps, their learning paths and their progress.
abstract interface class RoadmapRepository {
  /// Every roadmap, in the catalog's order, with its completed and total
  /// topics, kept live.
  Stream<List<RoadmapProgress>> watchRoadmaps();

  /// [roadmapId]'s sections and topics with the user's state, kept live;
  /// `null` if there's no such roadmap.
  Stream<RoadmapPath?> watchRoadmapPath(String roadmapId);

  /// One topic with its roadmap, section and state, kept live; `null` if
  /// there's no such topic.
  Stream<TopicDetails?> watchTopic(String topicId);
}
