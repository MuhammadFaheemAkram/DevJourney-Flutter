import 'package:dev_journey/domain/calculation/streak.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = CalendarDate(2026, 10, 14);
  List<CalendarDate> daysAgo(List<int> offsets) => [
    for (final offset in offsets) today.addDays(-offset),
  ];

  test('no activity, no streak', () {
    expect(learningStreak(const [], today: today), const LearningStreak());
  });

  test('today and the days before it', () {
    expect(
      learningStreak(daysAgo([0, 1, 2]), today: today),
      const LearningStreak(current: 3, longest: 3, todayCounts: true),
    );
  });

  test("today not active yet doesn't break the streak", () {
    expect(
      learningStreak(daysAgo([1, 2, 3, 4]), today: today),
      const LearningStreak(current: 4, longest: 4),
    );
  });

  test('a missed day breaks it; the longest run is remembered', () {
    expect(
      learningStreak(daysAgo([2, 3, 10, 11, 12, 13, 14]), today: today),
      const LearningStreak(longest: 5),
    );
    expect(
      learningStreak(daysAgo([0, 2, 3]), today: today),
      const LearningStreak(current: 1, longest: 2, todayCounts: true),
    );
  });

  test('months and years run on: 31 Dec, 1 Jan', () {
    final newYear = CalendarDate(2027, 1, 1);
    expect(
      learningStreak([
        CalendarDate(2026, 12, 30),
        CalendarDate(2026, 12, 31),
        newYear,
      ], today: newYear).current,
      3,
    );
    expect(
      learningStreak([
        CalendarDate(2028, 2, 28),
        CalendarDate(2028, 2, 29),
        CalendarDate(2028, 3, 1),
      ], today: CalendarDate(2028, 3, 1)).current,
      3,
    );
  });

  test('duplicates count once; days after today are ignored', () {
    expect(
      learningStreak(daysAgo([0, 0, 1, 1, -1, -2]), today: today),
      const LearningStreak(current: 2, longest: 2, todayCounts: true),
    );
  });
}
