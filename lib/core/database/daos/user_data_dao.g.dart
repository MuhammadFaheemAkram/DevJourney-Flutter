// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_data_dao.dart';

// ignore_for_file: type=lint
mixin _$UserDataDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $TopicProgressTable get topicProgress => attachedDatabase.topicProgress;
  $TopicBookmarksTable get topicBookmarks => attachedDatabase.topicBookmarks;
  $ResourcesTable get resources => attachedDatabase.resources;
  $ResourceBookmarksTable get resourceBookmarks =>
      attachedDatabase.resourceBookmarks;
  $NotesTable get notes => attachedDatabase.notes;
  $GoalsTable get goals => attachedDatabase.goals;
  $GoalCheckInsTable get goalCheckIns => attachedDatabase.goalCheckIns;
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $ChallengeStatesTable get challengeStates => attachedDatabase.challengeStates;
  UserDataDaoManager get managers => UserDataDaoManager(this);
}

class UserDataDaoManager {
  final _$UserDataDaoMixin _db;
  UserDataDaoManager(this._db);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db.attachedDatabase, _db.roadmaps);
  $$RoadmapSectionsTableTableManager get roadmapSections =>
      $$RoadmapSectionsTableTableManager(
        _db.attachedDatabase,
        _db.roadmapSections,
      );
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db.attachedDatabase, _db.topics);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db.attachedDatabase, _db.topicProgress);
  $$TopicBookmarksTableTableManager get topicBookmarks =>
      $$TopicBookmarksTableTableManager(
        _db.attachedDatabase,
        _db.topicBookmarks,
      );
  $$ResourcesTableTableManager get resources =>
      $$ResourcesTableTableManager(_db.attachedDatabase, _db.resources);
  $$ResourceBookmarksTableTableManager get resourceBookmarks =>
      $$ResourceBookmarksTableTableManager(
        _db.attachedDatabase,
        _db.resourceBookmarks,
      );
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db.attachedDatabase, _db.notes);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db.attachedDatabase, _db.goalCheckIns);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(
        _db.attachedDatabase,
        _db.challengeStates,
      );
}
