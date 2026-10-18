# Testing

```bash
fvm flutter analyze                                   # no issues allowed
fvm dart format --output=none --set-exit-if-changed .
fvm flutter test                                      # 531 tests, about 30 s
```

CI (`.github/workflows/flutter-ci.yml`) runs the same commands on every push to `main` and every pull request. It also regenerates the code and fails if the committed files are stale.

## What is covered

| Area | Tests | Highlights |
|---|---:|---|
| Domain | 111 | the streak (today not yet active, gaps, month, year and leap-day boundaries, duplicates, future days), the recommendation, goal windows (ISO weeks across years, months, leap years) and progress, **the goal completion rate**, the chart series, **`ftsQuery` against every FTS5 special character**, the Markdown preview, grapheme-aware validation, the next reminder; the use cases on the real stack (the Dashboard and Analytics **worked out by hand**, check-ins capped at the target, **https-only links**, the reminder on / denied / off / rescheduled / revoked, reset, a catalog update) |
| Accessibility tour | 77 | every screen and key state, light and dark, at 200 % text: no overflow, tap targets ≥ 48 × 48, every tappable labelled, text contrast; the tab labels at 300 % |
| Cubits and the Bloc | 67 | on the **real** data stack: Welcome, Roadmaps, the learning path, topics, the Dashboard, Notes, the editor, Goals, Challenges, a challenge (**notes saved once per pause and on leaving**), Resources, Analytics, both Settings Cubits; `SearchBloc` (**the 300 ms debounce in fake time**, only the last query running, **a newer query stopping older live results**, recent searches) |
| Views | 64 | each screen's states and interactions with mocked Cubits: swipe and Undo, Preview, the discard guard, the goal sheet's bounds, the challenge hints, Search's groups and highlights, Settings (the denied card, reset after confirming), Analytics (cards and written chart summaries) |
| Design system | 61 | themes, **WCAG contrast of every learning color** in both themes and any `ColorScheme`, labels and dates, the adaptive dialog on Android and iOS, the cards and rows, **Markdown in the theme colors in light and dark**, the heatmap, the large-text rule |
| DAOs and SQL | 37 | the learning path as a tree, idempotent completion, section completion keeping earlier days, the active-days union, **LIKE wildcards taken literally**, `DELETE … RETURNING`, `CHECK`, `CASCADE`, `SET NULL`, the activity union, **FTS5: prefixes, all words required, title outranking body, marked snippets, the triggers on add, edit and delete, live results, hostile text**, reset |
| Repositories | 33 | **user data surviving a re-sync** (no `REPLACE`), demo progress, notes (Undo restores the same note, a removed topic writes the null), goals, challenges (status transitions, the first start and day kept), resources, settings and recent searches surviving a relaunch |
| Navigation | 30 | every rule of the onboarding gate, typed locations, the tabs and the drawer over every tab, screens above the shell, deep links with a Close button |
| App-level flows | 27 | the real app on the real DI graph: first launch (fresh, demo, offline and Try again), Continue → complete → the Dashboard follows, a section, notes CRUD with Undo, a goal reaching its target, a challenge to done with notes, a saved resource, search → a note, a catalog update synced from Settings, reset, Dark app-wide, the reminder, About |
| Catalog, demo data and fake service | 19 | the bundled JSON itself, every validation rule of both mappers, relative dates, the simulated network |
| drift migrations | 4 | every upgrade path against a fresh schema; **a seeded v1 database: rows kept, catalog and notes indexed, triggers working** |
| DI | 1 | the real container resolves every Cubit, the Bloc, repository, DAO and service |
| **Total** | **531** | |

## How the tests are built

- **The real data stack.** `DataStack` (`test/helpers/`) wires the real repositories and use cases to an in-memory database (FTS5 included), the real fake service (zero latency, reading the bundled JSON), a fixed `Clock` (`demoNow`: Wednesday 14 October 2026, 15:00), a seeded `IdGenerator`, a `FakeSettingsRepository`, a `RecordingLinkOpener` and a `FakeReminderScheduler`. Cubit tests run on it, so they exercise the real SQL.
- **The real app.** `pumpDevJourney` builds the real composition root with only these swaps: an in-memory database, a zero-latency network, a fixed clock, in-memory preferences, `PackageInfo.setMockInitialValues`, a mocked dynamic color channel, the recording link opener and the fake scheduler. Pair it with `tearDown(getIt.reset)`.
- **Figures worked out by hand.** With the demo as of `demoNow`: a 6-day streak, 7 of 12 Flutter topics, State management next, weekly topics 0, 0, 0, 0, 2, 1, 5, 2, and goals met on 6 of 19 periods. [LEARNING_ENGINE.md](LEARNING_ENGINE.md) shows each one worked out.
- **Fakes over mocks.** Fakes behave like the real thing (their streams emit the current value, then every change). Mocks (`mocktail`, `MockCubit` / `MockBloc`) appear only in view tests, and to stub the search source for the fake-time debounce test.
- **Bounded waits.** `waitFor(bloc, predicate)` times out after 5 s; `pumpUntilFound` settles real-loop work in slices and fails after 20.
- **Accessibility.** The tour runs on a phone-width but very tall surface, so every list item is built and checked with `meetsGuideline(androidTapTargetGuideline / labeledTapTargetGuideline / textContrastGuideline)`; any layout overflow fails the test.
- **Counts per area** come from `fvm flutter test --reporter json`, grouped by folder.

## Proving the tests can fail

Each of these was checked by breaking the code on purpose (a mutation check), running the tests, then restoring it:

| Broken on purpose | Phase | Tests that failed |
|---|:---:|---|
| `NoteMarkdown` without its style sheet | 4 | 2 (Markdown colors in light and dark) |
| The v1 → v2 step doesn't fill the index | 5 | 1 (the migrated catalog and notes are searchable) |
| `SearchBloc` events `concurrent` instead of `restartable` | 5 | 1 (a newer query stops the older one's live results) |
| The current goal period counted before it's met | 6 | 3 (the goal completion rate) |
| A revoked permission doesn't turn the reminder off | 6 | 1 |
| The catalog sync uses `INSERT OR REPLACE` | 7 | 1 (a sync never touches the user's data) |
| Completing a topic again replaces its day | 7 | 1 |
| The streak breaks when today has no activity yet | 7 | 2 (the streak rule, the demo's Dashboard) |
| Search words no longer quoted | 7 | 15 (every special character, and the DAO's hostile-text test) |
| Links open over plain `http` too | 7 | 1 |
| Reset progress keeps challenge work | 7 | 2 (the DAO and the use case) |

Tests also found real bugs while they were written: the challenge upsert left a cleared completion day in place (`insertOnConflictUpdate` with a row object skips nulls), and drift had silently dropped two search triggers.

## Gotchas worth knowing

- **A plugin call while the DI graph is built hangs every app-level test** (no CPU, `--timeout` ignored): mock its channel in `configureTestDependencies` (conventions §11.58). Bound a run you're diagnosing and read its log.
- **Async work before the first pump waits on fake time:** load data inside `tester.runAsync` (§11.44); flows that alternate fake delays and database work need `pumpUntilFound` (§11.54).
- **A Bloc made in `fakeAsync` must be closed inside it:** a close awaited after the test waits on fake timers forever.
- **Switching streams** (`switchMap`, `restartable`) is tested in real time with a short debounce; only the debounce's timing goes in fake time (§11.29).
- **A lazy list builds only what's near the screen:** scroll with `scrollUntilVisible` before finding a row further down; `pumpUntilFound` can match the text still in an editor's own field, so wait for the screen underneath instead.
- **`ensureVisible` needs a pump before the tap** (§11.51); **`AlertDialog.adaptive` builds a private subclass**, so find its buttons, not `byType(AlertDialog)`.
- **Records holding lists don't compare by value:** compare joined strings.

These, and more, are recorded as verified traps in the shared Flutter conventions (`00-CONVENTIONS.md` §11).
