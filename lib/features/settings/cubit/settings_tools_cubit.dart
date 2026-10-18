import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/design_system/formatting/labels.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/service/developer_tools.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:dev_journey/domain/usecase/change_reminder_time_use_case.dart';
import 'package:dev_journey/domain/usecase/reset_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/set_reminder_enabled_use_case.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The Settings tab's actions: the daily reminder, sync, reset, and the
/// developer switches. Screen-scoped; the appearance lives in the app-wide
/// `SettingsCubit`. The reminder's current values come from the settings
/// that `SettingsCubit` watches.
@injectable
class SettingsToolsCubit extends Cubit<SettingsToolsState> {
  SettingsToolsCubit(
    this._setReminderEnabled,
    this._changeReminderTime,
    this._syncCatalog,
    this._resetProgress,
    this._scheduler,
    this._developerTools,
  ) : super(
        SettingsToolsState(
          simulatesNetworkFailure: _developerTools.simulatesNetworkFailure,
          publishesCatalogUpdate: _developerTools.publishesCatalogUpdate,
        ),
      );

  final SetReminderEnabledUseCase _setReminderEnabled;
  final ChangeReminderTimeUseCase _changeReminderTime;
  final SyncCatalogUseCase _syncCatalog;
  final ResetProgressUseCase _resetProgress;
  final ReminderScheduler _scheduler;
  final DeveloperTools _developerTools;

  Future<void> setReminderEnabled({required bool enabled}) async {
    if (state.reminderBusy) return;
    emit(state.copyWith(reminderBusy: true));
    final result = await _setReminderEnabled(enabled: enabled);
    if (isClosed) return;
    final denied = switch (result) {
      Err(exception: NotificationsDeniedException()) => true,
      _ => false,
    };
    emit(state.copyWith(reminderBusy: false, notificationsDenied: denied));
    if (result case Err(:final exception) when !denied) {
      _say(exception.message);
    }
  }

  Future<void> changeReminderTime(ReminderTime time) async {
    final result = await _changeReminderTime(time);
    if (result case Err(:final exception)) _say(exception.message);
  }

  Future<void> openNotificationSettings() =>
      _scheduler.openNotificationSettings();

  Future<void> syncCatalog() => _run(DataAction.syncing, () async {
    final result = await _syncCatalog();
    return switch (result) {
      Ok(:final value) => syncSummary(value),
      Err(:final exception) => exception.message,
    };
  });

  Future<void> resetProgress() => _run(DataAction.resetting, () async {
    final result = await _resetProgress();
    return switch (result) {
      Ok() => 'Progress reset. Your notes and goals are still here.',
      Err(:final exception) => exception.message,
    };
  });

  void setSimulatesNetworkFailure({required bool enabled}) {
    _developerTools.simulatesNetworkFailure = enabled;
    emit(state.copyWith(simulatesNetworkFailure: enabled));
  }

  void setPublishesCatalogUpdate({required bool enabled}) {
    _developerTools.publishesCatalogUpdate = enabled;
    emit(state.copyWith(publishesCatalogUpdate: enabled));
  }

  Future<void> _run(DataAction action, Future<String> Function() work) async {
    if (state.running != null) return;
    emit(state.copyWith(running: action));
    final message = await work();
    if (isClosed) return;
    emit(state.copyWith(running: null));
    _say(message);
  }

  void _say(String message) {
    if (isClosed) return;
    emit(
      state.copyWith(message: message, messageSerial: state.messageSerial + 1),
    );
  }
}
