import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:drift/drift.dart';

part 'challenges_dao.g.dart';

/// Challenges (catalog) with the user's work on them (`challenge_states`,
/// one row per challenge once touched).
@DriftAccessor(tables: [Challenges, ChallengeStates])
class ChallengesDao extends DatabaseAccessor<AppDatabase>
    with _$ChallengesDaoMixin {
  ChallengesDao(super.attachedDatabase);

  /// Every challenge in catalog order, with its state if any.
  Stream<List<(ChallengeRow, ChallengeStateRow?)>> watchChallenges() {
    final query = select(challenges).join([
      leftOuterJoin(
        challengeStates,
        challengeStates.challengeId.equalsExp(challenges.id),
      ),
    ])..orderBy([OrderingTerm.asc(challenges.sortOrder)]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          (row.readTable(challenges), row.readTableOrNull(challengeStates)),
      ],
    );
  }

  /// One challenge with its state; `null` if it isn't in the catalog.
  Stream<(ChallengeRow, ChallengeStateRow?)?> watchChallenge(String id) {
    final query = select(challenges).join([
      leftOuterJoin(
        challengeStates,
        challengeStates.challengeId.equalsExp(challenges.id),
      ),
    ])..where(challenges.id.equals(id));
    return query.watchSingleOrNull().map(
      (row) => row == null
          ? null
          : (row.readTable(challenges), row.readTableOrNull(challengeStates)),
    );
  }

  /// The challenges worked on last, latest first.
  Stream<List<(ChallengeRow, ChallengeStateRow)>> watchRecent({
    required int limit,
  }) {
    final query =
        select(challengeStates).join([
            innerJoin(
              challenges,
              challenges.id.equalsExp(challengeStates.challengeId),
            ),
          ])
          ..orderBy([OrderingTerm.desc(challengeStates.updatedAt)])
          ..limit(limit);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          (row.readTable(challenges), row.readTable(challengeStates)),
      ],
    );
  }

  Future<ChallengeStateRow?> findState(String challengeId) => (select(
    challengeStates,
  )..where((s) => s.challengeId.equals(challengeId))).getSingleOrNull();

  /// Inserts or updates the challenge's state: an upsert on the user's own
  /// table (`ON CONFLICT DO UPDATE`), never a catalog write.
  ///
  /// Every column is written, `null`s included: given the row itself, drift
  /// would leave a `null` column as it was (`nullToAbsent`), and a
  /// challenge moved back from Done would keep its completion day.
  Future<void> saveState(ChallengeStateRow state) =>
      into(challengeStates).insertOnConflictUpdate(state.toCompanion(false));
}
