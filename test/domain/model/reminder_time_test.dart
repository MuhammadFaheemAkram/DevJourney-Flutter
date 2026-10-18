import 'package:dev_journey/domain/calculation/reminder.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('stored as HH:mm, read back', () {
    const time = ReminderTime(hour: 7, minute: 5);
    expect(time.toStorage(), '07:05');
    expect(ReminderTime.tryParse('07:05'), time);
    expect(
      ReminderTime.tryParse('23:59'),
      const ReminderTime(hour: 23, minute: 59),
    );
  });

  test('anything else is rejected', () {
    for (final text in ['', '7:05', '24:00', '12:60', '12-30', 'ab:cd']) {
      expect(ReminderTime.tryParse(text), isNull, reason: text);
    }
  });

  group('nextReminder', () {
    const seven = ReminderTime(hour: 19, minute: 0);

    test('today, while it is still ahead', () {
      expect(
        nextReminder(DateTime(2026, 10, 14, 15), seven),
        DateTime(2026, 10, 14, 19),
      );
    });

    test('tomorrow, once it has passed (or is now)', () {
      expect(
        nextReminder(DateTime(2026, 10, 14, 19), seven),
        DateTime(2026, 10, 15, 19),
      );
      expect(
        nextReminder(DateTime(2026, 10, 14, 21), seven),
        DateTime(2026, 10, 15, 19),
      );
    });

    test('across the end of a month and a year', () {
      expect(
        nextReminder(DateTime(2026, 12, 31, 20), seven),
        DateTime(2027, 1, 1, 19),
      );
    });
  });
}
