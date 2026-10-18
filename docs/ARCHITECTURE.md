# Architecture

DevJourney is a layered, offline-first app with a one-directional data flow. The database is the source of truth: screens watch it, and every figure (progress, streaks, goals, analytics) is derived when it's read.

```
lib/
├── main.dart     → binding → configureDependencies() (awaits @preResolve values) → runApp
├── app/          → DevJourneyApp: the app-wide SettingsCubit, themes, the router, the reminder refresh
├── core/
│   ├── common/        Result, AppException (sealed), guardWrite, firstValue, IdGenerator
│   ├── database/      AppDatabase (drift v2), tables/, daos/, search.drift (FTS5 + triggers), converters
│   ├── design_system/ theme/, formatting/, widgets/, the large-text rule
│   ├── navigation/    typed routes, the router, onboardingRedirect, the Close fallback
│   ├── network/       LearningService, FakeLearningService, NetworkSimulator, CatalogPublisher, dto/
│   ├── platform/      UrlLauncherLinkOpener, LocalNotificationsReminderScheduler, MaterialYouColorSource
│   └── storage/       SettingsLocalDataSource (SharedPreferencesWithCache)
├── data/         → repository implementations + mappers (rows ↔ models, DTOs → rows)
├── domain/       → models, pure calculations, repository contracts, service interfaces, use cases (pure Dart)
├── features/     → one folder per screen: Page + View (+ cubit/ or bloc/, widgets/)
└── di/           → injection.dart (+ .config.dart), app_module.dart
```

```
View ─intent─▶ Cubit/Bloc ─▶ UseCase ─▶ Repository ─▶ drift ◀── watch() streams ── Cubit ─▶ state ─▶ View
                                    └─▶ Service (notifications, links, wallpaper colors)
FakeLearningService ─▶ CatalogRepository.sync() ─▶ catalog tables (one upsert transaction) ─▶ triggers ─▶ search_index
```

## Layers and their rules

| Layer | May import | Never imports |
|---|---|---|
| `domain/` | Dart, `freezed_annotation`, `injectable`, `clock`, `characters`, `stream_transform` | Flutter, drift, `data/`, `core/` (except `core/common`) |
| `data/` | `domain/`, `core/database`, `core/network`, `core/storage` | `features/`, `material_ui` |
| `core/database/` | drift | `material_ui`, JSON packages (name clashes, conventions §11.1) |
| `features/` | `domain/`, `core/design_system`, `core/navigation`, `di/` (Pages only) | `data/`, drift |
| `core/platform/` | plugins, `domain/service` | everything else |

- **Pages and Views:** a Page creates and provides its Cubit (`getIt<…>()`), a View renders state and forwards intents. View tests mock the Cubit; Cubit tests use the real data stack.
- **One use case per user action** (`SetTopicCompleted`, `CheckInGoal`, `OpenLink`, `ResetProgress`…). They hold the rules that aren't SQL: validation, "a met goal takes no check-ins", "https only", "denied permission keeps the reminder off".
- **Pure calculations** live in `domain/calculation/`: `recommendedTopic`, `learningStreak`, `goalWindow`, `goalProgress`, `goalCompletionRate`, the chart series, `ftsQuery`, `plainTextPreview`, the validation rules, `nextReminder`. They are tested without Flutter or a database.

## Who owns what

| Data | Owner | Written by |
|---|---|---|
| roadmaps, sections, topics, resources, challenges | the (fake) learning API | `CatalogDao.upsertCatalog` only, during a sync |
| completions, bookmarks, notes, goals, check-ins, challenge work | the user | their repositories; never a sync |
| the search index | derived | the triggers in `search.drift` only |
| onboarded, active roadmap, catalog version, appearance, reminder, recent searches | the device | `SettingsRepository`, `RecentSearchesRepository` |
| the network failure and catalog update switches | developer tools | `DeveloperTools` (in memory, off at launch) |

## State management

- **Cubits by default:** one per screen (`DashboardCubit`, `RoadmapDetailCubit`, `NotesCubit`, `NoteEditorCubit`, `GoalsCubit`, `ChallengesCubit`, `ChallengeDetailCubit`, `ResourcesCubit`, `AnalyticsCubit`, `SettingsToolsCubit`, …). Each subscribes to use-case streams in `load()` and cancels them in `close()`.
- **One Bloc:** `SearchBloc`, because typing is a stream of events that needs a transformer (`debounceRestartable`: a 300 ms debounce, then `restartable`, which cancels the previous query's live results).
- **One app-wide Cubit:** `SettingsCubit` above `MaterialApp.router` (theme mode, dynamic color). Every other Cubit belongs to its screen.
- **State is immutable:** freezed classes with a status enum, or sealed results (`NoteEditorExit`, `GoalEditorResult`), rendered with exhaustive `switch`es.
- **One-time effects** (SnackBars) are a message plus a serial number in the state, so the same text twice still shows twice; `BlocListener` with `listenWhen` on the serial.
- **`@factoryParam`** passes ids to Cubits: `getIt<NoteEditorCubit>(param1: noteId, param2: topicId)`.

## Error handling

- **Writes return a `Result`** (`Ok` / `Err`) and never throw. `guardWrite` wraps each repository write and turns drift and SQLite errors into an `AppException`.
- **`AppException` is sealed:** `NetworkException`, `DataFormatException`, `NotFoundException`, `InvalidInputException`, `GoalAlreadyMetException`, `AutomaticGoalException`, `UnsafeLinkException`, `LinkOpenFailedException`, `NotificationsDeniedException`, `UnknownException`. Each has a message written for the user.
- **Streams that fail** move their screen to a failure state with a message (`ErrorView`).
- **Content is validated before it's written:** the catalog and demo mappers check ids, titles, durations, URLs and references, and refuse the whole payload ("The learning content looks damaged") rather than storing half of it.

## Writes

- **Atomic:** a sync, loading the demo, completing a section and resetting progress each run in one drift transaction.
- **Idempotent where it matters:** completing a topic is `INSERT OR IGNORE` (the first day stays); bookmarking twice is one bookmark.
- **Upsert, never `REPLACE`:** `REPLACE` deletes the old row first, and the delete would cascade to the user's progress (conventions §11.53).
- **Undo restores the same row:** `DELETE … RETURNING` hands the note back, and Undo inserts it with its id and times.
- **Optimistic only where the frame demands it:** a swiped note leaves the list in the same frame (a dismissed `Dismissible` can't stay in the tree), and comes back if the delete fails.

## Navigation

- **Typed `go_router` routes** (`go_router_builder`): a `StatefulShellRoute.indexedStack` with five tabs, and root-level routes for details and drawer screens, pushed above the tab bar.
- **A pure gate:** `onboardingRedirect(onboarded, location)`, re-run through a `refreshListenable` over the settings stream.
- **A drawer above nested Scaffolds:** it belongs to the shell's outer `Scaffold`; `ShellDrawerScope` lets each tab's app bar open it.
- **Full-screen dialogs** for the note editor; **sheets** for goals, the topic picker and the iOS time wheel (`showAppSheet`, on the root navigator).
- **Deep links** work everywhere: a screen opened by a link has a Close button that `go`es to a sensible home (conventions §11.47).

## Dependency injection

- **`get_it` + `injectable`:** classes are annotated (`@injectable`, `@LazySingleton(as: …)`), and `build_runner` generates the composition root.
- **`AppModule`** provides third-party objects: the database and its DAOs, the `Clock`, and three `@preResolve` values awaited before `runApp`: `SharedPreferencesWithCache` (the router knows where to open), `AppInfo` (`package_info_plus`) and `DeviceColors` (the wallpaper's color, so the first frame is already in it).
- **Tests swap a few registrations** (`configureTestDependencies`): an in-memory database, a zero-latency network, a fixed clock, a recording link opener, a fake reminder scheduler, and a mocked dynamic color channel.

## Persistence

- **drift (SQLite)** for the catalog, the user's data and the FTS5 index; foreign keys on; dates as `CalendarDate` (`yyyymmdd` integers) and UTC ISO text. Schema v2, with every version exported to `drift_schemas/` and tested migrations. See [DATA_MODEL.md](DATA_MODEL.md).
- **`SharedPreferencesWithCache`** for small device-owned values, with an allow-list of keys.

## Platform services

All behind `domain/service` interfaces, implemented in `core/platform`:

| Interface | Implementation | Platforms |
|---|---|---|
| `LinkOpener` | `url_launcher`, `LaunchMode.inAppBrowserView` | Custom Tabs (Android), SFSafariViewController (iOS) |
| `ReminderScheduler` | `flutter_local_notifications` + `timezone` + `flutter_timezone`; `app_settings` | both, with each platform's permission flow |
| `DynamicColorSource` | `dynamic_color` (the palette only) | Android 12+; `null` elsewhere |
| `DeveloperTools` | `NetworkSimulator` + `CatalogPublisher` | both (the fake API) |

## Accessibility

- **Every screen is in the accessibility tour** (light and dark, 200 % text): no overflow, tap targets ≥ 48 × 48, every tappable labelled, WCAG AA text contrast.
- **The large-text rule:** above 130 % (`context.prefersStackedLayout`), side-by-side layouts stack, segmented buttons become chips or radio lists, and analytics cards go to one column.
- **Never color alone:** difficulty has an icon, challenge status an icon and a word, met goals a word, search matches bold text.
- **Charts are written out:** each chart and the heatmap carry a summary for screen readers; axis labels stop growing at 150 %.
- **Tab labels keep their size** (a long press shows them), as iOS tab bars do.

## Key decisions

| Decision | Why |
|---|---|
| Catalog tables apart from user tables, keyed by stable catalog ids | A sync can update content without ever touching progress |
| Nothing derived is stored | Progress, streaks, goals and analytics can't disagree with the rows they come from |
| `CalendarDate` for days, an injected `Clock` for "today" | Streaks and goal periods follow the user's calendar; tests pin the date |
| FTS5 with triggers | Ranked prefix search with snippets; no write path can forget the index |
| `SearchBloc` as the only Bloc | Debounce + restartable is a transformer; everything else is a Cubit |
| Android-first UI, adaptive on iOS | The Android edition is Material 3 already; iOS gets its alerts, switches, time wheel and in-app browser |
| Plugins behind interfaces | Use cases and Cubits are tested with fakes; plugins are checked on devices |
| `material_ui` instead of `flutter/material.dart` | Material as a versioned package; third-party widgets get their styles explicitly (§11.55) |
