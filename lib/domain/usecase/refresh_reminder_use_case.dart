import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:injectable/injectable.dart';

/// Brings the reminder in line with the device, at launch and on resume:
/// - permission revoked in system settings → the setting turns off, so it
///   never reads "on" while nothing can ring;
/// - still allowed → scheduled again in the current time zone (a phone that
///   crossed zones keeps "19:00 local").
@injectable
class RefreshReminderUseCase {
  const RefreshReminderUseCase(this._settings, this._scheduler);

  final SettingsRepository _settings;
  final ReminderScheduler _scheduler;

  Future<void> call() async {
    final settings = _settings.current;
    if (!settings.reminderEnabled) return;
    try {
      if (await _scheduler.hasPermission()) {
        await _scheduler.scheduleDaily(settings.reminderTime);
      } else {
        await _settings.setReminderEnabled(enabled: false);
      }
    } on Exception {
      // Best effort: the next launch tries again.
    }
  }
}
