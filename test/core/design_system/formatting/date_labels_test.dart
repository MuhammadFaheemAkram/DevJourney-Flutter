import 'package:dev_journey/core/design_system/formatting/date_labels.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 10, 14, 15); // Wednesday

  test('edited: minutes and hours today, then days', () {
    expect(DateLabels.edited(now, now: now), 'Just now');
    expect(
      DateLabels.edited(now.subtract(const Duration(minutes: 5)), now: now),
      '5 min ago',
    );
    expect(
      DateLabels.edited(now.subtract(const Duration(hours: 3)), now: now),
      '3 h ago',
    );
    expect(
      DateLabels.edited(now.subtract(const Duration(hours: 20)), now: now),
      'Yesterday',
    );
    expect(DateLabels.edited(DateTime(2026, 10, 2, 9), now: now), 'Fri, 2 Oct');
  });

  test('edited: a UTC time reads in local time', () {
    final at = now.subtract(const Duration(minutes: 30)).toUtc();
    expect(DateLabels.edited(at, now: now), '30 min ago');
  });

  test('resets: tomorrow, a weekday within the week, then a date', () {
    final today = CalendarDate(2026, 10, 14);
    expect(
      DateLabels.resets(CalendarDate(2026, 10, 15), today: today),
      'Resets tomorrow',
    );
    expect(
      DateLabels.resets(CalendarDate(2026, 10, 19), today: today),
      'Resets Monday',
    );
    expect(
      DateLabels.resets(CalendarDate(2026, 11, 1), today: today),
      'Resets 1 Nov',
    );
  });
}
