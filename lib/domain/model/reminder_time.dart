import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_time.freezed.dart';

/// A minute of the day for the daily reminder, in the user's local time.
/// Stored as `HH:mm`.
@freezed
abstract class ReminderTime with _$ReminderTime {
  @Assert('hour >= 0 && hour < 24', 'hour is 0–23')
  @Assert('minute >= 0 && minute < 60', 'minute is 0–59')
  const factory ReminderTime({required int hour, required int minute}) =
      _ReminderTime;

  const ReminderTime._();

  /// 19:00: after work or school, before the evening is gone.
  static const evening = ReminderTime(hour: 19, minute: 0);

  /// `null` for anything that isn't a valid `HH:mm`.
  static ReminderTime? tryParse(String text) {
    final match = RegExp(r'^(\d{2}):(\d{2})$').firstMatch(text);
    if (match == null) return null;
    final hour = int.parse(match[1]!);
    final minute = int.parse(match[2]!);
    if (hour > 23 || minute > 59) return null;
    return ReminderTime(hour: hour, minute: minute);
  }

  /// "07:05".
  String toStorage() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
