import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_state.freezed.dart';

enum WelcomeStatus {
  /// Fetching the catalog.
  loading,

  /// The catalog couldn't be fetched: show why, and Try again.
  failed,

  /// The roadmaps are here: pick one and start.
  ready,
}

/// How the user chose to start.
enum StartChoice { learn, demo }

@freezed
abstract class WelcomeState with _$WelcomeState {
  const factory WelcomeState({
    @Default(WelcomeStatus.loading) WelcomeStatus status,
    @Default(<RoadmapProgress>[]) List<RoadmapProgress> roadmaps,
    String? selectedRoadmapId,

    /// The start in progress, if any: both buttons wait for it.
    StartChoice? starting,

    /// Why the catalog failed to load, or why the last start failed.
    /// [errorSerial] makes each failure distinct, so the same message twice
    /// still shows twice.
    String? errorMessage,
    @Default(0) int errorSerial,
  }) = _WelcomeState;

  const WelcomeState._();

  bool get isStarting => starting != null;
}
