import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:intl/intl.dart';

/// How dates read on screen. Formatting lives here, never in the domain.
abstract final class DateLabels {
  /// "Today", "Yesterday", "Mon, 12 Oct", and the year too when it isn't
  /// this year's.
  static String day(CalendarDate date, {required CalendarDate today}) {
    if (date == today) return 'Today';
    if (date == today.addDays(-1)) return 'Yesterday';
    final pattern = date.year == today.year ? 'EEE, d MMM' : 'EEE, d MMM y';
    return DateFormat(pattern).format(date.toDateTime());
  }

  /// "14 Oct 2026".
  static String short(CalendarDate date) =>
      DateFormat('d MMM y').format(date.toDateTime());
}
