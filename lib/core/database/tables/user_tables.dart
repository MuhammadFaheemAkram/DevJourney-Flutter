// drift reads a column getter's *definition* at build time and never calls
// it. A getter naming itself inside `check(...)` is drift's documented way to
// write a CHECK constraint on that column, not a recursion.
// ignore_for_file: recursive_getters

import 'package:dev_journey/core/database/converters.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:drift/drift.dart';

// The user's own data: everything they did, keyed by catalog ids. A catalog
// sync never writes here.
//
// Days (`completed_on`, `day`) are `CalendarDate`s taken from the local
// clock when the action happened: a streak counts the user's days, not
// UTC's. Instants (`*_at`) are UTC text (conventions §11.14), for ordering.
//
// Nothing here stores a count or a percentage: progress, streaks and goal
// progress are derived from these rows when they are read.

/// A completed topic: one row per topic, so completing twice is a no-op and
/// uncompleting is a delete.
@DataClassName('TopicProgressRow')
@TableIndex(name: 'topic_progress_by_day', columns: {#completedOn})
class TopicProgress extends Table {
  TextColumn get topicId =>
      text().references(Topics, #id, onDelete: KeyAction.cascade)();

  IntColumn get completedOn => integer().map(const CalendarDateConverter())();

  DateTimeColumn get completedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {topicId};
}

@DataClassName('TopicBookmarkRow')
class TopicBookmarks extends Table {
  TextColumn get topicId =>
      text().references(Topics, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {topicId};
}

@DataClassName('ResourceBookmarkRow')
class ResourceBookmarks extends Table {
  TextColumn get resourceId =>
      text().references(Resources, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {resourceId};
}

/// A Markdown note, optionally about a topic. `SET NULL`: the note is the
/// user's, and stays if its topic ever goes.
@DataClassName('NoteRow')
@TableIndex(name: 'notes_by_update', columns: {#updatedAt})
class Notes extends Table {
  TextColumn get id => text()();

  TextColumn get topicId =>
      text().nullable().references(Topics, #id, onDelete: KeyAction.setNull)();

  TextColumn get title => text()();

  TextColumn get content => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// A learning goal. Its progress is never stored: it is counted for the
/// current period from completions (topics, challenges) or check-ins.
@DataClassName('GoalRow')
class Goals extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get kind => textEnum<GoalKind>()();

  TextColumn get period => textEnum<GoalPeriod>()();

  IntColumn get target => integer().check(target.isBetweenValues(1, 50))();

  IntColumn get createdOn => integer().map(const CalendarDateConverter())();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// One manual check-in on a custom goal. Several a day are fine (a target
/// of three a day).
@DataClassName('GoalCheckInRow')
@TableIndex(name: 'check_ins_by_goal_day', columns: {#goalId, #day})
class GoalCheckIns extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get goalId =>
      text().references(Goals, #id, onDelete: KeyAction.cascade)();

  IntColumn get day => integer().map(const CalendarDateConverter())();

  DateTimeColumn get createdAt => dateTime()();
}

/// Where the user is with a challenge. No row means "to do".
@DataClassName('ChallengeStateRow')
@TableIndex(name: 'challenge_states_by_day', columns: {#completedOn})
class ChallengeStates extends Table {
  TextColumn get challengeId =>
      text().references(Challenges, #id, onDelete: KeyAction.cascade)();

  TextColumn get status => textEnum<ChallengeStatus>()();

  TextColumn get solutionNotes => text().withDefault(const Constant(''))();

  DateTimeColumn get startedAt => dateTime().nullable()();

  IntColumn get completedOn =>
      integer().nullable().map(const CalendarDateConverter())();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {challengeId};
}
