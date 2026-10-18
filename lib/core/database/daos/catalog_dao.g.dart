// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'catalog_dao.dart';

// ignore_for_file: type=lint
mixin _$CatalogDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $ResourcesTable get resources => attachedDatabase.resources;
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $TopicProgressTable get topicProgress => attachedDatabase.topicProgress;
  CatalogDaoManager get managers => CatalogDaoManager(this);
}

class CatalogDaoManager {
  final _$CatalogDaoMixin _db;
  CatalogDaoManager(this._db);
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
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db.attachedDatabase, _db.topicProgress);
}
