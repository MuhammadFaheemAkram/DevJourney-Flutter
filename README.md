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
| 2 | Data models, drift store, the fake learning API and the catalog; Welcome | ⏳ Next |
| 3 | Roadmaps, the learning path, topics and the Dashboard | |
| 4 | Notes (Markdown) and goals | |
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
| Lints / CI | `flutter_lints` + strict analyzer modes; GitHub Actions | 1 |
| Testing | `flutter_test` | 1 |

Planned: `flutter_bloc`, `freezed`, `drift` (with FTS5), `shared_preferences`, `clock` (Phase 2); `bloc_concurrency`, `stream_transform`, `intl` (Phase 3); a Markdown renderer (Phase 4); `url_launcher` (Phase 5); `fl_chart`, `flutter_local_notifications`, `dynamic_color`, `package_info_plus` (Phase 6).

---

## 🏛️ Architecture

A clean, layered architecture with a one-directional data flow:

```
lib/
├── app/        → root widget (MaterialApp.router, themes)
├── core/       → design system, navigation, (later) the fake API, database, storage, platform services
├── data/       → repository implementations + mappers          (Phase 2)
├── domain/     → models, pure calculations, contracts, use cases (Phase 2)
├── features/   → one folder per screen (Page + View + Cubit/Bloc)
└── di/         → composition root (get_it + injectable)
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
│   │   ├── design_system/          # theme/ (AppTheme, AppColors, tokens), widgets/ (state views, SectionHeader), large_text
│   │   └── navigation/             # app_routes (+ .g.dart), app_router, onboarding_redirect, fallback Close button
│   ├── features/                   # welcome, shell (tabs + drawer), dashboard, roadmaps, roadmap_detail, topic_detail,
│   │                               # notes, note_editor, goals, challenges, challenge_detail, resources, search,
│   │                               # analytics, settings, about
│   └── di/                         # injection.dart (+ .config.dart)
└── test/                           # mirrors lib/, plus app/ (the accessibility tour) and helpers/
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

---

## ✅ Testing

```bash
fvm flutter analyze
fvm dart format --output=none --set-exit-if-changed .
fvm flutter test
```

**104 tests** after Phase 1:
- **Navigation:** every rule of the onboarding gate; typed locations; the app on its real DI graph (first launch, each tab, the drawer over every tab, each drawer screen and Back, Search from the app bars, the note editor as a full-screen dialog, deep links with a Close button, an unknown location).
- **Design system:** the themes, any `ColorScheme` driving them (for dynamic color later), and WCAG AA contrast of every learning color (completed, streak, the three difficulties) on the page, cards and filled fields in both themes.
- **The drawer:** its order, the selected tab, where each item leads.
- **The accessibility tour:** every screen, and the drawer, in light and dark at 200 % text: no overflow, tap targets ≥ 48 × 48, labels, contrast. The tab labels keep their size at 300 % (a long press shows them).

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
| DI | Hilt | `AppEnvironment` | `get_it` + `injectable` |

---

## 📚 Documentation

- [Phase 1 — Foundation](docs/PHASE_1_SUMMARY.md)

---

## 🗺️ Roadmap

The phases above. Ideas after them are collected in `docs/ROADMAP.md` in Phase 7.

---

## 📄 License

[MIT](LICENSE) © 2026 BitFuse
