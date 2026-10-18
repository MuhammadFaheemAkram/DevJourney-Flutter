import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/guard_write.dart';
import 'package:dev_journey/core/common/id_generator.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/goals_dao.dart';
import 'package:dev_journey/data/mapper/notes_goals_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GoalsRepository)
class GoalsRepositoryImpl implements GoalsRepository {
  const GoalsRepositoryImpl(this._dao, this._ids, this._clock);

  final GoalsDao _dao;
  final IdGenerator _ids;
  final Clock _clock;

  CalendarDate get _today => CalendarDate.fromDateTime(_clock.now());

  @override
  Stream<List<Goal>> watchGoals() =>
      _dao.watchGoals().map((rows) => [for (final row in rows) row.toDomain()]);

  @override
  Stream<LearningActivity> watchActivity() => _dao.watchActivity().map((rows) {
    final checkIns = <String, List<CalendarDate>>{};
    for (final (goalId, day) in rows.checkIns) {
      (checkIns[goalId] ??= []).add(day);
    }
    return LearningActivity(
      topicCompletions: rows.topics,
      challengeCompletions: rows.challenges,
      checkIns: checkIns,
    );
  });

  @override
  Future<Goal?> findGoal(String id) async =>
      (await _dao.findById(id))?.toDomain();

  @override
  Future<Result<Goal>> addGoal(GoalDraft draft) =>
      guardWrite('Adding a goal', () async {
        final goal = Goal(
          id: _ids.next('goal'),
          title: draft.title,
          kind: draft.kind,
          period: draft.period,
          target: draft.target,
          createdOn: _today,
        );
        await _dao.insertGoal(
          GoalsCompanion.insert(
            id: goal.id,
            title: goal.title,
            kind: goal.kind,
            period: goal.period,
            target: goal.target,
            createdOn: goal.createdOn,
            createdAt: _clock.now().toUtc(),
          ),
        );
        return goal;
      });

  @override
  Future<Result<Goal>> updateGoal(String id, GoalDraft draft) =>
      guardWrite('Updating a goal', () async {
        final row = await _dao.findById(id);
        if (row == null) throw const NotFoundException('goal');
        final updated = row.copyWith(
          title: draft.title,
          kind: draft.kind,
          period: draft.period,
          target: draft.target,
        );
        await _dao.updateGoal(updated);
        return updated.toDomain();
      });

  @override
  Future<Result<void>> deleteGoal(String id) =>
      guardWrite('Deleting a goal', () => _dao.deleteGoal(id));

  @override
  Future<Result<void>> checkIn(String goalId) => guardWrite(
    'Checking in',
    () => _dao.addCheckIn(goalId, day: _today, at: _clock.now().toUtc()),
  );

  @override
  Future<Result<void>> undoCheckIn(
    String goalId, {
    required CalendarDate from,
  }) => guardWrite(
    'Undoing a check-in',
    () => _dao.removeLatestCheckIn(goalId, from: from),
  );
}
