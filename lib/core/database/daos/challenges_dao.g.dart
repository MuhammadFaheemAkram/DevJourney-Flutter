// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'challenges_dao.dart';

// ignore_for_file: type=lint
mixin _$ChallengesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChallengesTable get challenges => attachedDatabase.challenges;
  $ChallengeStatesTable get challengeStates => attachedDatabase.challengeStates;
  ChallengesDaoManager get managers => ChallengesDaoManager(this);
}

class ChallengesDaoManager {
  final _$ChallengesDaoMixin _db;
  ChallengesDaoManager(this._db);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db.attachedDatabase, _db.challenges);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(
        _db.attachedDatabase,
        _db.challengeStates,
      );
}
