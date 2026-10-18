import 'package:dev_journey/core/database/app_database.steps.dart';
import 'package:dev_journey/core/database/converters.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/challenges_dao.dart';
import 'package:dev_journey/core/database/daos/goals_dao.dart';
import 'package:dev_journey/core/database/daos/learning_dao.dart';
import 'package:dev_journey/core/database/daos/notes_dao.dart';
import 'package:dev_journey/core/database/daos/resources_dao.dart';
import 'package:dev_journey/core/database/daos/search_dao.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// The app's SQLite database, in two halves:
///
/// - **the catalog** (roadmaps, sections, topics, resources, challenges): a
///   local copy of what the learning API serves, refreshed by a sync;
/// - **the user's data** (completions, bookmarks, notes, goals, check-ins,
///   challenge state): the source of truth, which no sync ever writes.
///
/// Screens watch both and join them. Every figure (progress, streaks, goal
/// progress) is calculated from these rows when it is read.
///
/// This file and the rest of `core/database/` never import `material_ui` or
/// the JSON packages: drift exports `Table`, `Column` and `JsonKey`, and
/// those names would clash (conventions §11.1).
@DriftDatabase(
  tables: [
    Roadmaps,
    RoadmapSections,
    Topics,
    Resources,
    Challenges,
    TopicProgress,
    TopicBookmarks,
    ResourceBookmarks,
    Notes,
    Goals,
    GoalCheckIns,
    ChallengeStates,
  ],
  include: {'search.drift'},
  daos: [
    CatalogDao,
    LearningDao,
    NotesDao,
    GoalsDao,
    ChallengesDao,
    ResourcesDao,
    SearchDao,
    UserDataDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Opens `dev_journey.sqlite` in the app's documents directory. Tests pass
  /// an in-memory [executor] instead.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'dev_journey'));

  /// Each phase is treated as a release: a phase that changes the schema
  /// bumps this, exports the new version (`drift_dev make-migrations`) and
  /// ships a tested migration.
  ///
  /// 1. Phase 2: the catalog and the user's tables.
  /// 2. Phase 5: the FTS5 search index and its triggers (`search.drift`).
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // A fresh install creates the latest schema directly (`createAll`), and
    // the first catalog sync fills the index through the triggers. An update
    // walks one version at a time: `stepByStep` comes from the generated
    // `app_database.steps.dart`, and each step sees the schema as it was at
    // that version.
    onUpgrade: stepByStep(
      from1To2: (m, schema) async {
        await m.create(schema.searchIndex);
        for (final trigger in schema.entities.whereType<Trigger>()) {
          await m.create(trigger);
        }
        // The triggers only see future writes: index what's already here.
        for (final statement in _fillSearchIndexV2) {
          await customStatement(statement);
        }
      },
    ),
    // SQLite ships with foreign keys *off*, per connection. Without this
    // pragma, every REFERENCES and CASCADE would be ignored.
    beforeOpen: (details) => customStatement('PRAGMA foreign_keys = ON'),
  );

  /// Indexes the rows a v1 database already holds, with the same columns
  /// the v2 triggers write (`search.drift`). Frozen at v2: a later version
  /// changing the triggers adds its own step.
  static const _fillSearchIndexV2 = [
    'INSERT INTO search_index (kind, ref_id, title, body) '
        "SELECT 'roadmap', id, title, description FROM roadmaps",
    'INSERT INTO search_index (kind, ref_id, title, body) '
        "SELECT 'topic', id, title, description || ' ' || "
        "(SELECT group_concat(value, '. ') FROM json_each(objectives)) "
        'FROM topics',
    'INSERT INTO search_index (kind, ref_id, title, body) '
        "SELECT 'note', id, title, content FROM notes",
    'INSERT INTO search_index (kind, ref_id, title, body) '
        "SELECT 'resource', id, title, source FROM resources",
    'INSERT INTO search_index (kind, ref_id, title, body) '
        "SELECT 'challenge', id, title, prompt FROM challenges",
  ];
}
