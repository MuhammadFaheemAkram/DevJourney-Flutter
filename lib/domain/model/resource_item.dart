import 'package:dev_journey/domain/model/catalog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_item.freezed.dart';

/// A resource, whether the user saved it, and its topic's title.
@freezed
abstract class ResourceItem with _$ResourceItem {
  const factory ResourceItem({
    required Resource resource,
    @Default(false) bool bookmarked,
    String? topicTitle,
  }) = _ResourceItem;
}
