# Phase 7 — Documentation & CI

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 7, and why;
> - the practices it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 7 turns a working app into a project someone else can learn from and contribute to:
- **documentation** that explains the design (architecture, data model, the learning engine, the fake API, testing), not just the setup;
- **evidence:** screenshots from a fresh install, test counts per area, and mutation checks that prove the tests catch what they claim to;
- **the open-source file set** and a CI that fails on anything stale;
- a final **cleanup** pass.

No feature changes: the app at the end of Phase 6 is the app.

---

## 🧱 What Was Implemented

- **Docs (`docs/`):**
  - `ARCHITECTURE.md`: layers and their import rules (checked against the code), who owns what, state management, errors, writes, navigation, DI, platform services, accessibility, key decisions;
  - `DATA_MODEL.md`: every table, key, relation, constraint and index, the FTS5 index and its triggers, what's derived, multi-table writes, preferences, migrations;
  - `LEARNING_ENGINE.md`: progress, the recommendation, the streak, goal windows, the goal completion rate, the analytics series and search ranking, each **worked through on the demo** (the same numbers the tests assert);
  - `API_SIMULATION.md`: the fake service, catalog v1 and v2, validation before writing, sync rules, errors, the developer switches, what a restart keeps;
  - `TESTING.md`: **531 tests by area** (counted with `--reporter json`), how the tests are built, the mutation-check table, and gotchas;
  - `LEARNING_NOTES.md`, `INTERVIEW_NOTES.md`, `ROADMAP.md`;
  - `SCREENSHOTS.md` with **16 screenshots:** light, dark and AX3 large text on the iOS simulator, and dynamic color on an Android 16 emulator, with alt text describing each.
- **Open-source files:** CONTRIBUTING (the architecture rules, schema changes, test helpers), CODE_OF_CONDUCT, SECURITY (what the app holds, injection-safe search, https-only links), CHANGELOG (one entry per phase), and the bug report, feature request and PR templates.
- **README:** final status, features, screenshots, the folder tree as it is now, a test summary table linking to TESTING, the full "same app on other platforms" table, and links to every doc.
- **CI:** the generated-code step now also fails on an **untracked** generated file, which `git diff --exit-code` can't see.
- **Cleanup:** the Android build file's template TODOs became accurate notes; a scan found no stale "Phase N" comments, TODOs or unused library files.
- **Mutation checks** of six more behaviours, all caught (below).

### Differences from the plan

- **No new tests:** the last screens got their view tests in Phases 5 and 6. The phase instead proves the existing tests with mutation checks.
- **Screenshots are on iOS and Android:** the spec asked for "Android dynamic color", which needs Android 12+; the emulator shots show it beside the iOS set.

### Mutation checks

Each was broken on purpose, tested, then restored:

| Broken on purpose | Tests that failed |
|---|---|
| The catalog sync uses `INSERT OR REPLACE` | 1: a sync never touches the user's data |
| Completing a topic again replaces its day | 1 |
| The streak breaks when today has no activity yet | 2 |
| Search words no longer quoted | 15, including the DAO's hostile-text test against the real index |
| Links open over plain `http` too | 1 |
| Reset progress keeps challenge work | 2 |

With the five from earlier phases (Markdown styles, the migration fill, restartable search, the goal rate, the reminder refresh), eleven behaviours are proven guarded. See [TESTING.md](TESTING.md).

---

## 💙 Practices Demonstrated

- **Docs that teach the design:** the why (catalog vs user state, derived figures, triggers, Bloc vs Cubit), with worked examples a reader can check by hand.
- **Numbers that agree everywhere:** the demo's figures in LEARNING_ENGINE are the ones the tests assert and the screenshots show.
- **Test counts from the runner, not by hand:** `--reporter json`, grouped by folder.
- **Mutation checks:** a test that can't fail proves nothing; breaking the code shows which tests guard it.
- **Accessible docs:** every screenshot has alt text describing what's on screen.
- **A CI that catches the easy-to-miss:** stale and never-committed generated code, format, lints, tests, on the FVM-pinned Flutter.
- **Claims checked against the code:** the layer rules were grepped, the topic names and validation rules read from the source and the catalog, before they went into the docs.

---

## 🔁 Data Flow (this phase)

```
Code ──▶ docs (claims checked against the source)
Tests ──▶ --reporter json ──▶ counts per area ──▶ TESTING.md, README
Code ──break on purpose──▶ tests fail? ──▶ restore ──▶ mutation table
Fresh install + demo ──▶ simulator / emulator ──▶ docs/screenshots/ ──▶ SCREENSHOTS.md, README
Push ──▶ CI: pub get → build_runner → no diff, no untracked → format → analyze → test
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `docs/ARCHITECTURE.md`, `DATA_MODEL.md`, `LEARNING_ENGINE.md`, `API_SIMULATION.md` | How the app is built and why. |
| `docs/TESTING.md` | What's covered, how, and the mutation checks. |
| `docs/LEARNING_NOTES.md`, `INTERVIEW_NOTES.md`, `ROADMAP.md` | Every concept used; questions and answers; what's next. |
| `docs/SCREENSHOTS.md`, `docs/screenshots/*.png` | 16 screenshots with alt text, and how to retake them. |
| `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md` | The open-source file set. |
| `.github/ISSUE_TEMPLATE/*`, `.github/PULL_REQUEST_TEMPLATE.md` | Issue and PR templates. |

---

## 🧩 Important Types Changed

None. Only the CI workflow, the Android build file's comments and the docs changed.

---

## 🌱 Folder Structure Changes

- **New:** `docs/screenshots/`, `.github/ISSUE_TEMPLATE/`, and the root community files.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Final docs | documentation, README finalization | README + `docs/*` (DATA_MODEL, LEARNING_ENGINE), with the SwiftData → Core Data note | DATA_MODEL, LEARNING_ENGINE, API_SIMULATION, TESTING with counts and mutation checks, notes, screenshots with alt text, a CHANGELOG |
| Templates | templates | `.github/*` | issue and PR templates, adapted to the project's rules (catalog vs user state, plugins behind interfaces) |
| Cleanup | code cleanup, test cleanup | cleanup | a scan for stale comments, TODOs and unused files; mutation checks instead of new tests |
| CI | a CI workflow, in Phase 7 | `ios-ci.yml`, in Phase 7 | since Phase 1; now also catches untracked generated files |
| Screenshots | — | — | iOS light, dark, AX3; Android dynamic color |

Both native specs leave CI to the last phase; this edition had it from the first commit, so every phase was checked by it.

---

## 🎤 Interview Notes

**Q: How do you know your test suite is any good?**
A: Coverage says which lines ran, not whether a test would notice them being wrong. Mutation checks do: break a key behaviour on purpose and see a test fail. Here eleven were broken, from the sync's upsert to FTS5 quoting, and each was caught; one check fails fifteen tests at once.

**Q: What belongs in a project's docs beyond "how to run it"?**
A: The decisions and their reasons (why the catalog and user data are separate, why nothing derived is stored), the data model, the rules with worked examples a reader can verify, how the tests are built, and how to contribute without breaking the architecture.

**Q: Why check documentation claims against the code?**
A: Docs drift. Grepping the layer rules and reading names from the source before writing caught several wrong topic names and a wrong claim about what a restart keeps.

**Q: What does your CI check?**
A: On the pinned Flutter version: the generated code is current and nothing generated is missing, formatting, the analyzer, and all 531 tests.

---

## 📝 Learning Checklist

- ✅ Document architecture, data model and rules with worked examples
- ✅ Count tests per area from the runner's JSON output
- ✅ Prove tests with mutation checks
- ✅ Take reproducible screenshots (fixed status bar, fresh install, light / dark / large text)
- ✅ Write alt text for every screenshot
- ✅ Ship the open-source file set and templates
- ✅ Make CI fail on stale and untracked generated code

---

## 🚀 Future Improvements

See [ROADMAP.md](ROADMAP.md): smarter reminders, custom roadmaps, spaced repetition, a real backend, home-screen widgets, tablets, localization, integration and golden tests, and an iOS build in CI.
