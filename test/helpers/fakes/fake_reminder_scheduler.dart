import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';

/// Notifications in memory: what's scheduled, and a permission the test
/// decides ([granted]: what the user answers; [allowed]: the state now).
class FakeReminderScheduler implements ReminderScheduler {
  FakeReminderScheduler({this.granted = true, this.allowed = false});

  /// What the user answers when asked.
  bool granted;

  /// Whether notifications are allowed right now.
  bool allowed;

  /// The time a reminder is scheduled for; `null` when none is.
  ReminderTime? scheduled;

  /// Every call, in order: `request`, `schedule 19:00`, `cancel`, …
  final calls = <String>[];

  @override
  Future<bool> hasPermission() async => allowed;

  @override
  Future<bool> requestPermission() async {
    calls.add('request');
    allowed = allowed || granted;
    return allowed;
  }

  @override
  Future<void> scheduleDaily(ReminderTime time) async {
    calls.add('schedule ${time.toStorage()}');
    scheduled = time;
  }

  @override
  Future<void> cancel() async {
    calls.add('cancel');
    scheduled = null;
  }

  @override
  Future<void> openNotificationSettings() async => calls.add('open settings');
}
