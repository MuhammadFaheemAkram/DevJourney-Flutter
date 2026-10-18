import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:drift/drift.dart';

part 'resources_dao.g.dart';

/// A resource with whether the user saved it and the title of its topic.
typedef ResourceJoinRow = (ResourceRow, bool bookmarked, String? topicTitle);

/// Resources (catalog) and the user's bookmarks on them.
@DriftAccessor(tables: [Resources, ResourceBookmarks, Topics])
class ResourcesDao extends DatabaseAccessor<AppDatabase>
    with _$ResourcesDaoMixin {
  ResourcesDao(super.attachedDatabase);

  /// Resources in catalog order; [topicId] narrows to one topic's.
  Stream<List<ResourceJoinRow>> watchResources({String? topicId}) {
    final query = select(resources).join([
      leftOuterJoin(
        resourceBookmarks,
        resourceBookmarks.resourceId.equalsExp(resources.id),
      ),
      leftOuterJoin(topics, topics.id.equalsExp(resources.topicId)),
    ])..orderBy([OrderingTerm.asc(resources.sortOrder)]);
    if (topicId != null) query.where(resources.topicId.equals(topicId));
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          (
            row.readTable(resources),
            row.readTableOrNull(resourceBookmarks) != null,
            row.readTableOrNull(topics)?.title,
          ),
      ],
    );
  }

  Future<ResourceRow?> findById(String id) =>
      (select(resources)..where((r) => r.id.equals(id))).getSingleOrNull();

  /// Saves or unsaves [resourceId]; saving twice keeps the first time.
  Future<void> setBookmarked(
    String resourceId, {
    required bool bookmarked,
    required DateTime at,
  }) async {
    if (bookmarked) {
      await into(resourceBookmarks).insert(
        ResourceBookmarksCompanion.insert(
          resourceId: resourceId,
          createdAt: at,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    } else {
      await (delete(
        resourceBookmarks,
      )..where((b) => b.resourceId.equals(resourceId))).go();
    }
  }
}
