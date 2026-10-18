import 'dart:async';

import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:dev_journey/domain/usecase/watch_dashboard_use_case.dart';
import 'package:dev_journey/features/dashboard/cubit/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The Dashboard: one live summary, derived from the database.
@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._watchDashboard) : super(const DashboardState());

  final WatchDashboardUseCase _watchDashboard;

  StreamSubscription<DashboardSummary>? _summary;

  void load() {
    _summary ??= _watchDashboard().listen(
      (summary) => emit(DashboardState(summary: summary)),
      onError: (Object _) =>
          emit(state.copyWith(errorMessage: "Couldn't read your progress.")),
    );
  }

  @override
  Future<void> close() async {
    await _summary?.cancel();
    return super.close();
  }
}
