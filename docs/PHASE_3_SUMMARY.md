# Phase 3 — Roadmaps + Topics

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 3, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 3 is where learning starts:
- **Roadmaps:** every roadmap with its progress, searched and filtered, with pull-to-refresh to sync the catalog;
- **the learning path:** a roadmap's sections on a path, opening to their topics, completed one by one or a section at a time;
- **topics:** what each teaches, how hard and how long, completed and bookmarked;
- **the Dashboard:** the streak, the active roadmap, what to learn next, and the totals.

Everything is derived from completion rows, live: complete a topic anywhere and every screen moves.

---

## 🧱 What Was Implemented

- **Domain:**
  - `TopicItem` (a topic with its completion day and bookmark), `SectionPath`, `RoadmapPath` (counts derived from the topics), `TopicDetails`, `LearningStreak`, `DashboardSummary`;
  - pure `recommendedTopic(path)` (the first open topic, in path order) and `learningStreak(activeDays, today)` (current, longest, whether today counts);
  - `ProgressRepository` (complete and uncomplete a topic or a section, bookmarks, active days, totals) and `RoadmapRepository.watchRoadmapPath` / `watchTopic`;
  - use cases: `WatchRoadmapPath`, `WatchTopic`, `SetTopicCompleted`, `SetSectionCompleted`, `BookmarkTopic`, `SetActiveRoadmap`, `WatchSettings`, `WatchDashboard`.
- **Database:** `LearningDao`:
  - `watchPath`: the roadmap, sections, topics, completions and bookmarks in **one** ordered `LEFT JOIN` query, folded into a tree by `pathFromRows`;
  - `completeTopic` (`INSERT OR IGNORE`, so the first day stays), `completeSection` (only open topics, in one transaction), the uncompletes and bookmarks;
  - `watchActiveDays` (a `UNION` of completion days, finished challenges and check-ins) and `watchCompletedCounts`.
- **Design system:** `RoadmapCard`, `TopicRow`, `DifficultyChip` (color *and* an icon), `ProgressRing`, `StreakBanner`, `FilterChipGroup`, `AppSearchField`, `DateLabels`, `minutesLabel`, and `showConfirmDialog`, now **adaptive** (an iOS alert on iOS).
- **Roadmaps** (`RoadmapsCubit`): search and category filter in memory, "Active" on the followed roadmap, pull-to-refresh (`RefreshIndicator.adaptive`) that syncs and reports "Everything is up to date" or "3 new topics".
- **Roadmap detail** (`RoadmapDetailCubit`, `@factoryParam roadmapId`): the description, a progress ring, "Set as active roadmap", and the learning path: numbered nodes on a painted line (checked when a section is done), sections that open and close (the one with the next topic opens first), topic rows, and "Mark section complete" (confirmed when it completes more than one topic) or "Mark as not done".
- **Topic detail** (`TopicDetailCubit`, `@factoryParam topicId`): a breadcrumb, difficulty and time, the description, "What you'll learn", a bookmark toggle, and **Mark complete** / **Completed · tap to undo** with the day.
- **Dashboard** (`DashboardCubit`): the streak banner, the active roadmap's progress with **Continue**, "Next up", and the totals.
- **Tests:** 251 in total (80 new).

### Differences from the plan

- **Topic detail's resources and notes** come with their phases (5 and 4) rather than as placeholders now.
- **The app bar of a topic reads "Topic"**, with the title as a heading below it: long titles wrap there instead of being cut in the app bar.
- **Search on Roadmaps is in memory, without a debounce:** four roadmaps filter instantly. The debounced, restartable search is the global Search (Phase 5).

### Found and fixed during the phase

- **`find.byType(AlertDialog)` found nothing** for the adaptive dialog: `AlertDialog.adaptive` builds a private subclass, and `byType` matches exact types. The tests check for the Material buttons on Android and `CupertinoAlertDialog` on iOS.
- **`ensureVisible` needs a pump** before the tap: it jumps the scroll position, but the tap used the old layout and missed (conventions §11.51).

---

## 💙 Flutter / Dart Concepts Demonstrated

- **One query for a tree:** `LEFT JOIN`ing roadmap → sections → topics → completions → bookmarks, ordered, then folding the flat rows into sections of topics. One `watch()`, so one consistent emission per change.
- **Idempotent writes:** `InsertMode.insertOrIgnore` keeps the first completion day; `isNotInQuery` / `isInQuery` subqueries select a section's open (or done) topics.
- **A `UNION` query watched by drift:** `customSelect(…, readsFrom: {…})` tells drift which tables to watch.
- **`switchMap` + `combineLatest`:** the Dashboard follows the active roadmap (swapping the path query when it changes) and combines three streams into one summary.
- **Pure calculations:** the streak (a set of `CalendarDate`s, counting back) and the recommendation, tested without Flutter.
- **`@factoryParam`:** `getIt<RoadmapDetailCubit>(param1: roadmapId)`.
- **State that outlives rebuilds:** which sections are open lives in the Cubit, so the live path re-emitting doesn't close them.
- **`CustomPainter` + `IntrinsicHeight`:** the path's line is painted in a gutter that stretches to its section's height.
- **Adaptive widgets:** `showAdaptiveDialog`, `AlertDialog.adaptive`, `CupertinoDialogAction` (with its red destructive style), `RefreshIndicator.adaptive`.
- **Semantics:** a section reads "Section 3 of 4, Architecture, 0 of 3 topics complete, expanded"; a topic row reads its title, difficulty, time, bookmark and "completed".

---

## 🔁 Data Flow (this phase)

```
Complete a topic
TopicDetailCubit.toggleCompleted ─▶ SetTopicCompletedUseCase ─▶ ProgressRepository (day from the Clock)
  ─▶ LearningDao.completeTopic (INSERT OR IGNORE)
  drift re-runs every watcher of topic_progress:
    watchTopic ─▶ Topic detail: "Completed today"
    watchPath  ─▶ the learning path: the check, "1 / 3", the ring
    watchRoadmapProgress ─▶ Roadmaps: "67% complete"
    watchActiveDays + watchCompletedCounts ─▶ Dashboard: the streak, "Next up", the totals

Dashboard
settings.activeRoadmapId ─distinct─▶ switchMap(watchRoadmapPath)
  ─combineLatest─ watchActiveDays ─combineLatest─ watchCompletedCounts
  ─▶ learningStreak + recommendedTopic ─▶ DashboardSummary
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `lib/core/database/daos/learning_dao.dart` | Paths, topics, progress writes, active days, totals. |
| `lib/data/mapper/learning_mappers.dart` | Rows → topics, sections, the path tree. |
| `lib/data/repository/progress_repository_impl.dart` | Progress with the day from the clock. |
| `lib/domain/calculation/{recommendation,streak}.dart` | What's next; the streak. |
| `lib/domain/model/{learning_path,learning_streak,dashboard_summary}.dart` | The read models. |
| `lib/core/design_system/widgets/*` | The learning widgets and the adaptive dialog. |
| `lib/features/{roadmaps,roadmap_detail,topic_detail,dashboard}/**` | The screens and their Cubits. |
| `test/app/roadmap_flows_test.dart` | The flows on the real app. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `TopicItem`, `SectionPath`, `RoadmapPath`, `TopicDetails` | freezed | Catalog + user state, as trees | `domain/model` |
| `LearningStreak`, `DashboardSummary` | freezed | Derived figures | `domain/model` |
| `recommendedTopic`, `learningStreak` | pure functions | What's next; the streak | `domain/calculation` |
| `ProgressRepository` | interface | Completions, bookmarks, activity | `domain/repository` |
| `LearningDao` | drift DAO | The joins and writes | `core/database/daos` |
| `RoadmapsCubit`, `RoadmapDetailCubit`, `TopicDetailCubit`, `DashboardCubit` | Cubits | The four screens | `features/*/cubit` |
| `LearningPathSection` | widget | A node, its line, its topics | `features/roadmap_detail/widgets` |

---

## 🌱 Folder Structure Changes

- **New:** `lib/domain/calculation/`, `lib/features/{roadmaps,roadmap_detail,topic_detail,dashboard}/cubit/`, `lib/features/roadmap_detail/widgets/`, `test/features/*`, `test/core/design_system/widgets/`.
- **Replaced:** the Dashboard, Roadmaps, roadmap and topic placeholders are real screens.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Roadmaps list | `LazyColumn`, search, filter by category, progress | list with progress, search, filter | `CustomScrollView` with search, `FilterChipGroup`, `RoadmapCard`s, pull to refresh (sync) |
| Roadmap detail | path visualization, expand/collapse, mark section completed ("nested UI state, tree structures") | sections → topics, expand/collapse, mark section complete | a painted path; expansion state in the Cubit; section completion with a confirmation |
| Topic detail | description, objectives, difficulty, duration, resources, notes, complete, bookmark | the same | the same (resources and notes join in Phases 5 and 4) |
| Completion | `MarkTopicCompletedUseCase`; a stored percentage | the same | one row per topic with its day; percentages derived |
| Dashboard | streak, completed, active roadmap, %, today's goals, next topic, recent notes and challenges (never scheduled in a phase) | the same, in Phase 3 | streak, active roadmap, next topic and totals now; goals, notes and challenges in Phases 4–5 |
| Streak | `CalculateLearningStreakUseCase` | streak helpers | pure `learningStreak` over a `UNION` of active days |
| Confirmations | Compose dialogs | SwiftUI alerts | one adaptive dialog: Material on Android, an iOS alert on iOS |

Both native specs describe the Dashboard's content, but the Android spec never schedules it. Here it arrives with the data it needs and grows as goals, notes and challenges land.

---

## 🎤 Interview Notes

**Q: How do you load a tree (roadmap → sections → topics) from SQL?**
A: One ordered query with `LEFT JOIN`s, so a section without topics still appears, then a fold in Dart that groups consecutive rows by section. One query means one `watch()` stream: a completion produces one new tree in which every count agrees, instead of several streams that briefly disagree.

**Q: How does the streak survive "I haven't done anything yet today"?**
A: The current streak counts back from today if today has activity, otherwise from yesterday. Only a full missed day breaks it. Days are calendar days (`CalendarDate`), so "consecutive" is plain date arithmetic, immune to time zones and month ends.

**Q: Why is completing a section a single transaction that only touches open topics?**
A: So the topics completed earlier keep their real days (they count for past streak days), and so a failure half-way leaves nothing half-done.

**Q: How does the Dashboard react to a different active roadmap?**
A: The active roadmap comes from the settings stream; `distinct` drops repeats and `switchMap` cancels the old path query and starts the new one. The result is combined with the activity and the totals with `combineLatest`.

**Q: How do you make a dialog feel native on both platforms?**
A: `showAdaptiveDialog` with `AlertDialog.adaptive`, which builds a `CupertinoAlertDialog` on iOS, and actions chosen by `Theme.of(context).platform`: `CupertinoDialogAction` on iOS, `TextButton` elsewhere. Tests set the theme's platform to check both.

---

## 📝 Learning Checklist

- ✅ Load and fold a tree from one ordered join
- ✅ Make writes idempotent and section-wide in one transaction
- ✅ Watch a `UNION` query with `customSelect(readsFrom:)`
- ✅ Combine and switch streams for a live Dashboard
- ✅ Compute streaks and recommendations as pure functions
- ✅ Paint a path with `CustomPainter` beside dynamic content
- ✅ Adapt dialogs and pull-to-refresh to each platform
- ⬜ Notes and goals (Phase 4)

---

## 🚀 Future Improvements

- **Phase 4:** notes (Markdown, attached to topics) and goals (daily, weekly, monthly), with today's goals and recent notes on the Dashboard.
- **Phase 5:** challenges, resources (on Topic detail too) and global search.
- **Later:** reorderable custom roadmaps, and prerequisites between topics.
