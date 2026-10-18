import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/resource_item.dart';

/// Learning resources and the user's saved ones.
abstract interface class ResourcesRepository {
  /// Resources in catalog order, kept live; [topicId] narrows to one
  /// topic's.
  Stream<List<ResourceItem>> watchResources({String? topicId});

  Future<Resource?> findResource(String id);

  Future<Result<void>> setBookmarked(String id, {required bool bookmarked});
}
