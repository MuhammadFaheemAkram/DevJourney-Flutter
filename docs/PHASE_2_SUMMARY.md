# Phase 2 — Data Layer

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 2, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 2 gives DevJourney its data, in two halves that must never be confused:
- **the catalog** (roadmaps, sections, topics, resources, challenges): content a server publishes, fetched from a fake learning API, kept in drift, and refreshed by a **sync**;
- **the user's data** (completions, bookmarks, notes, goals, check-ins, challenge state): created on the device, the source of truth, and **never written by a sync**.

It also makes Welcome real: fetch the catalog (with failure and retry), pick a roadmap, and start fresh or with demo progress.

---

## 🧱 What Was Implemented

- **Domain:**
  - `CalendarDate` (shared with SpendWise): the day something happened, from the local clock;
  - the catalog's vocabularies (`RoadmapCategory`, `Difficulty`, `ResourceType`, `ChallengeCategory`, `ChallengeStatus`, `GoalKind`, `GoalPeriod`), stored by name;
  - freezed `Roadmap`, `RoadmapSection`, `Topic`, `Resource`, `Challenge`; `RoadmapProgress` (completed and total topics, a derived ratio); `SyncResult`; `AppSettings` (onboarded, active roadmap, catalog version);
  - contracts `CatalogRepository`, `RoadmapRepository`, `SettingsRepository`; use cases `SyncCatalog`, `WatchRoadmaps`, `StartLearning`, `StartWithDemoProgress`.
- **drift v1:**
  - catalog tables with `sort_order` and `CASCADE` between parents and children; topics keep their roadmap's id beside their section's, so progress per roadmap is one `GROUP BY`;
  - user tables keyed by catalog ids (`topic_progress` has one row per completed topic; `goal_check_ins` allows several a day; `notes.topic_id` is `SET NULL`);
  - `CHECK` constraints (positive durations, goal targets 1–50), indexes, the foreign-keys pragma, list and `Uri` converters, and the schema exported with `make-migrations`;
  - `CatalogDao.upsertCatalog` (one transaction, `ON CONFLICT DO UPDATE`, reports what was new) and `watchRoadmapProgress` (two `LEFT JOIN`s and a `GROUP BY`); `UserDataDao.replaceAll` (one transaction).
- **The fake learning API:** `LearningService` with `fetchCatalog` and `fetchDemoProgress`; `FakeLearningService` reads `assets/json/catalog_v1.json` and `demo_progress.json` after 700 ms through a `NetworkSimulator` that can fail.
- **The content:** 4 roadmaps (Flutter Developer, Backend Developer, AI Engineer, System Design), 14 sections, 32 topics with descriptions and objectives, 35 resources linking to real public documentation, 12 challenges with prompts and hints; demo progress over three weeks (10 completions, 2 bookmarked topics and resources, 3 Markdown notes, 4 goals with check-ins, 2 challenges).
- **Mappers** that flatten the API's nested JSON into rows and check everything before writing; the demo progress resolves `daysAgo` against today.
- **Repositories:** `CatalogRepositoryImpl` (sync and demo progress, every failure as an `AppException`), `RoadmapRepositoryImpl`, `SettingsRepositoryImpl` on `SharedPreferencesWithCache` (loaded before `runApp`).
- **Welcome:** `WelcomeCubit` (loading, failed with Try again, ready), a roadmap picker (`RadioGroup` of cards: "Mobile · 12 topics"), **Start learning** and **Explore with demo progress**, each with a spinner while it runs and an error SnackBar if the demo fails. Neither navigates: the router follows the saved onboarded flag.
- **Tests:** 171 in total (67 new).

### Differences from the plan

- **Domain models for notes, goals and challenge state wait for their screens** (Phases 4–5). Their *tables* are here, because the demo progress writes them and the schema should be whole from v1.
- **`catalog_v2.json` waits for Phase 6,** with the developer switch that publishes it; the sync already reports what's new.
- **The demo follows the roadmap picked on Welcome,** so "explore" and "start" differ only in the progress.
- **35 resources rather than about 30,** with every topic covered.

---

## 💙 Flutter / Dart Concepts Demonstrated

- **Upsert without collateral damage:** `batch.insertAllOnConflictUpdate` writes `INSERT … ON CONFLICT(id) DO UPDATE`. SQLite's `INSERT OR REPLACE` would delete the old row first, and the foreign keys' `CASCADE` would delete the user's progress with it.
- **Aggregates that keep zeros:** `LEFT JOIN topics … LEFT JOIN topic_progress … GROUP BY roadmaps.id` with `COUNT(topics.id)` and `COUNT(topic_progress.topic_id)`: `COUNT` of a column ignores `NULL`s, so missing rows count as zero.
- **Type converters:** `StringListConverter` (a JSON array in one column, for lists always read whole), `UriConverter`, `CalendarDateConverter`.
- **`json_serializable` with `checked: true`:** a missing field or wrong type names the field, and unknown enum names fail the same way.
- **Validating before writing:** mappers throw a `FormatException` for broken data, and the repository turns it into `DataFormatException`, so a sync either lands whole or not at all.
- **Records for small results:** `typedef CatalogAdditions = ({int roadmaps, int topics, int resources, int challenges})`, compared with `==` in tests.
- **`@preResolve`:** preferences are loaded before `runApp`, so the router reads the onboarded flag synchronously on the first frame.
- **`RadioGroup`:** owns the selection for its `RadioListTile`s.
- **Testing with the real stack:** `DataStack` wires the real repositories to an in-memory database and the real fake service (zero latency, reading the bundled JSON through `rootBundle`).

---

## 🔁 Data Flow (this phase)

```
First launch
WelcomeCubit.load ─▶ SyncCatalogUseCase ─▶ CatalogRepository.sync
  FakeLearningService.fetchCatalog (700 ms, may fail) ─▶ CatalogDto (nested)
  ─▶ toRows (flatten + validate) ─▶ CatalogDao.upsertCatalog (one transaction, ON CONFLICT DO UPDATE)
  ─▶ SyncResult ─▶ settings.catalogVersion
  ─▶ WatchRoadmapsUseCase (firstValue) ─▶ ready: pick a roadmap
"Start learning"            ─▶ settings: activeRoadmapId, then onboarded
"Explore with demo progress" ─▶ fetchDemoProgress ─▶ toUserRows(now, catalog ids) ─▶ UserDataDao.replaceAll
                             ─▶ then the same two settings
onboarded ─▶ StreamListenable ─▶ router redirect ─▶ /dashboard
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `lib/core/database/tables/{catalog,user}_tables.dart` | The two halves of the schema. |
| `lib/core/database/daos/{catalog,user_data}_dao.dart` | The upsert sync, roadmap progress, the demo write. |
| `lib/core/database/app_database.dart`, `converters.dart`, `drift_schemas/` | The database, converters, schema v1. |
| `lib/core/network/{learning_service,fake_learning_service,network_simulator,asset_json_loader}.dart`, `dto/` | The fake API. |
| `assets/json/{catalog_v1,demo_progress}.json` | The API's responses. |
| `lib/data/mapper/{catalog,demo_progress}_mappers.dart` | JSON → rows, validated. |
| `lib/data/repository/*` | Catalog, roadmaps, settings. |
| `lib/domain/model/*`, `repository/*`, `usecase/*` | The domain. |
| `lib/features/welcome/**` | Welcome and its Cubit. |
| `test/helpers/{data_stack,test_dependencies,database,catalog_fixtures}.dart` | The test stack. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `CalendarDate` | extension type | A day, from the local clock | `domain/model` |
| `Roadmap`, `RoadmapSection`, `Topic`, `Resource`, `Challenge` | freezed | The catalog | `domain/model` |
| `RoadmapProgress`, `SyncResult` | freezed | Derived progress; what a sync added | `domain/model` |
| `CatalogRepository` / `RoadmapRepository` | interfaces | Sync and demo; roadmaps with progress | `domain/repository` |
| `CatalogDao`, `UserDataDao` | drift DAOs | The two halves' bulk writes and reads | `core/database/daos` |
| `LearningService`, `FakeLearningService` | interface / fake | The API | `core/network` |
| `CatalogRows`, `UserRows` | classes | What one bulk write holds | beside their DAOs |
| `WelcomeCubit` / `WelcomeState` | Cubit / freezed | First launch | `features/welcome` |

---

## 🌱 Folder Structure Changes

- **New:** `lib/core/{common,database,network,storage}`, `lib/data/{mapper,repository}`, `lib/domain/{model,repository,usecase}`, `lib/features/welcome/cubit`, `lib/di/app_module.dart`, `assets/json/`, `drift_schemas/`, `test/{core,data,domain,features,drift}`.
- **Removed:** the temporary `PlaceholderOnboarding`.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Storage | Room entities: roadmap, topic, progress, note, goal, challenge, resource, bookmark | SwiftData `@Model`s | drift, in two halves: catalog tables and user tables |
| Progress | `ProgressEntity`; `completionPercentage` on the roadmap model | `completionPercentage` on the roadmap | one completion row per topic (with its day); percentages derived by SQL |
| Sections | implied by Roadmap Detail | `sectionTitle` on each topic | a `roadmap_sections` table, ordered |
| Settings | DataStore: dark mode, dynamic color, reminder, selected roadmap, first launch | `@AppStorage` | `SharedPreferencesWithCache`: onboarded, active roadmap, catalog version (the rest in Phase 6) |
| Fake API | a fake API layer; "sync through fake API simulation" | `LearningService.seed()` fills SwiftData on first launch / reset | `LearningService` + an upsert sync that keeps user data; demo progress with relative dates |
| Pipeline | DTO → Entity → Domain → UI | DTO / `@Model` / domain with mappers | DTO → rows (validated) → drift → domain → state |
| First launch | a first-launch flag | seed on first launch | Welcome: fetch (retry), pick a roadmap, fresh or demo |
| Tests | Room tests, Turbine flows | SwiftData store tests | DAOs, mappers, the bundled JSON, repositories, the Cubit, app flows |

Both native specs store a completion percentage on the roadmap. The Flutter edition stores what happened (which topic, which day) and derives the percentage, so a new topic from a sync lowers it as it should, and the dates can drive streaks later.

---

## 🎤 Interview Notes

**Q: Why split catalog tables from user tables?**
A: They have different owners. The catalog belongs to the server and can be replaced by a sync at any time; the user's data belongs to the user and must survive every sync. Keeping user state in its own tables, keyed by stable catalog ids, means a sync can upsert the catalog freely and never needs to merge user fields.

**Q: What's wrong with `INSERT OR REPLACE` for a sync?**
A: In SQLite, `REPLACE` resolves a conflict by deleting the existing row and inserting a new one. That delete fires the foreign keys: with `ON DELETE CASCADE` from `topic_progress` to `topics`, re-syncing a topic would silently delete its completion. `INSERT … ON CONFLICT DO UPDATE` updates the row in place. A test syncs twice with progress and a note in between, and checks both survive.

**Q: Why store the day of a completion as a `yyyymmdd` integer?**
A: A streak is about the user's days. Taking the day from the local clock when it happens fixes it for good; deriving it later from a UTC timestamp would move it when the phone changes time zone.

**Q: How do you keep a bad catalog from half-writing?**
A: Two layers. The mapper validates the whole catalog before any write (unique ids, references, URLs) and throws on the first problem. The write itself is one transaction, so even a database error rolls back.

---

## 📝 Learning Checklist

- ✅ Model a catalog and user state separately, keyed by stable ids
- ✅ Upsert with `ON CONFLICT DO UPDATE` (and know why not `REPLACE`)
- ✅ Count with `LEFT JOIN … GROUP BY` without losing empty groups
- ✅ Decode nested JSON with checked DTOs, then flatten and validate
- ✅ Resolve relative demo dates against an injected clock
- ✅ Load preferences before the first frame and gate the router on them
- ✅ Test with the real repositories on an in-memory database
- ⬜ Roadmaps, the learning path, topics and the Dashboard (Phase 3)

---

## 🚀 Future Improvements

- **Phase 3:** the Roadmaps tab (search, filters, pull-to-refresh sync), the learning path, topics (complete, bookmark) and the Dashboard.
- **Phase 5:** FTS5 search over the catalog and notes (drift v2).
- **Phase 6:** a second catalog version to sync, and resetting progress.
