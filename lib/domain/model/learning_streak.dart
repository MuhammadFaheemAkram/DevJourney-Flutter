import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_streak.freezed.dart';

/// How many days in a row the user has learned something.
@freezed
abstract class LearningStreak with _$LearningStreak {
  const factory LearningStreak({
    /// The run of active days ending today, or yesterday if today has no
    /// activity yet: a streak isn't broken until the day is over.
    @Default(0) int current,

    /// The longest run ever.
    @Default(0) int longest,

    /// Whether today already counts.
    @Default(false) bool todayCounts,
  }) = _LearningStreak;
}
