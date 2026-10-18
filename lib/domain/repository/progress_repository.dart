import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';

/// What the user has done: completions, bookmarks, active days.
abstract interface class ProgressRepository {
  /// Completes [topicId] today; a topic already completed keeps its day.
  Future<Result<void>> completeTopic(String topicId);

  Future<Result<void>> uncompleteTopic(String topicId);

  /// Completes every incomplete topic of [sectionId] today; returns how
  /// many.
  Future<Result<int>> completeSection(String sectionId);

  /// Uncompletes every topic of [sectionId]; returns how many.
  Future<Result<int>> uncompleteSection(String sectionId);

  Future<Result<void>> setTopicBookmarked(
    String topicId, {
    required bool bookmarked,
  });

  /// Every day with some learning activity, kept live.
  Stream<List<CalendarDate>> watchActiveDays();

  /// Topics and challenges completed, everywhere, kept live.
  Stream<({int topics, int challenges})> watchCompletedCounts();

  /// Clears completions, bookmarks, goal check-ins and challenge state in
  /// one transaction. Notes, goals, the catalog and settings stay.
  Future<Result<void>> resetProgress();
}
