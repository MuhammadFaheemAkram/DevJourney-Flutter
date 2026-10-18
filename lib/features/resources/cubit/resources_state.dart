import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resources_state.freezed.dart';

enum ResourcesStatus { loading, ready, failure }

@freezed
abstract class ResourcesState with _$ResourcesState {
  const factory ResourcesState({
    @Default(ResourcesStatus.loading) ResourcesStatus status,
    @Default(<ResourceItem>[]) List<ResourceItem> resources,
    @Default('') String query,

    /// `null`: every type.
    ResourceType? type,
    @Default(false) bool savedOnly,
    String? message,
    @Default(0) int messageSerial,
  }) = _ResourcesState;

  const ResourcesState._();

  /// What the search, the type and Saved let through. The query matches
  /// the title, the source ("dart.dev") and the topic, ignoring case.
  List<ResourceItem> get visible {
    final words = query.toLowerCase();
    return [
      for (final item in resources)
        if ((type == null || item.resource.type == type) &&
            (!savedOnly || item.bookmarked) &&
            (words.isEmpty ||
                item.resource.title.toLowerCase().contains(words) ||
                item.resource.source.toLowerCase().contains(words) ||
                (item.topicTitle?.toLowerCase().contains(words) ?? false)))
          item,
    ];
  }
}
