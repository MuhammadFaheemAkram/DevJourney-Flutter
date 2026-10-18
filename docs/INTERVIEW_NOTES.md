# Interview Notes

Questions this project answers, with the answers it gives. Each phase summary has more, tied to that phase's code.

---

## Architecture

**Q: Why split the catalog from the user's data?**
A: They have different owners. The catalog belongs to the API and changes with each sync; progress, notes and goals belong to the user. Separate tables, joined by stable catalog ids, let a sync update a topic's text without any chance of touching progress. The sync is an upsert in one transaction, and no code path writes a user table during it.

**Q: Why is nothing like "percentage complete" stored?**
A: A stored figure is a second copy of the truth, and copies drift apart. A percentage computed from completion rows can't disagree with them, and a sync that adds topics lowers it, as it should. drift re-runs the query when either table changes, so every screen stays current.

**Q: Where does business logic live?**
A: In the domain: pure functions (`learningStreak`, `goalProgress`, `goalCompletionRate`, `ftsQuery`) and one use case per user action, holding the rules that aren't SQL ("https only", "a met goal takes no more check-ins", "denied permission keeps the reminder off"). Repositories own persistence; Cubits hold screen state; Views render it.

**Q: How do you keep plugins out of your business logic?**
A: Interfaces in `domain/service` (`ReminderScheduler`, `LinkOpener`, `DynamicColorSource`), implemented in `core/platform`. Use cases and Cubits are tested with fakes that record calls and play the user's answers; the plugin code is checked on devices.

## Data and SQL

**Q: Why must a sync never use `INSERT OR REPLACE`?**
A: SQLite's `REPLACE` deletes the conflicting row, then inserts. That delete fires `ON DELETE CASCADE`, so replacing a topic would delete its completions and bookmarks. `INSERT … ON CONFLICT DO UPDATE` changes the row in place. A test pins it, and breaking it on purpose makes that test fail.

**Q: How do you load a learning path (roadmap → sections → topics) efficiently?**
A: One ordered query with `LEFT JOIN`s (sections, topics, completions, bookmarks), folded into a tree in Dart. One query means one `watch()` stream: a completion produces one new tree in which every count agrees.

**Q: How does Undo restore a deleted note exactly?**
A: `DELETE … RETURNING` hands back the row being deleted, and Undo inserts that same row, with its id and both timestamps, so it reappears in its place and keeps its topic.

**Q: You found that a challenge moved back from Done kept its completion day. Why?**
A: drift's `insertOnConflictUpdate`, given a row object, treats a `null` column as "leave as it was". Passing `toCompanion(false)` writes the null. A repository test of the Done → In progress transition caught it.

## Search

**Q: Why FTS5 instead of `LIKE '%text%'`?**
A: `LIKE` with a leading wildcard scans every row and can't rank. FTS5 keeps an inverted index, matches prefixes as the user types, ranks with bm25 (the title weighted above the body) and cuts snippets with the matches marked.

**Q: How does the index stay current?**
A: Triggers on the content tables update it in the same statement as the write, so no code path can forget it. drift reads the triggers, so a watched search re-runs when a note changes. A migration fills it from existing rows, because triggers only see new writes.

**Q: How do you stop users breaking the query?**
A: `ftsQuery` puts each word in quotes (removing quotes inside), so FTS5's operators are plain text, adds a prefix `*` to the last word, and the query is a bound parameter. Breaking the quoting on purpose fails fifteen tests, including one that runs hostile text against the real index.

**Q: Why is Search a Bloc when every other screen uses a Cubit?**
A: Typing is a stream of events that needs shaping: wait for a pause, run only the latest query, and cancel the older query's live results. That's an event transformer (`switchMap` to a delayed event, then `restartable`). The debounce's timing is tested in fake time; the cancelling in real time.

## Goals, streaks and analytics

**Q: How does a streak survive "I haven't done anything yet today"?**
A: It counts back from today if today is active, otherwise from yesterday. Only a full missed day breaks it. Days are calendar days, so month and year ends can't.

**Q: How do goals reset each week without a job?**
A: They don't store a count. A goal's progress is the number of events whose day falls in the current window (the ISO week, the month); next week the window moves and the count starts from zero.

**Q: How is "goals met" fair?**
A: Over 30 days, ended periods count met or not, the current one only once met, and periods before the goal existed don't count. The demo works out to 6 of 19 by hand, and a test asserts it.

## Platform

**Q: How does the daily reminder work on both platforms?**
A: One repeating notification scheduled in the device's time zone at a wall-clock time (`zonedSchedule` with `DateTimeComponents.time`). The system rings it without the app running and restores it after a reboot. The app asks for permission only when the user turns it on, explains and links to system settings if denied, and reschedules on resume, which also catches time zone changes and revoked permissions.

**Q: Why is dynamic color Android-only, and how did you build it?**
A: Material You is an Android 12+ feature; iOS has no system palette. The plugin's ready-made scheme is `flutter/material.dart`'s class, not `material_ui`'s, so the app takes only the wallpaper's color and builds its own scheme. It's read before `runApp`, so the first frame is already in it.

**Q: What surprised you about third-party widgets and `material_ui`?**
A: A package built on `flutter/material.dart` looks up a different `Theme` class, finds none and falls back to light defaults: the Markdown preview drew dark text on a dark page. The fix is an explicit style sheet from the app's theme, guarded by a dark-mode test.

## Accessibility

**Q: How do you know every screen is accessible?**
A: An accessibility tour test opens every screen and key state, in light and dark, at 200 % text, and checks tap targets, labels and contrast with `meetsGuideline`; any overflow fails it. Charts carry written summaries, and nothing relies on color alone.

## Testing

**Q: Mocks or fakes?**
A: Fakes and the real thing. Cubits and use cases run on the real repositories over an in-memory database, so they exercise the real SQL; fakes stand in only for the platform (notifications, links). Mocks appear in view tests, where the Cubit is the boundary.

**Q: How do you know the tests would catch a regression?**
A: Mutation checks: eleven key behaviours were broken on purpose (the upsert, idempotent completion, the streak rule, FTS5 quoting, https-only links, reset, the migration fill, restartable search, the goal rate, the reminder refresh, the Markdown styles), and each made a test fail.

**Q: What's the hardest test bug you hit?**
A: Every app-level test hung at its first line, using no CPU and ignoring the timeout. Dependency setup read the wallpaper colors through a plugin channel inside a widget test, before the first pump, and the call never returned. Mocking the channel in the test setup fixed it.

## Trade-offs and next steps

**Q: What would you change for production?**
A: A real API behind `LearningService`, with pagination and ETags; encrypted storage if notes became sensitive; a reminder that skips days already active (it needs a background check); integration tests on devices and a screen-reader pass for reading order. See [ROADMAP.md](ROADMAP.md).
