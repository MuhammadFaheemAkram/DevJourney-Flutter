import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/guard_write.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/challenges_dao.dart';
import 'package:dev_journey/data/mapper/challenge_resource_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/repository/challenges_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChallengesRepository)
class ChallengesRepositoryImpl implements ChallengesRepository {
  const ChallengesRepositoryImpl(this._dao, this._clock);

  final ChallengesDao _dao;
  final Clock _clock;

  @override
  Stream<List<ChallengeItem>> watchChallenges() => _dao.watchChallenges().map(
    (rows) => [for (final (row, state) in rows) challengeItem(row, state)],
  );

  @override
  Stream<ChallengeItem?> watchChallenge(String id) => _dao
      .watchChallenge(id)
      .map((row) => row == null ? null : challengeItem(row.$1, row.$2));

  @override
  Stream<List<ChallengeItem>> watchRecent({required int limit}) => _dao
      .watchRecent(limit: limit)
      .map(
        (rows) => [for (final (row, state) in rows) challengeItem(row, state)],
      );

  @override
  Future<Result<void>> setStatus(String id, ChallengeStatus status) =>
      guardWrite('Updating a challenge', () async {
        final now = _clock.now();
        final old = await _dao.findState(id);
        if (old?.status == status) return;
        final startedAt = status == ChallengeStatus.todo
            ? null
            : old?.startedAt ?? now.toUtc();
        final completedOn = status == ChallengeStatus.done
            ? old?.completedOn ?? CalendarDate.fromDateTime(now)
            : null;
        await _dao.saveState(
          ChallengeStateRow(
            challengeId: id,
            status: status,
            solutionNotes: old?.solutionNotes ?? '',
            startedAt: startedAt,
            completedOn: completedOn,
            updatedAt: now.toUtc(),
          ),
        );
      });

  @override
  Future<Result<void>> saveSolutionNotes(String id, String notes) =>
      guardWrite('Saving solution notes', () async {
        final old = await _dao.findState(id);
        if (old?.solutionNotes == notes) return;
        await _dao.saveState(
          (old ??
                  ChallengeStateRow(
                    challengeId: id,
                    status: ChallengeStatus.todo,
                    solutionNotes: '',
                    updatedAt: _clock.now().toUtc(),
                  ))
              .copyWith(solutionNotes: notes, updatedAt: _clock.now().toUtc()),
        );
      });
}
