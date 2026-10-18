# Learning Notes

Every Flutter / Dart concept DevJourney uses, grouped by topic, each pointing to where it lives in the code. The phase write-ups ([1](PHASE_1_SUMMARY.md) · [2](PHASE_2_SUMMARY.md) · [3](PHASE_3_SUMMARY.md) · [4](PHASE_4_SUMMARY.md) · [5](PHASE_5_SUMMARY.md) · [6](PHASE_6_SUMMARY.md) · [7](PHASE_7_SUMMARY.md)) explain the *why* in more depth.

---

## 1. Toolchain and project setup

| Concept | Where | Notes |
|---|---|---|
| FVM per-project pinning | `.fvmrc` | The Flutter version (3.47.6) is part of the repo. Run everything as `fvm flutter …`. |
| `material_ui` package | every UI file | Material as a standalone package: import `package:material_ui/material_ui.dart`; `cupertino_ui` for the iOS alert actions and time wheel. |
| Strict analysis | `analysis_options.yaml` | `strict-casts`, `strict-inference`, `strict-raw-types`; generated files stay in scope, with lint headers from `build.yaml`. |
| Code generation | `build.yaml`, `*.g.dart`, `*.freezed.dart`, `*.config.dart`, `app_routes.g.dart` | `build_runner` output is committed; CI fails if it is stale. |
| drift options | `build.yaml` | ISO-8601 text dates, `sqlite_modules: [fts5, json1]`, and the `make-migrations` folders. |
| Schema exports | `drift_schemas/`, `app_database.steps.dart` | `drift_dev make-migrations` exports every version and generates typed steps and tests. |
| Assets | `assets/json/` | The fake API's catalog v1 and v2 and the demo progress, read through the injected `AssetBundle`. |
| Native setup | `android/app/build.gradle.kts`, `AndroidManifest.xml`, `ios/Runner/AppDelegate.swift` | Desugaring, notification permissions and receivers, `<queries>` for https, the iOS notification delegate. |

## 2. Dart language

- **Extension types:** `CalendarDate`, an `int` `yyyymmdd` with a private representation constructor, so every value goes through a validating factory. Zero runtime cost, a real compile-time type.
- **Sealed classes + exhaustive `switch`:** `Result`, `AppException`, `DrawerDestination`, `NoteEditorExit` (`NoteSaved` / `NoteDiscarded` / `NoteDeleted`), `GoalEditorResult`, the `SearchEvent`s.
- **Primary constructors (Dart 3.13):** `final class const Ok<T>(final T value) extends Result<T>;` (`core/common/result.dart`).
- **Patterns:** `if (result case Err(:final exception))`, `switch (result) { Err(exception: NotificationsDeniedException()) => true, _ => false }`, `for (final (note, topicTitle) in rows)`, `when` guards in switch cases.
- **Records:** joined rows (`(ChallengeRow, ChallengeStateRow?)`, `typedef SearchRow = ({String kind, String refId, …})`), highlight ranges (`(int start, int end)`), several streams combined into named records.
- **Class modifiers:** `final class`, `abstract final class` (namespaces such as `AppTheme`, `DateLabels`), `abstract interface class` (every repository and service contract).
- **Null-aware elements:** `children: [ …, ?action ]` (`SectionHeader`).
- **`characters`:** length limits count grapheme clusters, so "👩‍💻" is one character.
- **Unicode-aware regular expressions:** `RegExp(r'[\p{L}\p{N}]', unicode: true)` in `ftsQuery`.

## 3. Architecture

- **Layers:** View → Cubit/Bloc → UseCase → Repository → drift, with `domain/` pure Dart. See [ARCHITECTURE.md](ARCHITECTURE.md).
- **Catalog vs user state:** the API's content and the user's data live in separate tables; a sync upserts the first and never writes the second.
- **Derived, never stored:** progress, the path, streaks, goals and analytics are SQL aggregates plus pure functions. See [LEARNING_ENGINE.md](LEARNING_ENGINE.md).
- **Services as interfaces:** `LinkOpener`, `ReminderScheduler`, `DynamicColorSource`, `DeveloperTools` in `domain/service/`, implemented in `core/platform` and `core/network`.
- **Validation as pure functions** shared by the forms (the error under a field) and the use cases (which refuse what slips past).

## 4. State management (flutter_bloc)

| Concept | Where |
|---|---|
| Cubits subscribing to use-case streams | every `features/*/cubit/` (`load()` subscribes, `close()` cancels) |
| A Bloc with an event transformer | `SearchBloc` + `debounceRestartable` (`switchMap` to a delayed event, then `restartable()`) |
| `emit.forEach` for live results, cancelled by restart | `SearchBloc._onQueryChanged` |
| An app-wide Cubit above the router | `SettingsCubit` in `DevJourneyApp` |
| `@factoryParam` ids | `TopicDetailCubit`, `NoteEditorCubit` (two params), `ChallengeDetailCubit` |
| One-time effects as message + serial | `BlocListener(listenWhen: serial changed)` throughout |
| Debounced autosave with a flush on close | `ChallengeDetailCubit` (`Timer`, `close()` saves what's pending) |
| Optimistic removal for `Dismissible` | `NotesCubit.delete` |
| `MockCubit` / `MockBloc` in view tests | `test/features/*_view_test.dart` |

## 5. Dependency injection (get_it + injectable)

- **Annotations** (`@injectable`, `@LazySingleton(as: Interface)`) and a generated composition root (`di/injection.config.dart`).
- **`@module`** for third-party objects (`AppModule`): the database and DAOs, the `Clock`.
- **`@preResolve`**: preferences, `AppInfo` and `DeviceColors` are awaited before `runApp`, so the first frame already knows where to open, the version and the colors.
- **`@ignoreParam`**: tunable values with defaults (the network latency, the search debounce, the notes delay).
- **Swapping registrations in tests** (`configureTestDependencies`): unregister, then register a fake.

## 6. Navigation (go_router + go_router_builder)

- **Typed routes** (`@TypedGoRoute`), with a query parameter from a constructor field (`NewNoteRoute.topicId`).
- **`StatefulShellRoute.indexedStack`**: five tabs that keep their stacks.
- **A pure redirect** re-run by a `refreshListenable` over the settings stream (`StreamListenable`).
- **Root-level routes above the shell**, full-screen dialogs (`MaterialPage(fullscreenDialog: true)`), and a Close fallback for deep links.
- **`push<T>` results:** the note editor pops with the deleted note; `openNoteEditor` offers Undo wherever it was opened from.
- **A drawer over nested Scaffolds** through an `InheritedWidget` (`ShellDrawerScope`).

## 7. UI, Material 3 and accessibility

| Concept | Where |
|---|---|
| Themes from a seed or any `ColorScheme`; a `ThemeExtension` for app colors | `AppTheme`, `AppColors` |
| Dynamic color from the wallpaper (Android 12+) | `MaterialYouColorSource`, `AppTheme.fromWallpaper` |
| Adaptive widgets | `AlertDialog.adaptive` + `CupertinoDialogAction`, `SwitchListTile.adaptive`, `RefreshIndicator.adaptive`, `CircularProgressIndicator.adaptive`, Material vs Cupertino time pickers |
| `CustomPainter` | the learning path's line, the activity heatmap |
| Charts | `fl_chart` bars with counts and `ChartAxisLabel` (capped at 150 %) |
| Rich text | `HighlightedTextView` (search matches), `NoteMarkdown` (`flutter_markdown_plus` with an explicit style sheet) |
| Sheets and dialogs | `showAppSheet` (root navigator, keyboard padding), `showConfirmDialog` |
| `PopScope` discard guard | `NoteEditorView` |
| `AutomaticKeepAliveClientMixin` | the editor's Edit tab |
| The large-text rule | `context.prefersStackedLayout`: stacked layouts, chips or radio lists for segments, one-column cards |
| Semantics | `MergeSemantics` + `Semantics(button:)` rows, written chart summaries, headers, never color alone |
| Tab labels that keep their size | `MediaQuery.withNoTextScaling` in `MainShell` |

## 8. Data and persistence

- **drift tables, DAOs, joins and aggregates:** `LEFT JOIN … GROUP BY`, one ordered join folded into a tree (`pathFromRows`), `UNION` / `UNION ALL` through `customSelect(readsFrom:)`.
- **Constraints:** foreign keys (`CASCADE`, `SET NULL`), `CHECK`s, composite indexes; `PRAGMA foreign_keys = ON`.
- **Upserts and idempotency:** `insertOnConflictUpdate` (never `REPLACE`), `InsertMode.insertOrIgnore`, `toCompanion(false)` to write nulls.
- **`DELETE … RETURNING`** for Undo (`goAndReturn`).
- **Escaped `LIKE`** with `escapeChar`.
- **FTS5:** a virtual table in a `.drift` file, triggers, `MATCH`, `bm25`, `highlight()`, `snippet()`, `json_each`.
- **Migrations:** `stepByStep`, exported schemas, `SchemaVerifier`.
- **`SharedPreferencesWithCache`** with an allow-list, read before `runApp`.

## 9. Time, scheduling and the platform

- **`CalendarDate` and an injected `Clock`:** days in the user's calendar, "today" fixed in tests.
- **ISO weeks** by arithmetic (`today.addDays(1 - weekday)`).
- **Zoned notifications:** `timezone` + `flutter_timezone`, `zonedSchedule` with `DateTimeComponents.time`, inexact on Android.
- **Permission flows:** ask on enable (Android 13+, iOS), explain and link to system settings (`app_settings`) when denied, recheck on resume.
- **`AppLifecycleListener`:** reschedule the reminder on resume.
- **In-app browsing:** `url_launcher` with `LaunchMode.inAppBrowserView`; Android `<queries>` for https.

## 10. Testing

- **A real data stack** (`DataStack`) on an in-memory database, instead of mocks, for Cubits and use cases.
- **The real app** (`pumpDevJourney`) on the real DI graph, with a few swaps.
- **`bloc_test`, `mocktail`, `fake_async`** (the debounce's timing), real time for switching.
- **An accessibility tour** with `meetsGuideline` at 200 % text, light and dark.
- **Migration tests** generated by drift plus data tests.
- **Mutation checks:** break the code on purpose, see a test fail, restore it. See [TESTING.md](TESTING.md).

## 11. Tooling and repo hygiene

- **Conventional Commits**, one commit per phase, each with a write-up.
- **CI** on GitHub Actions: generated code up to date, format, analyze, test, on the FVM-pinned Flutter.
- **The open-source set:** CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, CHANGELOG, issue and PR templates.
