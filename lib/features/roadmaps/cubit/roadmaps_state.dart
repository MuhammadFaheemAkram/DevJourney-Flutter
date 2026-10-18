import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roadmaps_state.freezed.dart';

@freezed
abstract class RoadmapsState with _$RoadmapsState {
  const factory RoadmapsState({
    /// `null` until the roadmaps arrive.
    List<RoadmapProgress>? roadmaps,
    String? activeRoadmapId,

    /// The search text and the category filter: applied in memory, at once.
    /// Four roadmaps don't need a debounced query.
    @Default('') String query,
    RoadmapCategory? category,
    String? errorMessage,

    /// A message for the SnackBar (a sync's result); [messageSerial] makes
    /// each one distinct.
    String? message,
    @Default(0) int messageSerial,
  }) = _RoadmapsState;

  const RoadmapsState._();

  /// The roadmaps that match the search (title or description, ignoring
  /// case) and the category.
  List<RoadmapProgress> get visible {
    final text = query.trim().toLowerCase();
    return [
      for (final item in roadmaps ?? const <RoadmapProgress>[])
        if ((category == null || item.roadmap.category == category) &&
            (text.isEmpty ||
                item.roadmap.title.toLowerCase().contains(text) ||
                item.roadmap.description.toLowerCase().contains(text)))
          item,
    ];
  }

  bool get isFiltering => query.trim().isNotEmpty || category != null;
}
