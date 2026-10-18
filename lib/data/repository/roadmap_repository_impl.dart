import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RoadmapRepository)
class RoadmapRepositoryImpl implements RoadmapRepository {
  const RoadmapRepositoryImpl(this._dao);

  final CatalogDao _dao;

  @override
  Stream<List<RoadmapProgress>> watchRoadmaps() =>
      _dao.watchRoadmapProgress().map(
        (rows) => [
          for (final (roadmap, completed, total) in rows)
            RoadmapProgress(
              roadmap: roadmap.toDomain(),
              completedTopics: completed,
              totalTopics: total,
            ),
        ],
      );
}
