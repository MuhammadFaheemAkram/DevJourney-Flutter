import 'dart:async';

import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_settings_use_case.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The Roadmaps tab: every roadmap with its progress, searched and filtered
/// in memory, and pull-to-refresh to sync the catalog.
@injectable
class RoadmapsCubit extends Cubit<RoadmapsState> {
  RoadmapsCubit(this._watchRoadmaps, this._watchSettings, this._syncCatalog)
    : super(const RoadmapsState());

  final WatchRoadmapsUseCase _watchRoadmaps;
  final WatchSettingsUseCase _watchSettings;
  final SyncCatalogUseCase _syncCatalog;

  StreamSubscription<List<RoadmapProgress>>? _roadmaps;
  StreamSubscription<AppSettings>? _settings;

  void load() {
    _roadmaps ??= _watchRoadmaps().listen(
      (roadmaps) =>
          emit(state.copyWith(roadmaps: roadmaps, errorMessage: null)),
      onError: (Object _) =>
          emit(state.copyWith(errorMessage: "Couldn't read your roadmaps.")),
    );
    _settings ??= _watchSettings().listen(
      (settings) =>
          emit(state.copyWith(activeRoadmapId: settings.activeRoadmapId)),
    );
  }

  void search(String query) => emit(state.copyWith(query: query));

  void filter(RoadmapCategory? category) =>
      emit(state.copyWith(category: category));

  /// Syncs the catalog and says what came of it. The list follows by
  /// itself: it watches the database. Completes when the sync does, so a
  /// pull-to-refresh spinner knows when to stop.
  Future<void> refresh() async {
    final result = await _syncCatalog();
    if (isClosed) return;
    final message = switch (result) {
      Ok(:final value) => syncSummary(value),
      Err(:final exception) => exception.message,
    };
    emit(
      state.copyWith(message: message, messageSerial: state.messageSerial + 1),
    );
  }

  @override
  Future<void> close() async {
    await _roadmaps?.cancel();
    await _settings?.cancel();
    return super.close();
  }
}
