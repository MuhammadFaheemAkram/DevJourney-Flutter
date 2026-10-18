import 'package:dev_journey/domain/model/reminder_time.dart';

/// The device's notifications, for the daily reminder. An interface, so
/// use cases are tested against a fake and no plugin is reachable from a
/// Cubit test.
abstract interface class ReminderScheduler {
  /// Whether notifications are allowed now.
  Future<bool> hasPermission();

  /// Asks for permission if the system still can (Android 13+, iOS); `true`
  /// if notifications are allowed afterwards.
  Future<bool> requestPermission();

  /// One notification every day at [time], local time, replacing any
  /// earlier schedule.
  Future<void> scheduleDaily(ReminderTime time);

  Future<void> cancel();

  /// The app's notification settings, where a denied permission can be
  /// changed (the app can't ask twice).
  Future<void> openNotificationSettings();
}
