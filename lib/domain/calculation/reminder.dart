import 'package:dev_journey/domain/model/reminder_time.dart';

/// The next time the daily reminder rings after [now] (local wall-clock
/// time): today at [time] if that's still ahead, otherwise tomorrow.
DateTime nextReminder(DateTime now, ReminderTime time) {
  final today = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return today.isAfter(now)
      ? today
      : DateTime(now.year, now.month, now.day + 1, time.hour, time.minute);
}
