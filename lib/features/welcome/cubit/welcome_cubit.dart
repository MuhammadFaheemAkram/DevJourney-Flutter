import 'package:dev_journey/core/common/first_value.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart';
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// First launch: fetch the catalog, let the user pick a roadmap, start.
///
/// It never navigates: a successful start sets the onboarded flag, and the
/// router's gate reacts to it.
@injectable
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit(
    this._syncCatalog,
    this._watchRoadmaps,
    this._startLearning,
    this._startWithDemo,
  ) : super(const WelcomeState());

  final SyncCatalogUseCase _syncCatalog;
  final WatchRoadmapsUseCase _watchRoadmaps;
  final StartLearningUseCase _startLearning;
  final StartWithDemoProgressUseCase _startWithDemo;

  /// Fetches the catalog (again, after a failure), then lists the roadmaps
  /// with the first one selected.
  Future<void> load() async {
    emit(state.copyWith(status: WelcomeStatus.loading, errorMessage: null));
    final result = await _syncCatalog();
    if (isClosed) return;
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          status: WelcomeStatus.failed,
          errorMessage: exception.message,
        ),
      );
      return;
    }
    final roadmaps = await _watchRoadmaps().firstValue;
    if (isClosed) return;
    emit(
      state.copyWith(
        status: WelcomeStatus.ready,
        roadmaps: roadmaps,
        selectedRoadmapId:
            state.selectedRoadmapId ?? roadmaps.firstOrNull?.roadmap.id,
      ),
    );
  }

  void select(String roadmapId) {
    if (state.isStarting) return;
    emit(state.copyWith(selectedRoadmapId: roadmapId));
  }

  Future<void> start(StartChoice choice) async {
    final roadmapId = state.selectedRoadmapId;
    // A second tap while a start is running does nothing.
    if (state.status != WelcomeStatus.ready ||
        state.isStarting ||
        roadmapId == null) {
      return;
    }
    emit(state.copyWith(starting: choice));
    switch (choice) {
      case StartChoice.learn:
        await _startLearning(roadmapId);
        if (isClosed) return;
        emit(state.copyWith(starting: null));
      case StartChoice.demo:
        final result = await _startWithDemo(roadmapId);
        if (isClosed) return;
        emit(switch (result) {
          Ok() => state.copyWith(starting: null),
          Err(:final exception) => state.copyWith(
            starting: null,
            errorMessage: exception.message,
            errorSerial: state.errorSerial + 1,
          ),
        });
    }
  }
}
