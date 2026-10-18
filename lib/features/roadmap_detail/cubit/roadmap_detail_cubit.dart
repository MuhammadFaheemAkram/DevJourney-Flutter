import 'dart:async';

import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/calculation/recommendation.dart';
import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/usecase/set_active_roadmap_use_case.dart';
import 'package:dev_journey/domain/usecase/set_section_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmap_path_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_settings_use_case.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// One roadmap's learning path: the live path, which sections are open,
/// completing a section, and making it the active roadmap.
@injectable
class RoadmapDetailCubit extends Cubit<RoadmapDetailState> {
  RoadmapDetailCubit(
    this._watchPath,
    this._watchSettings,
    this._setSectionCompleted,
    this._setActive,
    @factoryParam this.roadmapId,
  ) : super(const RoadmapDetailState());

  final WatchRoadmapPathUseCase _watchPath;
  final WatchSettingsUseCase _watchSettings;
  final SetSectionCompletedUseCase _setSectionCompleted;
  final SetActiveRoadmapUseCase _setActive;
  final String roadmapId;

  StreamSubscription<RoadmapPath?>? _path;
  StreamSubscription<AppSettings>? _settings;
  var _openedFirst = false;

  void load() {
    _path ??= _watchPath(roadmapId).listen((path) {
      if (path == null) {
        emit(state.copyWith(status: RoadmapDetailStatus.notFound, path: null));
        return;
      }
      emit(
        state.copyWith(
          status: RoadmapDetailStatus.found,
          path: path,
          expandedSectionIds: _openedFirst
              ? state.expandedSectionIds
              : _initiallyOpen(path),
        ),
      );
      _openedFirst = true;
    });
    _settings ??= _watchSettings().listen(
      (settings) =>
          emit(state.copyWith(isActive: settings.activeRoadmapId == roadmapId)),
    );
  }

  /// The section with the next topic to learn opens at first, so the path
  /// starts where the user left off (the first one if all are done).
  static Set<String> _initiallyOpen(RoadmapPath path) {
    final next = recommendedTopic(path);
    final section =
        next?.topic.sectionId ?? path.sections.firstOrNull?.section.id;
    return {?section};
  }

  void toggleSection(String sectionId) {
    final open = {...state.expandedSectionIds};
    if (!open.remove(sectionId)) open.add(sectionId);
    emit(state.copyWith(expandedSectionIds: open));
  }

  /// Completes every open topic of the section today (or uncompletes them
  /// all) and says how many changed.
  Future<void> setSectionCompleted(
    String sectionId, {
    required bool completed,
  }) async {
    final result = await _setSectionCompleted(sectionId, completed: completed);
    if (isClosed) return;
    _say(switch (result) {
      Ok(:final value) when completed =>
        '$value ${value == 1 ? 'topic' : 'topics'} completed',
      Ok() => 'Section marked as not done',
      Err(:final exception) => exception.message,
    });
  }

  Future<void> setActive() async {
    await _setActive(roadmapId);
    if (isClosed) return;
    _say('The Dashboard now follows this roadmap');
  }

  void _say(String message) => emit(
    state.copyWith(message: message, messageSerial: state.messageSerial + 1),
  );

  @override
  Future<void> close() async {
    await _path?.cancel();
    await _settings?.cancel();
    return super.close();
  }
}
