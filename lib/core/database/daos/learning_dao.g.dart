// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'learning_dao.dart';

// ignore_for_file: type=lint
mixin _$LearningDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $TopicProgressTable get topicProgress => attachedDatabase.topicProgress;
  $TopicBookmarksTable get topicBookmarks => attachedDatabase.topicBookmarks;
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $ChallengeStatesTable get challengeStates => attachedDatabase.challengeStates;
  $GoalsTable get goals => attachedDatabase.goals;
  $GoalCheckInsTable get goalCheckIns => attachedDatabase.goalCheckIns;
  LearningDaoManager get managers => LearningDaoManager(this);
}

class LearningDaoManager {
  final _$LearningDaoMixin _db;
  LearningDaoManager(this._db);
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
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(
        _db.attachedDatabase,
        _db.challengeStates,
      );
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db.attachedDatabase, _db.goalCheckIns);
}
