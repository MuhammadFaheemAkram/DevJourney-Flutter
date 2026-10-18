# Phase 4 — Notes + Goals

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 4, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 4 lets learners keep what they learn and aim for something:
- **notes:** Markdown, attached to a topic or not, searchable, with a preview, and a delete that can be undone;
- **goals:** daily, weekly or monthly targets, counted from completions or from manual check-ins, with progress that resets by itself;
- **the Dashboard** gains the goals and the latest notes, and **Topic detail** its notes.

As in Phase 3, nothing derived is stored: a goal's progress is worked out from completion and check-in days whenever they change.

---

## 🧱 What Was Implemented

- **Domain:**
  - `Note`, `NoteItem` (with its topic's title), `NoteDraft`; `Goal`, `GoalDraft`, `GoalWindow`, `GoalProgress`, `LearningActivity`; `TopicChoice` for the topic picker;
  - pure `goalWindow(period, today)` (today, the ISO week, the calendar month) and `goalProgress(goal, activity, today)`;
  - pure `plainTextPreview(markdown)` (Markdown marks out, code blocks skipped) and the validation rules (`noteTitleError`, `noteContentError`, `goalTitleError`, `goalTargetError`), which count graphemes;
  - `NotesRepository` and `GoalsRepository`, plus `RoadmapRepository.watchTopicChoices`;
  - use cases: `WatchNotes`, `FindNote`, `SaveNote`, `DeleteNote`, `RestoreNote`, `WatchTopicChoices`, `WatchGoalProgress`, `SaveGoal`, `DeleteGoal`, `CheckInGoal`, `UndoCheckIn`; `WatchDashboard` now adds the goals and the three latest notes.
- **Database** (schema unchanged, still v1):
  - `NotesDao`: notes joined to their topic's title, newest edit first; search with `LIKE` (wildcards escaped); one topic's notes; `deleteReturning` for Undo;
  - `GoalsDao`: goals in the order added; check-ins; "remove the latest check-in since a day"; `watchActivity`, one `UNION ALL` of topic completions, challenge completions and check-ins, each with its day.
- **Design system:** `NoteMarkdown` (with `noteMarkdownStyle(theme)`), `NoteRow`, `GoalCard`, `showAppSheet`, `DateLabels.edited` ("5 min ago") and `DateLabels.resets` ("Resets Monday"), goal kind and period labels.
- **Notes** (`NotesCubit`): a search field, the notes with previews, topic tags and relative dates, **New note**, swipe to delete with **Undo**, and empty states for no notes and no matches.
- **Note editor** (`NoteEditorCubit`, `@factoryParam noteId, topicId`): the title, a topic picker (a searchable sheet), the Markdown with **Edit / Preview** tabs, **Save**, **Delete** (Undo appears on the screen underneath) and a discard guard. `/notes/new?topicId=…` opens it attached to a topic.
- **Goals** (`GoalsCubit`): Daily / Weekly / Monthly segments, goal cards with − and + check-ins for custom goals, **Add goal**, and an editor sheet (title, kind, period, a 1–50 target stepper, Delete after confirming).
- **Dashboard:** up to three goals (daily first) and the three latest notes, each with "See all".
- **Topic detail:** "Your notes" on that topic, with **Add note**.
- **Tests:** 352 in total (101 new).

### Differences from the plan

- **Check-ins use − and + buttons on the card**, not a +1 with a timed Undo: a mis-tap can be taken back at any time in the period, not only while a SnackBar shows. + stops at the target, and the use case refuses more as well.
- **Deleting a note from the editor has no confirmation:** it closes, and the screen underneath (Notes, a topic, the Dashboard) offers Undo, as a swipe does. Undo is gentler than a dialog and restores the same note.
- **The Dashboard section is "Goals"**, not "Today's goals": it shows up to three goals, daily ones first, because weekly and monthly goals are what most learners set.
- **Links in a note aren't tappable yet:** opening them in the in-app browser (https only) arrives with the link opener in Phase 5.
- **Validation is checked twice:** the forms show the error under the field, and the save use cases refuse invalid input too, using the same pure rules.

### Found and fixed during the phase

- **The Markdown preview would have been unreadable in dark mode.** `flutter_markdown_plus` imports `package:flutter/material.dart`, whose `Theme` is a different class from `material_ui`'s, so its `Theme.of` finds nothing and falls back to the light default. The app now passes a complete style sheet built from its own theme. A dark-mode test checks the rendered text color, and it failed when the style sheet was removed (conventions §11.55).
- **Previews showed code:** the first preview skipped only the ``` lines of a code block, not what's inside. It now leaves the whole block out.
- **Goals and notes created together could swap places.** The demo goals share one creation time, so the order fell to SQLite. Both lists now break ties by insertion order (`rowid`). The Dashboard's "daily first" grouping is built period by period rather than with `List.sort`, which isn't stable.
- **A goal card read as an unlabelled button** to screen readers (the tour caught it). `MergeSemantics` sat inside the `InkWell`; it now wraps it, as in `TopicRow`.

---

## 💙 Flutter / Dart Concepts Demonstrated

- **Derived progress per window:** a goal stores only its target; `goalWindow` picks the days and `goalProgress` counts what falls inside them. A new week means a new window, and progress starts from zero without any reset job.
- **ISO weeks with plain date arithmetic:** `today.addDays(1 - today.weekday)` is Monday, even when the week spans two years.
- **`UNION ALL` watched by drift:** `customSelect(…, readsFrom: {…})` re-runs when any of the three tables changes.
- **`combineLatest` across features:** goal progress joins the goals stream with the activity stream, and the Dashboard joins that with the path, the streak, the totals and the notes.
- **Safe `LIKE` search:** user text is escaped (`%`, `_`, `\`) and matched with `escapeChar`, so wildcards are taken literally.
- **`DELETE … RETURNING`:** one statement both deletes the note and hands it back for Undo.
- **`Dismissible` and state:** the Cubit removes the row in the same frame as the swipe, then deletes it. A dismissed `Dismissible` still in the tree is an error.
- **`PopScope` as a discard guard:** `canPop` is false while there are edits, and `onPopInvokedWithResult` asks first. `Navigator.pop` itself isn't blocked, so the page can leave once the user decides.
- **Popping with a result:** the editor pops with the deleted note, and `push<Note>` hands it to whichever screen opened it, which shows Undo.
- **Two `@factoryParam`s:** `getIt<NoteEditorCubit>(param1: noteId, param2: topicId)`.
- **Typed query parameters:** a `GoRouteData` constructor field that isn't in the path (`NewNoteRoute.topicId`) becomes `?topicId=`.
- **Sealed results from a sheet:** `GoalEditorResult` is `SaveGoal(draft)` or `DeleteGoal()`, handled with an exhaustive `switch`; `TopicPick(null)` means "no topic", and `null` means "dismissed".
- **Grapheme-aware limits:** `String.characters.length` counts "👩‍💻" as one character, where `length` counts five UTF-16 units.
- **`AutomaticKeepAliveClientMixin`:** the Edit tab keeps its cursor and scroll position while Preview is shown.
- **Styling a widget from another Material copy:** painting types (`TextStyle`, `Color`, `BoxDecoration`) are shared between `flutter/material.dart` and `material_ui`, so a style sheet built from our theme crosses over.

---

## 🔁 Data Flow (this phase)

```
Check in on a custom goal
GoalCard + ─▶ GoalsCubit.checkIn(progress) ─▶ CheckInGoalUseCase
  automatic? ─▶ AutomaticGoalException      already met? ─▶ GoalAlreadyMetException
  else ─▶ GoalsRepository.checkIn (day from the Clock) ─▶ GoalsDao.addCheckIn
  drift re-runs watchActivity (UNION ALL) and watchActiveDays:
    WatchGoalProgress (goals × activity × today) ─▶ Goals: "1 of 1 check-in today · Done"
    WatchDashboard ─▶ the goal card, and a 7-day streak (today now counts)

Delete a note, then Undo
swipe ─▶ NotesCubit.delete: row out of the state at once ─▶ DeleteNoteUseCase
  ─▶ NotesDao.deleteReturning (DELETE … RETURNING) ─▶ the Note ─▶ "Deleted …" + Undo
Undo ─▶ RestoreNoteUseCase ─▶ insert the same row (id, createdAt, updatedAt)
  ─▶ watchNotes re-emits: the note is back in its place
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `lib/core/database/daos/{notes_dao,goals_dao}.dart` | Notes with search and Undo; goals, check-ins and the activity union. |
| `lib/data/repository/{notes,goals}_repository_impl.dart`, `lib/data/mapper/notes_goals_mappers.dart` | Ids, times and rows ↔ models. |
| `lib/domain/calculation/{goals,markdown_preview,validation}.dart` | Goal windows and progress; previews; the input rules. |
| `lib/domain/model/{note,goal}.dart` | The models and their limits. |
| `lib/core/design_system/widgets/{note_markdown,note_row,goal_card,app_sheet}.dart` | Shared widgets, with the Markdown style sheet. |
| `lib/features/{notes,note_editor,goals}/**` | The screens, their Cubits, the topic picker and the goal sheet. |
| `lib/features/note_editor/open_note_editor.dart` | Opens the editor from anywhere and offers Undo after a delete. |
| `test/app/notes_goals_flows_test.dart` | The flows on the real app. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `Note`, `NoteItem`, `NoteDraft` | freezed | A note, with its topic, and what the editor saves | `domain/model` |
| `Goal`, `GoalWindow`, `GoalProgress`, `LearningActivity` | freezed | A goal, its days now, its count | `domain/model` |
| `goalWindow`, `goalProgress`, `plainTextPreview`, validation rules | pure functions | Derived values and rules, tested without Flutter | `domain/calculation` |
| `NotesRepository`, `GoalsRepository` | interfaces | The user's notes and goals | `domain/repository` |
| `NotesDao`, `GoalsDao` | drift DAOs | Queries and writes | `core/database/daos` |
| `NotesCubit`, `NoteEditorCubit`, `GoalsCubit` | Cubits | The three screens | `features/*/cubit` |
| `NoteEditorExit` (`NoteSaved`, `NoteDiscarded`, `NoteDeleted`) | sealed class | How the editor closed | `features/note_editor/cubit` |
| `GoalEditorResult` (`SaveGoal`, `DeleteGoal`), `TopicPick` | sealed class / value | What a sheet decided | `features/*/widgets` |
| `GoalAlreadyMetException`, `AutomaticGoalException`, `InvalidInputException` | exceptions | Refused writes, with a message | `core/common` |

---

## 🌱 Folder Structure Changes

- **New:** `lib/features/{notes,note_editor,goals}/cubit/`, `lib/features/note_editor/widgets/`, `lib/features/goals/widgets/`, `test/features/{notes,note_editor,goals}/`, `test/core/design_system/formatting/`.
- **Replaced:** the Notes, note editor and Goals placeholders are real screens.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Note | `Note(id, topicId?, title, content, updatedAt)` | the same, with a `UUID` | + `createdAt`; ids from an injected `IdGenerator` |
| Notes screen | create, edit, delete, search, attach to a topic | the same | the same, plus swipe to delete with Undo restoring the same note |
| Markdown | "if practical" | "optional" | `flutter_markdown_plus` with Edit / Preview tabs, styled from the app theme |
| Goal | `LearningGoal(title, targetCount, currentCount)` | + `period` | + `kind` and `createdOn`; no stored count: progress derived per window |
| Goal periods | daily, weekly, monthly | the same | the same: today, the ISO week, the calendar month |
| Goal progress | `UpdateGoalProgressUseCase` writes a count | the same | completions count automatically; custom goals take check-ins, capped at the target |
| Dashboard | today's goals, recent notes | the same | goals (daily first) and the three latest notes, live |
| Topic detail | notes on the topic | the same | "Your notes", with Add note attached to the topic |
| Persistence | Room `NoteEntity`, `GoalEntity` | SwiftData | drift tables from Phase 2 (`notes`, `goals`, `goal_check_ins`) |

Both native specs store a goal's current count and update it. Here only check-ins are stored. Topic and challenge goals count the completions already in the database, so a goal can never disagree with the work done, and nothing has to reset it when the week ends.

---

## 🎤 Interview Notes

**Q: How do goals reset every day, week or month without a background job?**
A: They don't need to reset, because the count isn't stored. A goal has a period and a target; its progress is the number of completions (or check-ins) whose day falls in the current window. Tomorrow the window moves, and the count starts from zero.

**Q: How does Undo restore a deleted note exactly?**
A: The delete returns the row (`DELETE … RETURNING`), and the SnackBar keeps it. Undo inserts that same row back, with the same id and timestamps, so it reappears in the same place in the list and keeps its topic.

**Q: Why does the Cubit remove a swiped note before the database confirms?**
A: A `Dismissible` that has been swiped away must leave the tree in the same frame, or Flutter throws. The Cubit drops the row from its state at once, then deletes it; if the delete fails, it puts the list back and says so.

**Q: How do you stop a full-screen editor from losing edits?**
A: `PopScope(canPop: !isDirty)`. Back, Close and the Android back gesture then call `onPopInvokedWithResult`, which asks first (an iOS alert on iOS). Once the user chooses, `Navigator.pop` leaves, because `pop` isn't blocked by `PopScope`, only `maybePop` and the system back are.

**Q: A third-party widget ignores your dark theme. Why, and what do you do?**
A: Here the app uses `material_ui`, a separate copy of Material, and the Markdown package reads `flutter/material.dart`'s `Theme`, a different class, so it finds none and uses the light default. The fix is to pass its styles explicitly from our theme, setting every field, and to test the rendered color in dark mode.

**Q: How do you search with `LIKE` safely?**
A: Bind the pattern as a parameter (never concatenate SQL), escape `%`, `_` and the escape character in the user's text, and pass `escapeChar`. "50%" then finds "50%", not "500".

---

## 📝 Learning Checklist

- ✅ Derive progress per period instead of storing counts
- ✅ Compute ISO weeks and months with calendar dates
- ✅ Watch a `UNION ALL` of several tables and combine it with other streams
- ✅ Search safely with an escaped `LIKE`
- ✅ Delete with `RETURNING` and restore the same row for Undo
- ✅ Guard unsaved edits with `PopScope`, and pop with a result
- ✅ Style a widget built on another copy of Material, and test it in dark mode
- ✅ Validate with pure rules shared by the forms and the use cases
- ⬜ Challenges, resources and global search (Phase 5)

---

## 🚀 Future Improvements

- **Phase 5:** challenges (with recent ones on the Dashboard), resources (on Topic detail too), tappable links in notes through the in-app browser, and global search over notes and everything else (FTS5).
- **Phase 6:** the goal completion rate in Analytics.
- **Later:** a Markdown toolbar (bold, list, code) above the editor, and goal reminders.
