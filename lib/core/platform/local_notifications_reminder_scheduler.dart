import 'package:app_settings/app_settings.dart';
import 'package:dev_journey/domain/calculation/reminder.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/service/reminder_scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// The daily reminder with `flutter_local_notifications`.
///
/// **One repeating, zoned notification**, not a background job: the system
/// shows it every day at the chosen wall-clock time even if the app never
/// runs (`matchDateTimeComponents: time`), and survives reboots (the boot
/// receiver in the Android manifest). It's scheduled in the device's time
/// zone, looked up again on every schedule, and the app reschedules at
/// launch and on resume, so a trip across time zones keeps it at "19:00
/// local".
///
/// **Inexact on Android:** a nudge to learn doesn't need minute precision,
/// and exact alarms need a special permission since Android 14.
@LazySingleton(as: ReminderScheduler)
class LocalNotificationsReminderScheduler implements ReminderScheduler {
  LocalNotificationsReminderScheduler();

  static const _id = 1;

  final _plugin = FlutterLocalNotificationsPlugin();
  Future<void>? _initialized;

  /// Sets the plugin up once. Permission isn't requested here: only when
  /// the user turns the reminder on, so the system prompt has a reason.
  Future<void> _initialize() => _initialized ??= () async {
    tz_data.initializeTimeZones();
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );
  }();

  AndroidFlutterLocalNotificationsPlugin? get _android => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  IOSFlutterLocalNotificationsPlugin? get _ios => _plugin
      .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin
      >();

  @override
  Future<bool> hasPermission() async {
    await _initialize();
    final android = _android;
    if (android != null) {
      return await android.areNotificationsEnabled() ?? false;
    }
    final options = await _ios?.checkPermissions();
    return options?.isEnabled ?? false;
  }

  @override
  Future<bool> requestPermission() async {
    await _initialize();
    final android = _android;
    if (android != null) {
      // Android 13+ shows the prompt (once); older versions allow by
      // default, unless the user turned notifications off.
      await android.requestNotificationsPermission();
      return hasPermission();
    }
    return await _ios?.requestPermissions(alert: true, sound: true) ?? false;
  }

  @override
  Future<void> scheduleDaily(ReminderTime time) async {
    await _initialize();
    final zone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(_location(zone.identifier));
    final next = nextReminder(DateTime.now(), time);
    await _plugin.zonedSchedule(
      id: _id,
      title: 'Time to learn',
      body: 'A topic a day keeps your streak going.',
      scheduledDate: tz.TZDateTime(
        tz.local,
        next.year,
        next.month,
        next.day,
        next.hour,
        next.minute,
      ),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          'Daily reminder',
          channelDescription: 'One reminder a day to keep learning',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Future<void> cancel() async {
    await _initialize();
    await _plugin.cancel(id: _id);
  }

  @override
  Future<void> openNotificationSettings() =>
      AppSettings.openAppSettings(type: AppSettingsType.notification);

  /// The zone's rules, or UTC if this database doesn't know the name (a
  /// newer zone than the bundled data).
  static tz.Location _location(String identifier) {
    try {
      return tz.getLocation(identifier);
    } on tz.LocationNotFoundException {
      return tz.UTC;
    }
  }
}
