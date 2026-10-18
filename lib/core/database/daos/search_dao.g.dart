// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'search_dao.dart';

// ignore_for_file: type=lint
mixin _$SearchDaoMixin on DatabaseAccessor<AppDatabase> {
  SearchIndex get searchIndex => attachedDatabase.searchIndex;
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $NotesTable get notes => attachedDatabase.notes;
  $ResourcesTable get resources => attachedDatabase.resources;
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $TopicProgressTable get topicProgress => attachedDatabase.topicProgress;
  $TopicBookmarksTable get topicBookmarks => attachedDatabase.topicBookmarks;
  $ResourceBookmarksTable get resourceBookmarks =>
      attachedDatabase.resourceBookmarks;
  $GoalsTable get goals => attachedDatabase.goals;
  $GoalCheckInsTable get goalCheckIns => attachedDatabase.goalCheckIns;
  $ChallengeStatesTable get challengeStates => attachedDatabase.challengeStates;
  SearchDaoManager get managers => SearchDaoManager(this);
}

class SearchDaoManager {
  final _$SearchDaoMixin _db;
  SearchDaoManager(this._db);
  $SearchIndexTableManager get searchIndex =>
      $SearchIndexTableManager(_db.attachedDatabase, _db.searchIndex);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db.attachedDatabase, _db.roadmaps);
  $$RoadmapSectionsTableTableManager get roadmapSections =>
      $$RoadmapSectionsTableTableManager(
        _db.attachedDatabase,
        _db.roadmapSections,
      );
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db.attachedDatabase, _db.topics);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db.attachedDatabase, _db.notes);
  $$ResourcesTableTableManager get resources =>
      $$ResourcesTableTableManager(_db.attachedDatabase, _db.resources);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db.attachedDatabase, _db.topicProgress);
  $$TopicBookmarksTableTableManager get topicBookmarks =>
      $$TopicBookmarksTableTableManager(
        _db.attachedDatabase,
        _db.topicBookmarks,
      );
  $$ResourceBookmarksTableTableManager get resourceBookmarks =>
      $$ResourceBookmarksTableTableManager(
        _db.attachedDatabase,
        _db.resourceBookmarks,
      );
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db.attachedDatabase, _db.goalCheckIns);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(
        _db.attachedDatabase,
        _db.challengeStates,
      );
}
