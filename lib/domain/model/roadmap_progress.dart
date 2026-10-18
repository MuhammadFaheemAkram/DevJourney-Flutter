import 'package:dev_journey/domain/model/catalog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roadmap_progress.freezed.dart';

/// A roadmap with how much of it is done, counted by the database when it
/// is read. Nothing stores a percentage: a topic added by a sync lowers it,
/// as it should.
@freezed
abstract class RoadmapProgress with _$RoadmapProgress {
  const factory RoadmapProgress({
    required Roadmap roadmap,
    required int completedTopics,
    required int totalTopics,
  }) = _RoadmapProgress;

  const RoadmapProgress._();

  /// 0 to 1; 0 for a roadmap with no topics.
  double get ratio => totalTopics == 0 ? 0 : completedTopics / totalTopics;

  bool get isComplete => totalTopics > 0 && completedTopics == totalTopics;
}

/// What a catalog sync changed.
@freezed
abstract class SyncResult with _$SyncResult {
  const factory SyncResult({
    required int version,
    @Default(0) int newRoadmaps,
    @Default(0) int newTopics,
    @Default(0) int newResources,
    @Default(0) int newChallenges,
  }) = _SyncResult;

  const SyncResult._();

  bool get hasNewContent =>
      newRoadmaps + newTopics + newResources + newChallenges > 0;
}
