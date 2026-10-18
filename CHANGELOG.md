# Changelog

All notable changes to this project are documented here. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project follows [Conventional Commits](https://www.conventionalcommits.org/).

## [Unreleased]

_All seven build phases are complete. See [`docs/ROADMAP.md`](docs/ROADMAP.md) for what's next._

## [0.7.0] — 2026-10-18 — Phase 7: Documentation & CI

### Added
- **Docs:** ARCHITECTURE, DATA_MODEL, LEARNING_ENGINE, API_SIMULATION, TESTING (tests per area and a mutation-check table), LEARNING_NOTES, INTERVIEW_NOTES, ROADMAP, and SCREENSHOTS with 16 screenshots (light, dark, AX3 large text on iOS, and dynamic color on Android); the Phase 7 summary.
- **Open-source files:** CONTRIBUTING, CODE_OF_CONDUCT, SECURITY, this CHANGELOG, and the GitHub issue and PR templates.
- **A mutation check** of six more key behaviours (the sync's upsert, idempotent completion, the streak rule, FTS5 quoting, https-only links, reset progress), each caught by the tests.

### Changed
- The README is final: features, a short test summary linking to TESTING, screenshots, and the full "same app on other platforms" table.
- The Android build file's template TODOs are now notes that say what the settings are.

## [0.6.0] — 2026-10-18 — Phase 6: Analytics, Settings + Reminders

### Added
- **Analytics:** streak, totals and goals-met cards; weekly and monthly `fl_chart` bars with counts; completion per roadmap; a 26-week activity heatmap (`CustomPainter`); written chart summaries.
- **Goal completion rate** over 30 days: ended periods count, the current one only once met, nothing before a goal existed.
- **Settings:** System / Light / Dark from an app-wide `SettingsCubit` above the router; dynamic color from the wallpaper on Android 12+; sync with the catalog version; reset progress (one transaction, notes and goals kept); developer switches including "Publish a catalog update" (`catalog_v2.json`); About with the version and the editions.
- **A daily reminder:** one repeating zoned notification (`flutter_local_notifications`) behind a `ReminderScheduler` interface, platform time pickers, permission flows with a link to the system's settings, rescheduled at launch and on resume. Verified arriving on the iOS simulator and an Android 16 emulator.
- Android desugaring, notification permissions and receivers; the iOS notification delegate.
- 61 tests (531 in total).

### Fixed
- App-level tests hung when dependency setup called a plugin: the test setup now answers that channel (conventions §11.58).

## [0.5.0] — 2026-10-18 — Phase 5: Challenges, Resources + Search

### Added
- **drift v2:** an FTS5 search index (`search.drift`) kept current by 15 triggers, with a `stepByStep` migration that indexes existing rows, and migration tests.
- **Search:** `SearchBloc` (debounced, restartable), grouped and highlighted results ranked by `bm25`, the last five searches.
- **Challenges** (level and status filters; hints one at a time; solution notes saved after a pause and on leave), **Resources** (search, types, Saved, bookmarks), links in the in-app browser (https only); recent challenges on the Dashboard and resources on Topic detail.
- 118 tests (470 in total).

### Fixed
- drift silently dropped two triggers that called `replace()`; they use `json_each` now (conventions §11.56).
- A challenge moved back from Done kept its day: the upsert now writes every column (conventions §11.57).

## [0.4.0] — 2026-10-18 — Phase 4: Notes + Goals

### Added
- **Notes:** search (escaped `LIKE`), Markdown editor with Edit / Preview, a topic picker, a discard guard, delete with Undo (the same note back).
- **Goals:** daily, weekly (ISO) and monthly; counted from completions or by check-ins capped at the target; progress derived per window.
- Goals and recent notes on the Dashboard; notes on Topic detail.
- 101 tests (352 in total).

### Fixed
- The Markdown preview drew dark text in dark mode: the renderer gets an explicit style sheet from the app's theme (conventions §11.55).

## [0.3.0] — 2026-10-18 — Phase 3: Roadmaps + Topics

### Added
- Roadmaps with search, filters and pull-to-refresh sync; the learning path (a painted path, expandable sections, section completion); topic detail with complete and bookmark; the Dashboard with the streak, the active roadmap and what's next.
- An adaptive confirmation dialog (an iOS alert on iOS).
- 80 tests (251 in total).

## [0.2.0] — 2026-10-18 — Phase 2: Data Layer

### Added
- drift v1: the catalog tables and the user's tables, foreign keys, `CHECK`s and indexes; the exported schema.
- The fake learning API (bundled JSON, 700 ms, a failure switch), a validated mapper, the catalog sync as one upsert transaction, and demo progress with relative dates.
- Welcome: fetch, pick a roadmap, or explore with demo progress; the saved onboarding flag.
- 67 tests (171 in total).

## [0.1.0] — 2026-10-18 — Phase 1: Foundation

### Added
- The FVM-pinned project, strict lints, CI, the MIT license.
- The design system base (themes from an indigo seed, contrast-tested learning colors, state views), typed routes with an onboarding gate, five tabs plus a navigation drawer, placeholder screens, and an accessibility tour.
- 104 tests.
