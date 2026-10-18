import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/learning_path.dart';

// Domain values for pure and view tests, which never touch the database.

const sampleRoadmap = Roadmap(
  id: 'dart',
  title: 'Dart',
  description: 'The language',
  category: RoadmapCategory.mobile,
);

TopicItem topicItem(
  String id, {
  String sectionId = 'basics',
  CalendarDate? completedOn,
  bool bookmarked = false,
  Difficulty difficulty = Difficulty.beginner,
  int minutes = 30,
}) => TopicItem(
  topic: Topic(
    id: id,
    roadmapId: 'dart',
    sectionId: sectionId,
    title: 'Topic $id',
    description: 'About $id',
    objectives: const ['Learn it'],
    difficulty: difficulty,
    estimatedMinutes: minutes,
  ),
  completedOn: completedOn,
  bookmarked: bookmarked,
);

SectionPath sectionPath(String id, List<TopicItem> topics) => SectionPath(
  section: RoadmapSection(id: id, roadmapId: 'dart', title: 'Section $id'),
  topics: topics,
);

RoadmapPath roadmapPath(List<SectionPath> sections) =>
    RoadmapPath(roadmap: sampleRoadmap, sections: sections);
