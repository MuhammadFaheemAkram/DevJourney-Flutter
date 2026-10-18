// drift reads a column getter's *definition* at build time and never calls
// it. A getter naming itself inside `check(...)` is drift's documented way to
// write a CHECK constraint on that column, not a recursion.
// ignore_for_file: recursive_getters

import 'package:dev_journey/core/database/converters.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:drift/drift.dart';

// The catalog: content the fake learning API delivers and a sync upserts.
// Every row has a stable id from the API ("flutter-streams"), so the user's
// own tables can point at it across syncs. `sort_order` keeps the API's
// order (a roadmap's sections, a section's topics).
//
// Inside the catalog, children go with their parent (`CASCADE`). A sync
// never deletes, though: it upserts (see `CatalogDao.upsertCatalog`).

@DataClassName('RoadmapRow')
class Roadmaps extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get category => textEnum<RoadmapCategory>()();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SectionRow')
@TableIndex(name: 'sections_by_roadmap', columns: {#roadmapId, #sortOrder})
class RoadmapSections extends Table {
  TextColumn get id => text()();

  TextColumn get roadmapId =>
      text().references(Roadmaps, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// A topic keeps its roadmap's id as well as its section's: progress per
/// roadmap is then one `GROUP BY` without a join through sections. The
/// mapper checks the two agree before anything is written.
@DataClassName('TopicRow')
@TableIndex(name: 'topics_by_section', columns: {#sectionId, #sortOrder})
@TableIndex(name: 'topics_by_roadmap', columns: {#roadmapId})
class Topics extends Table {
  TextColumn get id => text()();

  TextColumn get roadmapId =>
      text().references(Roadmaps, #id, onDelete: KeyAction.cascade)();

  TextColumn get sectionId =>
      text().references(RoadmapSections, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get objectives => text().map(const StringListConverter())();

  TextColumn get difficulty => textEnum<Difficulty>()();

  IntColumn get estimatedMinutes =>
      integer().check(estimatedMinutes.isBiggerThanValue(0))();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ResourceRow')
class Resources extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get type => textEnum<ResourceType>()();

  TextColumn get url => text().map(const UriConverter())();

  TextColumn get source => text()();

  IntColumn get estimatedMinutes =>
      integer().check(estimatedMinutes.isBiggerThanValue(0))();

  /// The topic it helps with. `SET NULL`: a resource outlives its topic.
  TextColumn get topicId =>
      text().nullable().references(Topics, #id, onDelete: KeyAction.setNull)();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ChallengeRow')
class Challenges extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get category => textEnum<ChallengeCategory>()();

  TextColumn get difficulty => textEnum<Difficulty>()();

  TextColumn get prompt => text()();

  TextColumn get hints => text().map(const StringListConverter())();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
