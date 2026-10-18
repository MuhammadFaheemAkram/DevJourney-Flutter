import 'package:dev_journey/core/database/converters.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
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
  daos: [CatalogDao, UserDataDao],
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
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // SQLite ships with foreign keys *off*, per connection. Without this
    // pragma, every REFERENCES and CASCADE would be ignored.
    beforeOpen: (details) => customStatement('PRAGMA foreign_keys = ON'),
  );
}
