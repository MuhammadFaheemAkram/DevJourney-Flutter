import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:drift/drift.dart';

part 'user_data_dao.g.dart';

/// The user's data, as rows: what "Explore with demo progress" writes.
class UserRows {
  const UserRows({
    this.progress = const [],
    this.topicBookmarks = const [],
    this.resourceBookmarks = const [],
    this.notes = const [],
    this.goals = const [],
    this.checkIns = const [],
    this.challengeStates = const [],
  });

  final List<TopicProgressCompanion> progress;
  final List<TopicBookmarksCompanion> topicBookmarks;
  final List<ResourceBookmarksCompanion> resourceBookmarks;
  final List<NotesCompanion> notes;
  final List<GoalsCompanion> goals;
  final List<GoalCheckInsCompanion> checkIns;
  final List<ChallengeStatesCompanion> challengeStates;
}

/// Writes that touch all of the user's tables at once.
@DriftAccessor(
  tables: [
    TopicProgress,
    TopicBookmarks,
    ResourceBookmarks,
    Notes,
    Goals,
    GoalCheckIns,
    ChallengeStates,
  ],
)
class UserDataDao extends DatabaseAccessor<AppDatabase>
    with _$UserDataDaoMixin {
  UserDataDao(super.attachedDatabase);

  /// Replaces the user's data with [rows] in **one transaction**: it lands
  /// completely or not at all, and running it twice gives the same result.
  Future<void> replaceAll(UserRows rows) {
    return transaction(() async {
      await _deleteAll();
      await batch((batch) {
        batch
          ..insertAll(topicProgress, rows.progress)
          ..insertAll(topicBookmarks, rows.topicBookmarks)
          ..insertAll(resourceBookmarks, rows.resourceBookmarks)
          ..insertAll(notes, rows.notes)
          ..insertAll(goals, rows.goals)
          ..insertAll(goalCheckIns, rows.checkIns)
          ..insertAll(challengeStates, rows.challengeStates);
      });
    });
  }

  Future<void> _deleteAll() async {
    // Children before parents: check-ins point at goals.
    for (final table in <TableInfo<Table, Object?>>[
      goalCheckIns,
      goals,
      topicProgress,
      topicBookmarks,
      resourceBookmarks,
      notes,
      challengeStates,
    ]) {
      await delete(table).go();
    }
  }
}
