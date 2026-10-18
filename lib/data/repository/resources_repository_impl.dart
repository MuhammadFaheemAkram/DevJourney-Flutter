import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/guard_write.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/daos/resources_dao.dart';
import 'package:dev_journey/data/mapper/challenge_resource_mappers.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:dev_journey/domain/repository/resources_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResourcesRepository)
class ResourcesRepositoryImpl implements ResourcesRepository {
  const ResourcesRepositoryImpl(this._dao, this._clock);

  final ResourcesDao _dao;
  final Clock _clock;

  @override
  Stream<List<ResourceItem>> watchResources({String? topicId}) => _dao
      .watchResources(topicId: topicId)
      .map(
        (rows) => [
          for (final (row, bookmarked, topicTitle) in rows)
            ResourceItem(
              resource: row.toDomain(),
              bookmarked: bookmarked,
              topicTitle: topicTitle,
            ),
        ],
      );

  @override
  Future<Resource?> findResource(String id) async =>
      (await _dao.findById(id))?.toDomain();

  @override
  Future<Result<void>> setBookmarked(String id, {required bool bookmarked}) =>
      guardWrite(
        bookmarked ? 'Saving a resource' : 'Unsaving a resource',
        () => _dao.setBookmarked(
          id,
          bookmarked: bookmarked,
          at: _clock.now().toUtc(),
        ),
      );
}
