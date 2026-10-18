import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:injectable/injectable.dart';

/// Saves the reminder's time and, if it's on, moves the notification there
/// (the new schedule replaces the old one).
@injectable
class ChangeReminderTimeUseCase {
  const ChangeReminderTimeUseCase(this._settings, this._scheduler);

  final SettingsRepository _settings;
  final ReminderScheduler _scheduler;

  Future<Result<void>> call(ReminderTime time) async {
    try {
      await _settings.setReminderTime(time);
      if (_settings.current.reminderEnabled) {
        await _scheduler.scheduleDaily(time);
      }
      return const Ok(null);
    } on Exception {
      return const Err(UnknownException());
    }
  }
}
