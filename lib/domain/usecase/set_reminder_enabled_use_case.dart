import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:injectable/injectable.dart';

/// Turns the daily reminder on or off.
///
/// On: asks for notification permission first. Denied, the setting stays
/// off (it never reads "on" while nothing can ring) and the caller says how
/// to allow it. Off: cancels the scheduled notification.
@injectable
class SetReminderEnabledUseCase {
  const SetReminderEnabledUseCase(this._settings, this._scheduler);

  final SettingsRepository _settings;
  final ReminderScheduler _scheduler;

  Future<Result<void>> call({required bool enabled}) async {
    try {
      if (!enabled) {
        await _scheduler.cancel();
        await _settings.setReminderEnabled(enabled: false);
        return const Ok(null);
      }
      if (!await _scheduler.requestPermission()) {
        await _settings.setReminderEnabled(enabled: false);
        return const Err(NotificationsDeniedException());
      }
      await _scheduler.scheduleDaily(_settings.current.reminderTime);
      await _settings.setReminderEnabled(enabled: true);
      return const Ok(null);
    } on Exception {
      return const Err(UnknownException());
    }
  }
}
