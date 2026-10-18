import 'dart:async';

import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/usecase/check_in_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/delete_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/save_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/undo_check_in_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_goal_progress_use_case.dart';
import 'package:dev_journey/features/goals/cubit/goals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The goals with their progress, kept live: a completion anywhere in the
/// app, or a check-in here, moves the bars at once, because the progress
/// is derived from the same rows.
@injectable
class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit(
    this._watchProgress,
    this._save,
    this._delete,
    this._checkIn,
    this._undoCheckIn,
    this._clock,
  ) : super(GoalsState(today: CalendarDate.fromDateTime(_clock.now())));

  final WatchGoalProgressUseCase _watchProgress;
  final SaveGoalUseCase _save;
  final DeleteGoalUseCase _delete;
  final CheckInGoalUseCase _checkIn;
  final UndoCheckInUseCase _undoCheckIn;
  final Clock _clock;

  StreamSubscription<List<GoalProgress>>? _goals;

  void load() {
    _goals ??= _watchProgress().listen(
      (goals) => emit(
        state.copyWith(
          status: GoalsStatus.ready,
          goals: goals,
          today: CalendarDate.fromDateTime(_clock.now()),
        ),
      ),
      onError: (Object _) => emit(state.copyWith(status: GoalsStatus.failure)),
    );
  }

  void selectPeriod(GoalPeriod period) => emit(state.copyWith(period: period));

  /// Adds a goal, or changes [id]'s, and shows its period's tab.
  Future<void> save(GoalDraft draft, {String? id}) async {
    final result = await _save(draft, id: id);
    if (isClosed) return;
    switch (result) {
      case Ok():
        emit(
          state.copyWith(
            period: draft.period,
            message: id == null ? 'Goal added' : 'Goal updated',
            messageSerial: state.messageSerial + 1,
          ),
        );
      case Err(:final exception):
        _say(exception.message);
    }
  }

  Future<void> delete(String id) async {
    final result = await _delete(id);
    if (isClosed) return;
    _say(switch (result) {
      Ok() => 'Goal deleted',
      Err(:final exception) => exception.message,
    });
  }

  Future<void> checkIn(GoalProgress progress) async =>
      _sayIfFailed(await _checkIn(progress));

  Future<void> undoCheckIn(GoalProgress progress) async =>
      _sayIfFailed(await _undoCheckIn(progress));

  void _sayIfFailed(Result<void> result) {
    if (result case Err(:final exception)) _say(exception.message);
  }

  void _say(String message) {
    if (isClosed) return;
    emit(
      state.copyWith(message: message, messageSerial: state.messageSerial + 1),
    );
  }

  @override
  Future<void> close() async {
    await _goals?.cancel();
    return super.close();
  }
}
