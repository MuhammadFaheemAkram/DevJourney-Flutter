# Phase 5 — Challenges + Resources + Search

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 5, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 5 adds practice, reading and finding:
- **challenges:** small coding exercises with hints, a status and the learner's own solution notes;
- **resources:** articles, videos, docs and courses, saved with a bookmark and opened in the in-app browser;
- **global search:** one field over roadmaps, topics, notes, resources and challenges, ranked, with the matched words highlighted.

It is also the first **schema change since release**: drift v2 adds an FTS5 search index, shipped as a tested migration that indexes what a v1 user already has.

---

## 🧱 What Was Implemented

- **Database (drift v2):**
  - `search.drift`: an FTS5 virtual table `search_index(kind UNINDEXED, ref_id UNINDEXED, title, body)` and 15 triggers (insert, update and delete on roadmaps, topics, notes, resources and challenges);
  - `AppDatabase.schemaVersion` 2, with a generated `stepByStep` migration: create the index and triggers, then fill the index from the existing rows;
  - `drift_schema_v2.json` exported; the generated migration tests plus our own v1 → v2 tests;
  - `SearchDao` (`MATCH`, `bm25` with the title weighted ×10, `highlight()`, `snippet()`, watched), `ChallengesDao` (challenges with their state, recent ones, an upsert), `ResourcesDao` (with bookmarks and topic titles).
- **Domain:**
  - `ChallengeProgress`, `ChallengeItem`, `ResourceItem`, `SearchKind`, `HighlightedText`, `SearchHit`, `SearchResults`;
  - pure `ftsQuery(text)`: user text → a safe FTS5 query;
  - `ChallengesRepository`, `ResourcesRepository`, `SearchRepository`, `RecentSearchesRepository`, and the `LinkOpener` service;
  - use cases: `WatchChallenges`, `WatchChallenge`, `SetChallengeStatus`, `SaveSolutionNotes`, `WatchResources`, `BookmarkResource`, `OpenLink` (https only), `OpenResource`, `WatchSearchResults`, `Watch/Save/ClearRecentSearches`; `WatchDashboard` adds the recent challenges.
- **Platform:** `UrlLauncherLinkOpener` (`LaunchMode.inAppBrowserView`); an Android `<queries>` entry for https so Custom Tabs can be found on Android 11+.
- **Design system:** `ChallengeCard`, `ChallengeStatusBadge` (icon and word), `ResourceCard` (open and save as separate buttons), `HighlightedTextView`, `SegmentedChoice` (segments, or chips at large text; Goals now uses it too), `AppSearchField(autofocus:)`.
- **Challenges** (`ChallengesCubit`): level chips and status segments, filtered in memory, "No challenges match" with Show all.
- **Challenge detail** (`ChallengeDetailCubit`, `@factoryParam challengeId`): the prompt, a status control, hints one at a time, and solution notes saved 800 ms after typing pauses and on leaving ("Saving…" / "Saved").
- **Resources** (`ResourcesCubit`): search, type chips, **Saved only**, bookmark toggles, links opened in the app.
- **Search** (`SearchBloc`): an autofocused field, results grouped by kind with counts and highlights, recent searches (last five) with Clear, and resources opened straight from a result.
- **Elsewhere:** the Dashboard's recent challenges; Topic detail's resources; links in a note's Preview open (https only).
- **Tests:** 470 in total (118 new).

### Differences from the plan

- **Recent searches live in preferences, not drift:** five short strings the device owns. The spec's v2 adds only the search index, and a table for five strings would be a heavier migration for no gain.
- **Resources filter in memory:** thirty-five rows filter instantly in Dart, as Roadmaps does. The FTS index serves global search.
- **Hints aren't remembered:** revealing them is a nudge for this visit, not a setting.
- **Hints aren't indexed:** searching for an answer shouldn't surface it.

### Found and fixed during the phase

- **drift silently dropped two triggers.** The topic triggers turned the objectives (a JSON list) into text with nested `replace()` calls. drift's parser read `REPLACE` as the keyword and left both triggers out of the generated code, with no warning: topics were never indexed. A probe found it (seven catalog rows, four indexed). The triggers now use `json_each`, and the tests check what each trigger does (conventions §11.56).
- **A challenge moved back from Done kept its day.** `insertOnConflictUpdate` given a row object treats a `null` column as "leave as is", so `completedOn` was never cleared. The repository test caught it; the DAO now passes `toCompanion(false)` (conventions §11.57). A test confirmed notes' `replace` writes nulls correctly.
- **A fake-time test hung on tear-down.** A Bloc made inside `fakeAsync` and closed again after the test waits on fake timers forever; that test closes its Bloc inside the zone.
- **Two mutation checks:** removing the migration's index fill, and swapping `restartable` for `concurrent`, each made a test fail.

---

## 💙 Flutter / Dart Concepts Demonstrated

- **SQLite FTS5 through drift:** a virtual table in a `.drift` file (`sqlite_modules: [fts5, json1]`), `MATCH`, `bm25()` with per-column weights, `highlight()` / `snippet()` with control-character marks parsed into ranges.
- **Triggers as the single writer of an index:** every path that writes content updates the index in the same statement; drift turns `.drift` triggers into stream update rules, so a watched search re-runs.
- **A schema migration:** `stepByStep` from `make-migrations`, each step seeing the schema at its version; a frozen fill for the rows already there; the `SchemaVerifier` comparing every upgrade with a fresh install.
- **Sanitising user input for a query language:** quoting each word so FTS5 operators become plain text.
- **A Bloc with event transformers:** `switchMap` to a delayed event *is* a debounce; `restartable()` cancels the previous handler, ending its `emit.forEach` subscription.
- **Debounced autosave in a Cubit:** a `Timer` reset per keystroke, and a flush in `close()`, so leaving never loses the last words.
- **Platform links behind an interface:** `LinkOpener` keeps `url_launcher` out of the domain and lets tests record the links instead of opening a browser; `OpenLinkUseCase` refuses anything but https.
- **Rich text:** `Text.rich` with bold spans for matches (not color alone).
- **Fake time for timing, real time for switching:** the 300 ms debounce is tested with `fake_async` and a stubbed search; switching queries is tested in real time with a short debounce (conventions §11.29).

---

## 🔁 Data Flow (this phase)

```
Type "strea" in Search
SearchQueryChanged ─debounce 300 ms─▶ restartable handler (cancels the previous query's results)
  ─▶ WatchSearchResultsUseCase: ftsQuery("strea") = "\"strea\"*"
  ─▶ SearchDao.watchMatches: MATCH, bm25 (title ×10), highlight(), snippet()
  ─▶ searchResultsFromRows: marks → ranges, grouped by kind ─▶ emit.forEach ─▶ the screen

Save a note (anywhere)
NotesDao.insert ─▶ trigger search_notes_insert ─▶ search_index
  drift's update rules: search_index changed ─▶ a watched search re-runs

Upgrade a v1 install
open ─▶ user_version 1 < 2 ─▶ stepByStep.from1To2:
  create search_index, create 15 triggers, INSERT … SELECT from each content table
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `lib/core/database/search.drift` | The FTS5 index and its triggers. |
| `lib/core/database/app_database.steps.dart`, `drift_schemas/app_database/drift_schema_v2.json` | The generated migration helper and the exported v2 schema. |
| `lib/core/database/daos/{search,challenges,resources}_dao.dart` | Search, challenges with their state, resources with bookmarks. |
| `lib/domain/calculation/fts_query.dart` | Safe FTS5 queries. |
| `lib/domain/service/link_opener.dart`, `lib/core/platform/url_launcher_link_opener.dart` | Opening links in the app. |
| `lib/data/mapper/{search,challenge_resource}_mappers.dart` | Highlights, groups, rows → models. |
| `lib/features/{challenges,challenge_detail,resources,search}/**` | The screens, their Cubits and the Bloc. |
| `test/drift/app_database/**` | The generated schema helpers and the migration tests. |
| `test/app/challenges_resources_search_flows_test.dart` | The flows on the real app. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `ChallengeProgress`, `ChallengeItem`, `ResourceItem` | freezed | A challenge with the user's work; a resource with its bookmark | `domain/model` |
| `SearchHit`, `SearchResults`, `HighlightedText` | freezed | Ranked, grouped, highlighted results | `domain/model` |
| `ftsQuery` | pure function | User text → safe query | `domain/calculation` |
| `LinkOpener` | interface | Show a web page | `domain/service` (implemented in `core/platform`) |
| `SearchDao`, `ChallengesDao`, `ResourcesDao` | drift DAOs | Queries and writes | `core/database/daos` |
| `SearchBloc` | Bloc | Debounced, restartable search | `features/search/bloc` |
| `ChallengesCubit`, `ChallengeDetailCubit`, `ResourcesCubit` | Cubits | The three screens | `features/*/cubit` |
| `SegmentedChoice` | widget | One of a few values, at any text size | `core/design_system/widgets` |

---

## 🌱 Folder Structure Changes

- **New:** `lib/core/platform/`, `lib/domain/service/`, `lib/features/search/bloc/`, `lib/features/{challenges,challenge_detail,resources}/cubit/`, `test/drift/app_database/` (generated helpers and migration tests), `test/features/{challenges,challenge_detail,resources,search}/`.
- **Replaced:** the Challenges, challenge, Resources and Search placeholders are real screens.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Challenges | difficulty filter, status, mark completed, solution notes | the same | + status filter, prompts and hints one at a time, notes saved as you type (debounced, and on leave) |
| Challenge model | id, title, difficulty, completed, notes | `isCompleted`, `solutionNotes` | catalog `Challenge` (category, prompt, hints) + a user `ChallengeProgress` (status, notes, start, completion day) |
| Resources | bookmark, search, categorize | the same | + type chips, Saved only, opened in Custom Tabs / SFSafariViewController |
| Links | — | — | `LinkOpener` behind `OpenLinkUseCase`: https only |
| Global search | Flow `debounce` | debounced | FTS5 (ranked, highlighted, prefix matching), `SearchBloc` with `debounceRestartable`, recent searches |
| Index upkeep | — | — | triggers, so every write path keeps it current |
| Schema change | Room migration | SwiftData migration | drift v2 with `make-migrations` and generated + hand-written migration tests |

Both native specs ask for a debounced search without saying how matches are found or ranked. The Flutter edition uses SQLite's full-text engine: ranking and snippets come from SQLite, prefixes work as the user types, and the triggers mean no code path can forget to update the index.

---

## 🎤 Interview Notes

**Q: Why FTS5 instead of `LIKE '%text%'`?**
A: `LIKE` with a leading wildcard reads every row and can't rank, so the best match can be anywhere in the list. FTS5 keeps an inverted index of words, matches prefixes, ranks with bm25 (with the title weighted above the body) and cuts snippets with the matches marked.

**Q: How does the index stay in step with the content?**
A: Triggers: an insert, update or delete on a content table updates the index in the same statement. No repository has to remember it, and a sync, an Undo or a reset all go through the same path. drift turns the triggers into update rules, so a watched search re-runs too.

**Q: How do you stop users from breaking the FTS5 query?**
A: Each word becomes a quoted string, with quotes inside removed, so `AND`, `NEAR`, `*` and parentheses are plain text; the last word gets a `*` outside its quotes for prefix matching. The query is a bound parameter, never concatenated into SQL.

**Q: Why is Search a Bloc when everything else is a Cubit?**
A: Typing is a stream of events that needs shaping: wait for a pause, then run only the latest query and cancel the previous one's live results. `on<Event>(…, transformer: debounceRestartable(…))` says that in one line; a Cubit would need hand-written timers and subscriptions.

**Q: How do you ship a schema change safely?**
A: Bump the version, export the new schema with `make-migrations`, write a step that sees the schema as it was, and fill anything derived (here, the index). The generated tests check each upgrade path ends in exactly the schema a fresh install has; my own test seeds a v1 database and checks the old rows are searchable afterwards.

**Q: How do you autosave a text field without a write per keystroke?**
A: A timer reset on each change (a debounce), and a flush when the screen closes, so the last words are never lost. The state says "Saving…" or "Saved", so the user knows.

---

## 📝 Learning Checklist

- ✅ Build a full-text index with FTS5 in drift, ranked and highlighted
- ✅ Keep an index current with triggers, and watch it
- ✅ Make user text safe for a query language
- ✅ Ship a schema migration with generated and data tests
- ✅ Debounce and restart searches with a Bloc's event transformer
- ✅ Autosave with a debounce, and flush on leave
- ✅ Open links in the in-app browser behind an interface, https only
- ⬜ Analytics, settings and reminders (Phase 6)

---

## 🚀 Future Improvements

- **Phase 6:** analytics (weekly and monthly completions, the heatmap, goal completion rate), settings (theme, dynamic color, reset progress, catalog update) and a daily reminder.
- **Later:** search filters by kind, typo tolerance (the `trigram` tokenizer), and syntax highlighting in notes' code blocks.
