// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'goals_dao.dart';

// ignore_for_file: type=lint
mixin _$GoalsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GoalsTable get goals => attachedDatabase.goals;
  $GoalCheckInsTable get goalCheckIns => attachedDatabase.goalCheckIns;
  $RoadmapsTable get roadmaps => attachedDatabase.roadmaps;
  $RoadmapSectionsTable get roadmapSections => attachedDatabase.roadmapSections;
  $TopicsTable get topics => attachedDatabase.topics;
  $TopicProgressTable get topicProgress => attachedDatabase.topicProgress;
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $ChallengeStatesTable get challengeStates => attachedDatabase.challengeStates;
  GoalsDaoManager get managers => GoalsDaoManager(this);
}

class GoalsDaoManager {
  final _$GoalsDaoMixin _db;
  GoalsDaoManager(this._db);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db.attachedDatabase, _db.goals);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db.attachedDatabase, _db.goalCheckIns);
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
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(
        _db.attachedDatabase,
        _db.challengeStates,
      );
}
