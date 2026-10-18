// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'resources_dao.dart';

// ignore_for_file: type=lint
mixin _$ResourcesDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $ResourcesTable get resources => attachedDatabase.resources;
  $ResourceBookmarksTable get resourceBookmarks =>
      attachedDatabase.resourceBookmarks;
  ResourcesDaoManager get managers => ResourcesDaoManager(this);
}

class ResourcesDaoManager {
  final _$ResourcesDaoMixin _db;
  ResourcesDaoManager(this._db);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db.attachedDatabase, _db.roadmaps);
  $$RoadmapSectionsTableTableManager get roadmapSections =>
      $$RoadmapSectionsTableTableManager(
        _db.attachedDatabase,
        _db.roadmapSections,
      );
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db.attachedDatabase, _db.topics);
  $$ResourcesTableTableManager get resources =>
      $$ResourcesTableTableManager(_db.attachedDatabase, _db.resources);
  $$ResourceBookmarksTableTableManager get resourceBookmarks =>
      $$ResourceBookmarksTableTableManager(
        _db.attachedDatabase,
        _db.resourceBookmarks,
      );
}
