import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:drift/drift.dart';

part 'learning_dao.g.dart';

/// One row of a roadmap's path: the roadmap, and a section with one of its
/// topics and the user's state on it. A section without topics comes once,
/// with a `null` topic; a roadmap without sections once, with a `null`
/// section.
typedef PathRow = ({
  RoadmapRow roadmap,
  SectionRow? section,
  TopicRow? topic,
  TopicProgressRow? progress,
  bool bookmarked,
});

/// A topic with its roadmap, its section and the user's state on it.
typedef TopicDetailsRow = ({
  TopicRow topic,
  RoadmapRow roadmap,
  SectionRow section,
  TopicProgressRow? progress,
  bool bookmarked,
});

/// Reading learning paths and recording progress: the catalog joined to the
/// user's tables.
@DriftAccessor(
  tables: [
    Roadmaps,
    RoadmapSections,
    Topics,
    TopicProgress,
    TopicBookmarks,
    ChallengeStates,
    GoalCheckIns,
  ],
)
class LearningDao extends DatabaseAccessor<AppDatabase>
    with _$LearningDaoMixin {
  LearningDao(super.attachedDatabase);

  /// [roadmapId]'s whole path, in order, kept live: **one** query, so a
  /// completion re-emits one consistent path (no moment where the counts and
  /// the checks disagree).
  ///
  /// ```sql
  /// SELECT … FROM roadmaps
  /// LEFT JOIN roadmap_sections ON …  LEFT JOIN topics ON …
  /// LEFT JOIN topic_progress ON …    LEFT JOIN topic_bookmarks ON …
  /// WHERE roadmaps.id = ? ORDER BY sections.sort_order, topics.sort_order
  /// ```
  Stream<List<PathRow>> watchPath(String roadmapId) {
    final query =
        select(roadmaps).join([
            leftOuterJoin(
              roadmapSections,
              roadmapSections.roadmapId.equalsExp(roadmaps.id),
            ),
            leftOuterJoin(
              topics,
              topics.sectionId.equalsExp(roadmapSections.id),
            ),
            leftOuterJoin(
              topicProgress,
              topicProgress.topicId.equalsExp(topics.id),
            ),
            leftOuterJoin(
              topicBookmarks,
              topicBookmarks.topicId.equalsExp(topics.id),
            ),
          ])
          ..where(roadmaps.id.equals(roadmapId))
          ..orderBy([
            OrderingTerm.asc(roadmapSections.sortOrder),
            OrderingTerm.asc(topics.sortOrder),
          ]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          (
            roadmap: row.readTable(roadmaps),
            section: row.readTableOrNull(roadmapSections),
            topic: row.readTableOrNull(topics),
            progress: row.readTableOrNull(topicProgress),
            bookmarked: row.readTableOrNull(topicBookmarks) != null,
          ),
      ],
    );
  }

  /// One topic with where it sits and its state, kept live; `null` if no
  /// such topic exists.
  Stream<TopicDetailsRow?> watchTopic(String topicId) {
    final query = select(topics).join([
      innerJoin(roadmaps, roadmaps.id.equalsExp(topics.roadmapId)),
      innerJoin(
        roadmapSections,
        roadmapSections.id.equalsExp(topics.sectionId),
      ),
      leftOuterJoin(topicProgress, topicProgress.topicId.equalsExp(topics.id)),
      leftOuterJoin(
        topicBookmarks,
        topicBookmarks.topicId.equalsExp(topics.id),
      ),
    ])..where(topics.id.equals(topicId));
    return query.watchSingleOrNull().map(
      (row) => row == null
          ? null
          : (
              topic: row.readTable(topics),
              roadmap: row.readTable(roadmaps),
              section: row.readTable(roadmapSections),
              progress: row.readTableOrNull(topicProgress),
              bookmarked: row.readTableOrNull(topicBookmarks) != null,
            ),
    );
  }

  /// Marks [topicId] completed on [day]. A topic already completed keeps
  /// its first day (`INSERT OR IGNORE`): completing twice changes nothing.
  Future<void> completeTopic(
    String topicId, {
    required CalendarDate day,
    required DateTime at,
  }) => into(topicProgress).insert(
    TopicProgressCompanion.insert(
      topicId: topicId,
      completedOn: day,
      completedAt: at,
    ),
    mode: InsertMode.insertOrIgnore,
  );

  Future<int> uncompleteTopic(String topicId) =>
      (delete(topicProgress)..where((p) => p.topicId.equals(topicId))).go();

  /// Completes every topic of [sectionId] that isn't yet, on [day]; the
  /// others keep their own days. Returns how many it completed.
  Future<int> completeSection(
    String sectionId, {
    required CalendarDate day,
    required DateTime at,
  }) {
    return transaction(() async {
      final open =
          await (select(topics)..where(
                (t) =>
                    t.sectionId.equals(sectionId) &
                    t.id.isNotInQuery(
                      selectOnly(topicProgress)
                        ..addColumns([topicProgress.topicId]),
                    ),
              ))
              .map((t) => t.id)
              .get();
      await batch(
        (batch) => batch.insertAll(topicProgress, [
          for (final id in open)
            TopicProgressCompanion.insert(
              topicId: id,
              completedOn: day,
              completedAt: at,
            ),
        ]),
      );
      return open.length;
    });
  }

  /// Uncompletes every topic of [sectionId]; returns how many.
  Future<int> uncompleteSection(String sectionId) =>
      (delete(topicProgress)..where(
            (p) => p.topicId.isInQuery(
              selectOnly(topics)
                ..addColumns([topics.id])
                ..where(topics.sectionId.equals(sectionId)),
            ),
          ))
          .go();

  Future<void> setTopicBookmarked(
    String topicId, {
    required bool bookmarked,
    required DateTime at,
  }) async {
    if (bookmarked) {
      await into(topicBookmarks).insert(
        TopicBookmarksCompanion.insert(topicId: topicId, createdAt: at),
        mode: InsertMode.insertOrIgnore,
      );
    } else {
      await (delete(
        topicBookmarks,
      )..where((b) => b.topicId.equals(topicId))).go();
    }
  }

  /// Every day the user did something: completed a topic or a challenge, or
  /// checked in on a goal. `UNION` drops duplicates.
  Stream<List<CalendarDate>> watchActiveDays() {
    return customSelect(
      'SELECT completed_on AS day FROM topic_progress '
      'UNION SELECT completed_on FROM challenge_states '
      'WHERE completed_on IS NOT NULL '
      'UNION SELECT day FROM goal_check_ins',
      readsFrom: {topicProgress, challengeStates, goalCheckIns},
    ).watch().map(
      (rows) => [
        for (final row in rows) CalendarDate.fromInt(row.read<int>('day')),
      ],
    );
  }

  /// How many topics and challenges the user has completed, everywhere.
  Stream<({int topics, int challenges})> watchCompletedCounts() {
    return customSelect(
      'SELECT (SELECT COUNT(*) FROM topic_progress) AS topics, '
      "(SELECT COUNT(*) FROM challenge_states WHERE status = 'done') "
      'AS challenges',
      readsFrom: {topicProgress, challengeStates},
    ).watchSingle().map(
      (row) => (
        topics: row.read<int>('topics'),
        challenges: row.read<int>('challenges'),
      ),
    );
  }
}
