import 'dart:convert';

import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:drift/drift.dart';

/// Stores a [CalendarDate] as its `yyyymmdd` integer: it sorts, compares and
/// ranges (`BETWEEN`) like the days it stands for.
class CalendarDateConverter extends TypeConverter<CalendarDate, int> {
  const CalendarDateConverter();

  @override
  CalendarDate fromSql(int fromDb) => CalendarDate.fromInt(fromDb);

  @override
  int toSql(CalendarDate value) => value.yyyymmdd;
}

/// Stores a short list of strings (a topic's objectives, a challenge's
/// hints) as a JSON array in one `TEXT` column. They are always read and
/// written whole, never queried, so a separate table would add joins for
/// nothing.
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) =>
      (jsonDecode(fromDb) as List<Object?>).cast<String>();

  @override
  String toSql(List<String> value) => jsonEncode(value);
}

/// Stores a [Uri] as its text.
class UriConverter extends TypeConverter<Uri, String> {
  const UriConverter();

  @override
  Uri fromSql(String fromDb) => Uri.parse(fromDb);

  @override
  String toSql(Uri value) => value.toString();
}
