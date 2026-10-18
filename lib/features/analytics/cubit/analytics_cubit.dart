import 'dart:async';

import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:dev_journey/domain/usecase/watch_analytics_use_case.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The Analytics tab: one live summary, derived from the activity.
@injectable
class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit(this._watchAnalytics) : super(const AnalyticsState());

  final WatchAnalyticsUseCase _watchAnalytics;

  StreamSubscription<LearningAnalytics>? _analytics;

  void load() {
    _analytics ??= _watchAnalytics().listen(
      (analytics) => emit(
        AnalyticsState(status: AnalyticsStatus.ready, analytics: analytics),
      ),
      onError: (Object _) =>
          emit(state.copyWith(status: AnalyticsStatus.failure)),
    );
  }

  @override
  Future<void> close() async {
    await _analytics?.cancel();
    return super.close();
  }
}
