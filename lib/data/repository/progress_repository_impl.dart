import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/guard_write.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/daos/learning_dao.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:injectable/injectable.dart';

/// Records progress with the day it happened, taken from the injected clock
/// in the user's time zone: a completion at 23:59 counts for that day's
/// streak.
@LazySingleton(as: ProgressRepository)
class ProgressRepositoryImpl implements ProgressRepository {
  const ProgressRepositoryImpl(this._dao, this._clock);

  final LearningDao _dao;
  final Clock _clock;

  CalendarDate get _today => CalendarDate.fromDateTime(_clock.now());

  DateTime get _now => _clock.now().toUtc();

  @override
  Future<Result<void>> completeTopic(String topicId) => guardWrite(
    'Completing a topic',
    () => _dao.completeTopic(topicId, day: _today, at: _now),
  );

  @override
  Future<Result<void>> uncompleteTopic(String topicId) =>
      guardWrite('Uncompleting a topic', () => _dao.uncompleteTopic(topicId));

  @override
  Future<Result<int>> completeSection(String sectionId) => guardWrite(
    'Completing a section',
    () => _dao.completeSection(sectionId, day: _today, at: _now),
  );

  @override
  Future<Result<int>> uncompleteSection(String sectionId) => guardWrite(
    'Uncompleting a section',
    () => _dao.uncompleteSection(sectionId),
  );

  @override
  Future<Result<void>> setTopicBookmarked(
    String topicId, {
    required bool bookmarked,
  }) => guardWrite(
    'Bookmarking a topic',
    () => _dao.setTopicBookmarked(topicId, bookmarked: bookmarked, at: _now),
  );

  @override
  Stream<List<CalendarDate>> watchActiveDays() => _dao.watchActiveDays();

  @override
  Stream<({int topics, int challenges})> watchCompletedCounts() =>
      _dao.watchCompletedCounts();
}
