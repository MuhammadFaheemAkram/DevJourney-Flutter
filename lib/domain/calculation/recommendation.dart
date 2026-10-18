import 'package:dev_journey/domain/model/learning_path.dart';

/// What to learn next in [path]: the first topic not yet completed, in
/// section order, then topic order. `null` once everything is done.
///
/// The path is the roadmap's suggested order, so "next" is simply the
/// earliest gap: a topic skipped earlier comes back before a later one.
TopicItem? recommendedTopic(RoadmapPath path) {
  for (final section in path.sections) {
    for (final topic in section.topics) {
      if (!topic.isCompleted) return topic;
    }
  }
  return null;
}
