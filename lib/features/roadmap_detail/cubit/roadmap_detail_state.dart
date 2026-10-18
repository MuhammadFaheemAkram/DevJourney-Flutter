import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roadmap_detail_state.freezed.dart';

enum RoadmapDetailStatus { loading, found, notFound }

@freezed
abstract class RoadmapDetailState with _$RoadmapDetailState {
  const factory RoadmapDetailState({
    @Default(RoadmapDetailStatus.loading) RoadmapDetailStatus status,

    /// Sections → topics, with progress.
    RoadmapPath? path,

    /// Which sections are open. Kept here, not in the widgets, so it
    /// survives every rebuild the live path causes.
    @Default(<String>{}) Set<String> expandedSectionIds,
    @Default(false) bool isActive,

    /// A message for the SnackBar; [messageSerial] makes each one distinct.
    String? message,
    @Default(0) int messageSerial,
  }) = _RoadmapDetailState;
}
