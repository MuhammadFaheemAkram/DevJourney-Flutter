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

  /// When something was last changed: "Just now", "5 min ago", "3 h ago",
  /// then [day]'s labels ("Yesterday", "Mon, 12 Oct").
  static String edited(DateTime at, {required DateTime now}) {
    final local = at.toLocal();
    final ago = now.difference(local);
    final today = CalendarDate.fromDateTime(now);
    final day = CalendarDate.fromDateTime(local);
    if (day == today && !ago.isNegative) {
      if (ago.inMinutes < 1) return 'Just now';
      if (ago.inHours < 1) return '${ago.inMinutes} min ago';
      return '${ago.inHours} h ago';
    }
    return DateLabels.day(day, today: today);
  }

  /// When a goal starts over: "Resets tomorrow", "Resets Monday" (within a
  /// week), "Resets 1 Nov".
  static String resets(CalendarDate day, {required CalendarDate today}) {
    if (day == today.addDays(1)) return 'Resets tomorrow';
    if (day <= today.addDays(7)) {
      return 'Resets ${DateFormat('EEEE').format(day.toDateTime())}';
    }
    return 'Resets ${DateFormat('d MMM').format(day.toDateTime())}';
  }

  /// "14 Oct 2026".
  static String short(CalendarDate date) =>
      DateFormat('d MMM y').format(date.toDateTime());
}
