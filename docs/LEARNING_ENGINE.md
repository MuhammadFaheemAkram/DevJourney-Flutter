# Learning Engine

How DevJourney turns rows into progress, recommendations, streaks, goals and analytics. Every figure here is **derived when it's read** from dated rows; none is stored, so none can drift out of date. The functions are pure Dart in `lib/domain/calculation/`, tested without Flutter or a database.

The worked examples use the **demo progress as of Wednesday 14 October 2026** (the tests' `demoNow`), with the demo's events:

| Day | What happened |
|---|---|
| Thu 24 Sep | topic: Dart fundamentals |
| Fri 25 Sep | topic: Null safety |
| Sun 4 Oct | topic: Scalability |
| Tue 6 Oct | topic: Python essentials |
| Thu 8 Oct | topic: Futures and async/await |
| Fri 9 Oct | topics: HTTP and REST, Streams |
| Sat 10 Oct | challenge done: Debounce a stream · check-in: Read for 20 minutes |
| Sun 11 Oct | topic: Widgets and the widget tree · check-in |
| Mon 12 Oct | topic: Layout · check-in |
| Tue 13 Oct | topic: Navigation and routing · check-in |
| Wed 14 Oct | nothing yet |

## Progress

- **A roadmap's progress** = completed topics ÷ topics in the roadmap, counted by SQL (`LEFT JOIN … GROUP BY`) whenever either changes. A roadmap with no topics is 0 %.
- **A section's progress** is the same over the section, read from the one-query learning path.
- **A sync that adds topics lowers the percentage.** That is correct: there is more to learn.

> Flutter Developer: Dart fundamentals, Null safety, Futures and async/await, Streams, Widgets and the widget tree, Layout, Navigation and routing → **7 of 12 (58 %)**. After "Publish a catalog update" and a sync, the new Accessibility topic makes it **7 of 13**.

## What's next (`recommendedTopic`)

The first incomplete topic of the active roadmap, in section order, then topic order. A topic skipped earlier comes back first.

> Dart (4/4) and UI (3/3) are done; Architecture starts with State management → **Next up: State management**. Completing it makes Dependency injection next.

**Completing** is idempotent (`INSERT OR IGNORE`: the first day stays); **completing a section** completes only its open topics, today, in one transaction, so topics done earlier keep their days.

## The streak (`learningStreak`)

- An **active day** has at least one topic completion, challenge completion or goal check-in (a `UNION` of their days).
- The **current streak** counts consecutive active days back from today, **or from yesterday if today has no activity yet**: the streak isn't broken until the day ends.
- One inactive day breaks it. Days are calendar days, so month and year ends can't.
- The **longest streak** is the longest run ever.

> Active days 8–13 October, none on the 7th, none yet today → **6-day streak**, "Learn something today to keep it going". Completing State management today makes it **7, and today counts**.

## Goals (`goalWindow`, `goalProgress`)

A goal has a kind, a period and a target. Its **window** on a day is:
- **daily:** the day;
- **weekly:** the ISO week, Monday to Sunday (`today.addDays(1 - weekday)`), whatever the device's locale;
- **monthly:** the calendar month.

**Progress** = the goal's events whose day falls in the current window: topic completions, challenge completions, or this goal's check-ins (custom goals). Nothing resets anything: a new window simply counts from zero. A custom goal takes check-ins only up to its target, and Undo removes the latest check-in of the current window only.

> This week is Mon 12 – Sun 18 October.
> - Complete 3 topics a week: Layout, Navigation → **2 of 3**, resets Monday.
> - Solve a challenge every week: the Debounce was finished on Saturday 10th, last week → **0 of 1**.
> - Finish 10 topics this month: 4, 6, 8, 9 (×2), 11, 12, 13 October → **8 of 10**.
> - Read for 20 minutes (daily, custom): no check-in today → **0 of 1**, resets tomorrow.

## Goal completion rate (`goalCompletionRate`)

Over the last 30 days, each goal contributes its periods that overlap those days and **began after it was created** (a goal can't be missed before it existed):
- a period that has **ended** counts, met or not;
- the **current** period counts only once it's met (it hasn't been missed yet).

> The demo's goals were created on Wed 30 September.
> - weekly topics: the week of 5 Oct had 5 (met), the week of 28 Sep had 1 (missed); this week isn't met yet → **1 of 2**;
> - monthly topics: September had 2 of 10 (missed); October isn't met yet → **0 of 1**;
> - weekly challenge: met the week of 5 Oct, missed the week of 28 Sep → **1 of 2**;
> - daily reading: 30 Sep – 13 Oct is 14 days, met on 10–13 Oct → **4 of 14**.
>
> **6 of 19 periods (32 %)**.

## Analytics series

- **Weekly** (`weeklyCompletions`): topics completed per ISO week, the last 8 weeks, oldest first, empty weeks as zero.
  > Weeks starting 24 Aug … 12 Oct: **0, 0, 0, 0, 2, 1, 5, 2**.
- **Monthly** (`monthlyCompletions`): topics per calendar month, the last 6.
  > May … October: **0, 0, 0, 0, 2, 8**.
- **Heatmap** (`activityByDay`): completions and check-ins per day over 26 weeks, starting on a Monday so the last column is this week; five shades (none, 1, 2, 3, 4+).
  > **10 active days, 15 events**.
- **Totals:** topics completed of every topic in the catalog (**10 of 32, 31 %**), challenges solved (**1**).

## Search ranking

- User text becomes a safe FTS5 query (`ftsQuery`): each word quoted (so `AND`, `NEAR`, `*`, `-` and quotes mean nothing), all words required, the last one a prefix.
- Results are ranked by **bm25**, with a match in the title weighted ten times a match in the body, then grouped by kind (Roadmaps, Topics, Notes, Resources, Challenges), each group best first.

> "strea" → `"strea"*`. The Streams topic (title match) ranks above State management (body: "…Blocs and streams").

## Where to look

| Rule | Code | Tests |
|---|---|---|
| Progress, the path | `LearningDao.watchPath`, `pathFromRows` | `learning_dao_test.dart` |
| What's next | `recommendation.dart` | `recommendation_test.dart` |
| Streak | `streak.dart` | `streak_test.dart`, `watch_dashboard_use_case_test.dart` |
| Goals | `goals.dart` | `goals_test.dart`, `notes_goals_use_cases_test.dart` |
| Goal rate, series | `goals.dart`, `analytics.dart` | `analytics_test.dart`, `settings_use_cases_test.dart` (the demo by hand) |
| Search | `fts_query.dart`, `search.drift`, `SearchDao` | `fts_query_test.dart`, `search_dao_test.dart` |
