import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/learning_dao.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/data/mapper/learning_mappers.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RoadmapRepository)
class RoadmapRepositoryImpl implements RoadmapRepository {
  const RoadmapRepositoryImpl(this._catalog, this._learning);

  final CatalogDao _catalog;
  final LearningDao _learning;

  @override
  Stream<List<RoadmapProgress>> watchRoadmaps() =>
      _catalog.watchRoadmapProgress().map(
        (rows) => [
          for (final (roadmap, completed, total) in rows)
            RoadmapProgress(
              roadmap: roadmap.toDomain(),
              completedTopics: completed,
              totalTopics: total,
            ),
        ],
      );

  @override
  Stream<RoadmapPath?> watchRoadmapPath(String roadmapId) =>
      _learning.watchPath(roadmapId).map(pathFromRows);

  @override
  Stream<TopicDetails?> watchTopic(String topicId) =>
      _learning.watchTopic(topicId).map((row) => row?.toDomain());

  @override
  Stream<List<TopicChoice>> watchTopicChoices() =>
      _learning.watchAllTopics().map(
        (rows) => [
          for (final (topic, roadmapTitle) in rows)
            TopicChoice(
              id: topic.id,
              title: topic.title,
              roadmapTitle: roadmapTitle,
            ),
        ],
      );
}
