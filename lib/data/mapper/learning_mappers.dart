import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/learning_dao.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_path.dart';

extension SectionRowMapping on SectionRow {
  RoadmapSection toDomain() =>
      RoadmapSection(id: id, roadmapId: roadmapId, title: title);
}

extension TopicRowMapping on TopicRow {
  Topic toDomain() => Topic(
    id: id,
    roadmapId: roadmapId,
    sectionId: sectionId,
    title: title,
    description: description,
    objectives: objectives,
    difficulty: difficulty,
    estimatedMinutes: estimatedMinutes,
  );

  TopicItem toItem({TopicProgressRow? progress, required bool bookmarked}) =>
      TopicItem(
        topic: toDomain(),
        completedOn: progress?.completedOn,
        bookmarked: bookmarked,
      );
}

/// Folds the flat, ordered rows of [LearningDao.watchPath] back into a tree:
/// sections in order, each with its topics in order. `null` when there are
/// no rows (no such roadmap).
RoadmapPath? pathFromRows(List<PathRow> rows) {
  if (rows.isEmpty) return null;
  final sections = <String, (RoadmapSection, List<TopicItem>)>{};
  for (final row in rows) {
    final section = row.section;
    if (section == null) continue;
    final (_, topics) = sections.putIfAbsent(
      section.id,
      () => (section.toDomain(), <TopicItem>[]),
    );
    final topic = row.topic;
    if (topic != null) {
      topics.add(
        topic.toItem(progress: row.progress, bookmarked: row.bookmarked),
      );
    }
  }
  return RoadmapPath(
    roadmap: rows.first.roadmap.toDomain(),
    sections: [
      for (final (section, topics) in sections.values)
        SectionPath(section: section, topics: topics),
    ],
  );
}

extension TopicDetailsRowMapping on TopicDetailsRow {
  TopicDetails toDomain() => TopicDetails(
    item: topic.toItem(progress: progress, bookmarked: bookmarked),
    roadmap: roadmap.toDomain(),
    section: section.toDomain(),
  );
}
