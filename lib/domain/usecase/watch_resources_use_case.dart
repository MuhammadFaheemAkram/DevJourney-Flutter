import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:dev_journey/domain/repository/resources_repository.dart';
import 'package:injectable/injectable.dart';

/// Every resource, or one topic's ([topicId]).
@injectable
class WatchResourcesUseCase {
  const WatchResourcesUseCase(this._resources);

  final ResourcesRepository _resources;

  Stream<List<ResourceItem>> call({String? topicId}) =>
      _resources.watchResources(topicId: topicId);
}
