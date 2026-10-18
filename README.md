# 🧭 DevJourney (Flutter)

[![Flutter CI](https://github.com/MuhammadFaheemAkram/DevJourney-Flutter/actions/workflows/flutter-ci.yml/badge.svg)](https://github.com/MuhammadFaheemAkram/DevJourney-Flutter/actions/workflows/flutter-ci.yml)
![Flutter 3.47.6](https://img.shields.io/badge/Flutter-3.47.6-02569B?logo=flutter)
![Dart 3.13](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

A learning-focused, production-inspired **Flutter** app for developers who are learning: follow **roadmaps** broken into sections and topics, track **progress and streaks**, keep **notes**, set **goals**, work through **coding challenges**, save **resources**, **search** everything and read your **analytics**. It is built with **Flutter 3.47**, **Dart 3.13** and a clean, layered architecture, and runs on **Android and iOS**.

DevJourney is **offline-first**: a fake learning API delivers the catalog (roadmaps, topics, resources, challenges), the app keeps it in a local database, and everything you do (completions, notes, goals, bookmarks) stays on the device. There is **no API key and no server**.

> **Why this repo exists**
>
> It is the Flutter edition of an app that also exists natively for [Android](https://github.com/MuhammadFaheemAkram/DevJourney) and [iOS](https://github.com/MuhammadFaheemAkram/iDevJourney). This edition follows the **Android** one closely (its Jetpack Compose UI is already Material 3) and adapts to iOS where the platform has its own conventions. It focuses on:
> - a **synced catalog** kept apart from **user-owned state**, so a sync never loses progress;
> - **progress, streaks and goals derived** from completion dates, never stored;
> - **full-text search** with SQLite FTS5, behind a debounced, restartable Bloc;
> - **platform integration:** daily reminders, dynamic color on Android 12+, in-app browsing, adaptive widgets;
> - typed `go_router` navigation with a tab bar *and* a navigation drawer, code-generated DI, and a test suite that includes an accessibility tour.
>
> Each phase ships with a beginner-to-intermediate friendly write-up in [`docs/`](docs/) that also shows how the Android and iOS editions approached the same feature.

---

## 📋 Project Status

DevJourney is built in **strict, reviewable phases**. Each phase ends with:
- a building app (Android + iOS);
- a clean analyzer and passing tests;
- a summary doc;
- exactly one commit.

| Phase | Scope | Status |
|------:|-------|:------:|
| 1 | Foundation: FVM project, design system base, typed routes with an onboarding gate, 5-tab shell with a navigation drawer, CI | ✅ Done |
| 2 | Data models, drift store, the fake learning API and the catalog; Welcome | ✅ Done |
| 3 | Roadmaps, the learning path, topics and the Dashboard | ✅ Done |
| 4 | Notes (Markdown) and goals | ⏳ Next |
| 5 | Challenges, resources and global search (FTS5) | |
| 6 | Analytics, settings and daily reminders | |
| 7 | Open-source polish and final docs | |

---

## ✨ Features (the plan)

- 🚀 **First launch:** fetch the catalog, pick a roadmap, or explore with demo progress
- 📊 **Dashboard:** your streak, the active roadmap and its progress, today's goals, the next topic to learn, recent notes and challenges
- 🗺️ **Roadmaps:** progress per roadmap, search and category filters, pull to refresh syncs the catalog
- 🧱 **Learning path:** sections and topics on a path, expand and collapse, complete a whole section
- 📖 **Topics:** objectives, difficulty, estimated time, resources and notes; complete and bookmark
- 📝 **Notes:** Markdown, attached to topics, searchable, delete with Undo
- 🎯 **Goals:** daily, weekly and monthly, counted from your completions or by check-ins
- 🧩 **Challenges:** difficulty and status filters, hints, solution notes
- 📚 **Resources:** articles, videos, docs and courses; bookmarks; opened in an in-app browser
- 🔎 **Search:** everything at once, ranked, with the matches highlighted
- 📈 **Analytics:** streaks, weekly and monthly progress, completion per roadmap, an activity heatmap
- ⚙️ **Settings:** appearance, dynamic color (Android 12+), a daily reminder at your time, reset progress
- ♿ **Accessible:** dark mode and large text on every screen, labelled controls, checked by a test tour that grows with the app

---

## 🧰 Tech Stack

Packages arrive in the phase that first needs them.

| Area | Choice | Since |
|------|--------|:-----:|
| Toolchain | Flutter 3.47.6 · Dart 3.13, pinned per project with [FVM](https://fvm.app) (`.fvmrc`) | 1 |
| Platforms | Android · iOS 15+ | 1 |
| UI | [`material_ui`](https://pub.dev/packages/material_ui): Material 3 as a standalone package; adaptive widgets on iOS where it matters | 1 |
| Navigation | `go_router` + `go_router_builder` (typed routes, `StatefulShellRoute`, an onboarding `redirect`) | 1 |
| Dependency injection | `get_it` + `injectable` (a code-generated composition root) | 1 |
| State management | `flutter_bloc`: Cubits (and, in Phase 5, one Bloc for search) | 2 |
| Models | `freezed` (domain models, states) + `json_serializable` (the API's DTOs, `checked: true`) | 2 |
| Database | `drift` + `drift_flutter` (SQLite): the catalog and the user's data, with foreign keys, `CHECK` constraints, indexes and exported schema versions | 2 |
| Preferences | `shared_preferences` (`SharedPreferencesWithCache`, loaded before `runApp`) | 2 |
| Time | `clock` (an injected `Clock`: "today" decides streaks, goal periods and demo dates); `intl` (`DateFormat`) | 2–3 |
| Streams | `stream_transform` (`switchMap` to follow the active roadmap, `combineLatest` for the Dashboard) | 3 |
| Adaptive UI | `cupertino_ui` (iOS alerts through `AlertDialog.adaptive`), `RefreshIndicator.adaptive` | 3 |
| Lints / CI | `flutter_lints` + strict analyzer modes; GitHub Actions | 1 |
| Testing | `flutter_test`, `bloc_test`, `mocktail` | 1+ |

Planned: FTS5 search and `bloc_concurrency` (Phase 5); a Markdown renderer (Phase 4); `url_launcher` (Phase 5); `fl_chart`, `flutter_local_notifications`, `dynamic_color`, `package_info_plus` (Phase 6).

---

## 🏛️ Architecture

A clean, layered architecture with a one-directional data flow:

```
lib/
├── app/        → root widget (MaterialApp.router, themes)
├── core/       → design system, navigation, the fake learning API, database, storage, (later) platform services
├── data/       → repository implementations + mappers
├── domain/     → models, pure calculations (recommendation, streaks), contracts, use cases (pure Dart)
├── features/   → one folder per screen (Page + View + Cubit/Bloc)
└── di/         → composition root (get_it + injectable)
```

**Data flow:**

```
View ─intent─▶ Cubit ─▶ UseCase ─▶ Repository ─▶ drift ◀── watch() streams ── Cubit ─▶ state ─▶ View
FakeLearningService (bundled JSON, 700 ms) ─▶ CatalogRepository.sync() ─▶ drift catalog tables (one upsert transaction)
                                             CatalogRepository.loadDemoProgress() ─▶ drift user tables (one transaction)
```

**Navigation:**

```
GoRouter ── redirect: onboardingRedirect(onboarded, location)   ◀── refreshListenable
  │
  ├─ /welcome          (until the user has started)
  │
  ├─ tab shell         StatefulShellRoute ── MainShell (NavigationBar + navigation drawer)
  │                      /dashboard · /roadmaps · /challenges · /analytics · /settings
  │
  └─ root-level        /roadmaps/:roadmapId, /topics/:topicId, /challenges/:challengeId,
     screens           /notes (+ /new, /:noteId), /goals, /resources, /search, /about
                       → pushed above the tab bar
```

Key rules:
- **The router owns the gate.** No screen navigates after Welcome's choice: it records the choice, and `refreshListenable` re-runs the pure `onboardingRedirect`.
- **Typed routes only:** no string paths in widgets.
- **Tabs and a drawer, as in the Android edition.** The five tabs are a `NavigationBar`; Notes, Goals, Resources, Search and About live in a drawer that slides over the whole screen. Every tab's app bar opens it, and the Dashboard and Roadmaps also have a Search button (one tap on iOS, where drawers are less expected).
- **Screens above the tabs** are pushed on the root navigator, so Back, and the iOS edge swipe, return to the tab with its state intact. Links work: `/topics/flutter-streams` opens the topic with a Close button.
- **Widgets render state; logic lives elsewhere.** Each screen is a Page plus a View.
- **Layer boundaries:** `domain/` is pure Dart, Views never import `data/`, and only `data/` touches the database.

**Who owns what:**

| Data | Source of truth |
|---|---|
| roadmaps, sections, topics, resources, challenges (the catalog) | the fake learning API; cached in drift, refreshed by a sync |
| completions, bookmarks, notes, goals, check-ins, challenge state | drift, on the device (no sync ever writes them) |
| onboarded, the active roadmap, the catalog version | `SharedPreferencesWithCache` |

---

## 🗂️ Folder Structure

```
DevJourney/
├── .fvmrc                          # pinned Flutter version (3.47.6)
├── .github/workflows/flutter-ci.yml
├── analysis_options.yaml           # lints + strict analyzer modes
├── build.yaml                      # lint-free generated files
├── lib/
│   ├── main.dart                   # binding → configureDependencies() → runApp
│   ├── app/                        # DevJourneyApp: themes and the router
│   ├── core/
│   │   ├── design_system/          # theme/ (AppTheme, AppColors, tokens), formatting/ (labels, dates), widgets/ (RoadmapCard,
│   │                               #   TopicRow, DifficultyChip, ProgressRing, StreakBanner, FilterChipGroup, AppSearchField,
│   │                               #   an adaptive confirm dialog, state views), large_text
│   │   ├── navigation/             # app_routes (+ .g.dart), app_router, onboarding_redirect, stream_listenable, Close fallback
│   │   ├── network/                # LearningService + FakeLearningService, NetworkSimulator, dto/, asset_json_loader
│   │   ├── storage/                # settings_local_data_source (SharedPreferencesWithCache)
│   │   ├── database/               # app_database (drift v1), converters, tables/ (catalog, user), daos/ (catalog, learning, user data)
│   │   └── common/                 # Result, AppException, guardWrite, firstValue, IdGenerator
│   ├── data/                       # mapper/ (the API's catalog → rows, the demo progress → rows), repository/
│   ├── domain/                     # model/ (CalendarDate, the catalog, learning paths, streaks, the Dashboard, AppSettings),
│   │                               #   calculation/ (recommendation, streak), repository/, usecase/
│   ├── features/                   # welcome, shell (tabs + drawer), dashboard, roadmaps, roadmap_detail, topic_detail,
│   │                               # notes, note_editor, goals, challenges, challenge_detail, resources, search,
│   │                               # analytics, settings, about
│   └── di/                         # injection.dart (+ .config.dart), app_module.dart
├── assets/json/                    # the fake API's responses: catalog_v1.json, demo_progress.json
├── drift_schemas/                  # every exported schema version (drift_dev make-migrations)
└── test/                           # mirrors lib/, plus app/ (flows, the accessibility tour) and helpers/
```

---

## ▶️ How to Run

Prerequisites:
- [FVM](https://fvm.app);
- Xcode, for iOS;
- the Android SDK, with Java 17+ (Android Studio's bundled JDK works).

```bash
fvm install            # installs the version pinned in .fvmrc (3.47.6)
fvm flutter pub get
fvm flutter run        # pick an Android emulator or an iOS simulator
```

Generated code (`*.g.dart`, `*.config.dart`) is committed, so the app runs straight after cloning. After changing annotated code, regenerate it:

```bash
fvm dart run build_runner build
```

On first launch the app fetches the learning catalog (four roadmaps, 32 topics, 35 resources, 12 challenges), then asks which roadmap to start with: **Start learning** fresh, or **Explore with demo progress** (completions, notes, goals and challenge status over the last three weeks). The choice is saved: the next launch opens on the Dashboard.

---

## 🌐 How the Fake API and Sync Work

There is no server. `FakeLearningService` is the app's only "remote" API:
- **Production-shaped:** an abstract `LearningService`, typed DTOs (`json_serializable`, `checked: true`) in the nested shape a real API would use (roadmaps → sections → topics), and `AppException`s, so a real client could replace the fake without changing any caller.
- **The network is simulated:** `NetworkSimulator` waits 700 ms and can fail every request, as if offline. Welcome shows the error, with **Try again**.
- **Checked before writing:** unique ids, non-blank titles, positive durations, `https` URLs, resources pointing at real topics. Broken content fails with "The learning content looks damaged" before anything is written.
- **The sync is an upsert, in one transaction:** new content is inserted, existing content updated in place by its stable id, and the user's tables are never touched. It uses `INSERT … ON CONFLICT DO UPDATE`, never `INSERT OR REPLACE`: SQLite's `REPLACE` deletes the old row first, and that delete would cascade to the user's progress and notes. A test pins it.
- **Demo progress has relative dates** (`daysAgo`), resolved against today when it loads, so the demo always shows a live streak.

## 💾 How Local Persistence Works

- **Schema v1:** the catalog (`roadmaps`, `roadmap_sections`, `topics`, `resources`, `challenges`) and the user's tables (`topic_progress`, `topic_bookmarks`, `resource_bookmarks`, `notes`, `goals`, `goal_check_ins`, `challenge_states`), keyed by catalog ids. Foreign keys are on (`PRAGMA foreign_keys = ON`), and the schema is exported to [`drift_schemas/`](drift_schemas/) from the first version.
- **Days are `CalendarDate`s** (`yyyymmdd` integers) taken from the local clock when the action happens, so a streak counts the user's days; instants are UTC text, for ordering.
- **Nothing derived is stored:** no percentage, count or streak column exists. Roadmap progress is a `LEFT JOIN … GROUP BY` over topics and completions, recomputed whenever either changes.
- **Preferences** live in `SharedPreferencesWithCache`, loaded before `runApp`, so the router knows at once whether to open Welcome or the Dashboard.

## 🧭 How Progress, the Path and Streaks Work

- **A learning path is one query:** the roadmap, its sections, their topics, and the user's completions and bookmarks, joined (`LEFT JOIN`s, ordered) and folded into a tree in Dart. Completing a topic re-runs it, so the checks, the section counts and the percentage always agree.
- **Completing is idempotent:** one row per topic (`INSERT OR IGNORE`), with the day it happened. Completing a section completes only its open topics, today; topics done earlier keep their days. Uncompleting deletes the rows.
- **What's next:** the first topic not yet completed, in section order, then topic order. A topic skipped earlier comes back first.
- **The streak:** a day counts if the user completed a topic or a challenge, or checked in on a goal (one `UNION` query). The current streak counts back from today, or from yesterday if today has no activity yet: it isn't broken until the day ends. One missed day breaks it. Days are calendar days, so month and year ends can't.
- **The Dashboard** follows the active roadmap with `switchMap` (choosing another swaps the query) and combines its path, the active days and the totals with `combineLatest`, so a completion anywhere updates it at once.
- **Platform touches:** the confirmation before completing a section is a Material dialog on Android and an iOS alert on iOS (`AlertDialog.adaptive`); pull to refresh uses each platform's spinner (`RefreshIndicator.adaptive`).

---

## ✅ Testing

```bash
fvm flutter analyze
fvm dart format --output=none --set-exit-if-changed .
fvm flutter test
```

**251 tests** after Phase 3:
- **Learning:** the streak (today or not yet, gaps, month, year and leap-day boundaries, duplicates, future days), the recommendation, path counts; the learning DAO (the path as a tree, idempotent completion, section completion keeping earlier days, bookmarks, active days as a union, totals); the Dashboard use case with the demo worked out by hand (a 6-day streak, 7 of 12, State management next) and after completing a topic.
- **Screens:** the Roadmaps, roadmap, topic and Dashboard Cubits on the real stack; their views with mocked Cubits; the design-system widgets, including the confirmation dialog on Android and iOS; app flows (Continue → complete → the Dashboard follows, completing a section after confirming, search and make a roadmap active, bookmarks).
- **Data:** the catalog mapper (flattening, sources, every validation rule), the demo progress mapper (relative dates, instants, every validation rule), the bundled JSON itself, the DAOs (upsert counts, updates in place, **user data surviving a re-sync**, progress counts with zeros, `CHECK`, `SET NULL`, rollback), the fake service, the repositories (sync, re-sync, demo progress, offline, malformed content), the settings, the start use cases.
- **Welcome:** the Cubit on the real data stack (load, failure and retry, the chosen roadmap, a double tap, a failed demo), the view with a mocked Cubit, and the real app's first launch (start learning, demo progress, offline and Try again).
- **Navigation:** every rule of the onboarding gate; typed locations; the app on its real DI graph (first launch, each tab, the drawer over every tab, each drawer screen and Back, Search from the app bars, the note editor as a full-screen dialog, deep links with a Close button, an unknown location).
- **Design system:** the themes, any `ColorScheme` driving them (for dynamic color later), and WCAG AA contrast of every learning color (completed, streak, the three difficulties) on the page, cards and filled fields in both themes.
- **The drawer:** its order, the selected tab, where each item leads.
- **The accessibility tour:** every screen with real progress (the Dashboard, Roadmaps, a learning path, a topic to learn and a completed one, the section confirmation), Welcome (ready and offline), and the drawer, in light and dark at 200 % text: no overflow, tap targets ≥ 48 × 48, labels, contrast. The tab labels keep their size at 300 % (a long press shows them).

CI (`.github/workflows/flutter-ci.yml`) runs on every push to `main` and every pull request. It installs the FVM-pinned Flutter, checks that the committed generated code is up to date, then runs format, analyze and test.

---

## 📱 Same App on Other Platforms

| Edition | Stack | Repo |
|---------|-------|------|
| Android | Kotlin · Jetpack Compose · Hilt · Room · DataStore · WorkManager | [MuhammadFaheemAkram/DevJourney](https://github.com/MuhammadFaheemAkram/DevJourney) |
| iOS | Swift 6 · SwiftUI · SwiftData · Swift Charts | [MuhammadFaheemAkram/iDevJourney](https://github.com/MuhammadFaheemAkram/iDevJourney) |
| **Flutter** | Dart · Flutter · Bloc · drift | this repo |

| Concept | Android | iOS | Flutter |
|---|---|---|---|
| UI | Jetpack Compose | SwiftUI | widgets + `material_ui` (adaptive where it matters) |
| Navigation | bottom bar + `ModalNavigationDrawer` | `TabView` + More | `StatefulShellRoute` + `NavigationBar` + a `Drawer` |
| Screen state | ViewModel + StateFlow | `@Observable` | Cubit / Bloc |
| Storage | Room + DataStore | SwiftData + `@AppStorage` | drift + `SharedPreferencesWithCache` |
| Fake API | fake API layer, "sync" | `LearningService` seeds SwiftData | `LearningService` + an upsert sync that never touches user data |
| DI | Hilt | `AppEnvironment` | `get_it` + `injectable` |

---

## 📚 Documentation

- [Phase 1 — Foundation](docs/PHASE_1_SUMMARY.md)
- [Phase 2 — Data Layer](docs/PHASE_2_SUMMARY.md)
- [Phase 3 — Roadmaps + Topics](docs/PHASE_3_SUMMARY.md)

---

## 🗺️ Roadmap

The phases above. Ideas after them are collected in `docs/ROADMAP.md` in Phase 7.

---

## 📄 License

[MIT](LICENSE) © 2026 BitFuse
