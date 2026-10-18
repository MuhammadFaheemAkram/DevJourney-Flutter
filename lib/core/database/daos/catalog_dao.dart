import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:drift/drift.dart';

part 'catalog_dao.g.dart';

/// A whole catalog, as rows: what one sync writes.
class CatalogRows {
  const CatalogRows({
    this.roadmaps = const [],
    this.sections = const [],
    this.topics = const [],
    this.resources = const [],
    this.challenges = const [],
  });

  final List<RoadmapsCompanion> roadmaps;
  final List<RoadmapSectionsCompanion> sections;
  final List<TopicsCompanion> topics;
  final List<ResourcesCompanion> resources;
  final List<ChallengesCompanion> challenges;
}

/// How many rows of each kind a sync added (not counting updates).
typedef CatalogAdditions = ({
  int roadmaps,
  int topics,
  int resources,
  int challenges,
});

/// The ids the catalog holds, to check references against.
typedef CatalogIds = ({
  Set<String> topics,
  Set<String> resources,
  Set<String> challenges,
});

/// Reads and writes the catalog: roadmaps, sections, topics, resources,
/// challenges.
@DriftAccessor(
  tables: [
    Roadmaps,
    RoadmapSections,
    Topics,
    Resources,
    Challenges,
    TopicProgress,
  ],
)
class CatalogDao extends DatabaseAccessor<AppDatabase> with _$CatalogDaoMixin {
  CatalogDao(super.attachedDatabase);

  /// Writes [rows] in **one transaction**: new rows are inserted, existing
  /// ones (by id) are updated in place, and nothing else is touched.
  ///
  /// The upsert is `INSERT … ON CONFLICT(id) DO UPDATE`, never
  /// `INSERT OR REPLACE`. In SQLite, `REPLACE` deletes the old row before
  /// inserting the new one, and that delete would cascade to the user's
  /// progress, bookmarks and notes on the topic: a sync would wipe them
  /// (ConnectHub hit the same trap with its cache). A test pins it.
  Future<CatalogAdditions> upsertCatalog(CatalogRows rows) {
    return transaction(() async {
      final before = (
        roadmaps: await _idsOf(roadmaps, roadmaps.id),
        topics: await _idsOf(topics, topics.id),
        resources: await _idsOf(resources, resources.id),
        challenges: await _idsOf(challenges, challenges.id),
      );
      await batch((batch) {
        // Parents first: the foreign keys are checked row by row.
        batch
          ..insertAllOnConflictUpdate(roadmaps, rows.roadmaps)
          ..insertAllOnConflictUpdate(roadmapSections, rows.sections)
          ..insertAllOnConflictUpdate(topics, rows.topics)
          ..insertAllOnConflictUpdate(resources, rows.resources)
          ..insertAllOnConflictUpdate(challenges, rows.challenges);
      });

      int added(List<String> incoming, Set<String> existing) =>
          incoming.where((id) => !existing.contains(id)).length;
      return (
        roadmaps: added([
          for (final r in rows.roadmaps) r.id.value,
        ], before.roadmaps),
        topics: added([for (final t in rows.topics) t.id.value], before.topics),
        resources: added([
          for (final r in rows.resources) r.id.value,
        ], before.resources),
        challenges: added([
          for (final c in rows.challenges) c.id.value,
        ], before.challenges),
      );
    });
  }

  /// Every roadmap, in the catalog's order, with its completed and total
  /// topic counts, kept live.
  ///
  /// ```sql
  /// SELECT roadmaps.*, COUNT(topic_progress.topic_id), COUNT(topics.id)
  /// FROM roadmaps
  /// LEFT JOIN topics ON topics.roadmap_id = roadmaps.id
  /// LEFT JOIN topic_progress ON topic_progress.topic_id = topics.id
  /// GROUP BY roadmaps.id ORDER BY roadmaps.sort_order
  /// ```
  ///
  /// `LEFT JOIN`s, so a roadmap with nothing completed (or no topics yet)
  /// still appears, with zeros.
  Stream<List<(RoadmapRow, int completed, int total)>> watchRoadmapProgress() {
    final completed = topicProgress.topicId.count();
    final total = topics.id.count();
    final query =
        select(roadmaps).join([
            leftOuterJoin(topics, topics.roadmapId.equalsExp(roadmaps.id)),
            leftOuterJoin(
              topicProgress,
              topicProgress.topicId.equalsExp(topics.id),
            ),
          ])
          ..addColumns([completed, total])
          ..groupBy([roadmaps.id])
          ..orderBy([OrderingTerm.asc(roadmaps.sortOrder)]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          (
            row.readTable(roadmaps),
            row.read(completed) ?? 0,
            row.read(total) ?? 0,
          ),
      ],
    );
  }

  /// The catalog's ids, to check the demo progress's references against.
  Future<CatalogIds> ids() async => (
    topics: await _idsOf(topics, topics.id),
    resources: await _idsOf(resources, resources.id),
    challenges: await _idsOf(challenges, challenges.id),
  );

  Future<Set<String>> _idsOf(
    TableInfo<Table, Object?> table,
    GeneratedColumn<String> id,
  ) async {
    final query = selectOnly(table)..addColumns([id]);
    return (await query.map((row) => row.read(id)!).get()).toSet();
  }
}
