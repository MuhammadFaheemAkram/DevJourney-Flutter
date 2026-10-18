# Data Model

DevJourney keeps everything in one SQLite database (drift), in two halves that never mix their writes:
- **the catalog:** what the learning API serves (roadmaps, sections, topics, resources, challenges), refreshed by a sync;
- **the user's data:** what the user did or wrote (completions, bookmarks, notes, goals, check-ins, challenge work), which no sync touches.

User tables point at catalog rows by their **stable ids** (`flutter-streams`), so a sync can update a topic's text without losing anyone's progress. A search index, derived from both halves, sits beside them.

## Value types

- **`CalendarDate`:** an extension type over a `yyyymmdd` integer (`20261014`). It is the day something happened in the user's calendar, taken from the injected `Clock` when it happens, so a completion at 23:59 counts for that day. It has no time zone, and comparing and adding days is plain arithmetic. Stored as `INTEGER`.
- **Instants** (`completedAt`, `updatedAt`…) are UTC `DateTime`s, stored as ISO-8601 text (`store_date_time_values_as_text`), so they sort in time order (conventions §11.14).
- **Enums** are stored by name (`textEnum`): `RoadmapCategory`, `Difficulty`, `ResourceType`, `ChallengeCategory`, `ChallengeStatus`, `GoalKind`, `GoalPeriod`. Renaming a value needs a migration.
- **Lists** (topic objectives, challenge hints) are JSON text (`StringListConverter`); **URLs** are text (`UriConverter`).

## Tables (schema v2)

`PRAGMA foreign_keys = ON` runs on every connection: SQLite ships with them off.

### The catalog

| Table | Key | Columns | Relations |
|---|---|---|---|
| `roadmaps` | `id` | title, description, category, sort_order | |
| `roadmap_sections` | `id` | roadmap_id, title, sort_order | → roadmaps `CASCADE` |
| `topics` | `id` | roadmap_id, section_id, title, description, objectives (JSON), difficulty, estimated_minutes (`CHECK > 0`), sort_order | → roadmaps, → sections `CASCADE` |
| `resources` | `id` | title, type, url, source, estimated_minutes (`CHECK > 0`), topic_id?, sort_order | → topics `SET NULL` |
| `challenges` | `id` | title, category, difficulty, prompt, hints (JSON), sort_order | |

Indexes: `sections_by_roadmap (roadmap_id, sort_order)`, `topics_by_section (section_id, sort_order)`, `topics_by_roadmap (roadmap_id)`.

A topic keeps `roadmap_id` beside `section_id`, so counting a roadmap's topics needs no join through sections.

### The user's data

| Table | Key | Columns | Relations |
|---|---|---|---|
| `topic_progress` | `topic_id` | completed_on (day), completed_at | → topics `CASCADE` |
| `topic_bookmarks` | `topic_id` | created_at | → topics `CASCADE` |
| `resource_bookmarks` | `resource_id` | created_at | → resources `CASCADE` |
| `notes` | `id` | topic_id?, title, content (Markdown), created_at, updated_at | → topics `SET NULL` |
| `goals` | `id` | title, kind, period, target (`CHECK 1–50`), created_on (day), created_at | |
| `goal_check_ins` | `id` (auto) | goal_id, day, created_at | → goals `CASCADE` |
| `challenge_states` | `challenge_id` | status, solution_notes, started_at?, completed_on?, updated_at | → challenges `CASCADE` |

Indexes: `topic_progress_by_day (completed_on)`, `notes_by_update (updated_at)`, `check_ins_by_goal_day (goal_id, day)`, `challenge_states_by_day (completed_on)`.

- **One row per completed topic:** completing is `INSERT OR IGNORE` (the first day stays); uncompleting deletes the row.
- **A challenge state exists once a challenge is touched.** Done records `completed_on` the first time; leaving Done clears it; going back to To do clears the start. The upsert writes every column, `null`s included (conventions §11.57).
- **A note outlives its topic** (`SET NULL`); a check-in doesn't outlive its goal (`CASCADE`).

### The search index (v2, `search.drift`)

```sql
CREATE VIRTUAL TABLE search_index USING fts5(
  kind UNINDEXED, ref_id UNINDEXED, title, body,
  tokenize = 'unicode61 remove_diacritics 2'
);
```

| kind | title | body |
|---|---|---|
| `roadmap` | title | description |
| `topic` | title | description + objectives (`json_each`, joined with ". ") |
| `note` | title | content |
| `resource` | title | source ("dart.dev") |
| `challenge` | title | prompt (not the hints) |

**15 triggers** (insert, update, delete on each of the five tables) keep it current inside the same statement as the write. drift reads them, so a watched search re-runs when a note changes. A query is `MATCH ?` with `bm25(search_index, 0, 0, 10, 1)` (the title weighs ten times the body), `highlight()` for the title and `snippet()` for the body, with control-character marks the app turns into ranges.

## What the database refuses

| Rule | How |
|---|---|
| A duration of 0 minutes | `CHECK (estimated_minutes > 0)` |
| A goal target outside 1–50 | `CHECK (target BETWEEN 1 AND 50)` |
| Progress on a topic that doesn't exist | foreign key |
| Two completions of one topic | primary key `topic_id` (+ `INSERT OR IGNORE`) |
| Two bookmarks of one topic or resource | primary key |
| Two states for one challenge | primary key `challenge_id` |

The app checks first (forms, use cases, the payload mappers); the constraints are the last line.

## Derived, never stored

| Figure | Derived from |
|---|---|
| A roadmap's progress | `LEFT JOIN topics … topic_progress … GROUP BY roadmap` |
| A section's progress, the learning path | one ordered `LEFT JOIN` (roadmap → sections → topics → progress → bookmarks), folded into a tree |
| What's next | the first incomplete topic in path order |
| The streak | the active days: a `UNION` of completion days, challenge completion days and check-in days |
| A goal's progress | completions or check-ins whose day falls in the goal's current window (one `UNION ALL` of dated events) |
| Analytics | the same events, grouped per ISO week, per month and per day; roadmap progress; goal windows over 30 days |

See [LEARNING_ENGINE.md](LEARNING_ENGINE.md) for the rules with worked examples.

## Writes that span tables

| Operation | Tables | Transaction |
|---|---|---|
| Catalog sync | the five catalog tables (upsert, parents first) | one |
| Load demo progress | every user table (replace) | one |
| Complete a section | `topic_progress` (only the section's open topics, today) | one |
| Reset progress | `topic_progress`, `topic_bookmarks`, `resource_bookmarks`, `goal_check_ins`, `challenge_states` | one |

**A sync is an upsert** (`INSERT … ON CONFLICT DO UPDATE`): `INSERT OR REPLACE` would delete the old catalog row first, and the delete would cascade to the user's progress, bookmarks and challenge work (conventions §11.53). Rows missing from a newer catalog are kept: catalogs only grow.

## Preferences

`SharedPreferencesWithCache`, loaded before `runApp`, with an allow-list:

| Key | Value |
|---|---|
| `settings.onboarded` | bool |
| `settings.activeRoadmapId` | string |
| `settings.catalogVersion` | int |
| `settings.themeMode` | `system` / `light` / `dark` |
| `settings.dynamicColor` | bool (default true) |
| `settings.reminderEnabled` | bool (only "on" while notifications are allowed) |
| `settings.reminderTime` | `HH:mm` (default `19:00`) |
| `search.recent` | up to five strings |

A missing or damaged value falls back to its default.

## Migrations

| Version | Phase | Change |
|---|---|---|
| 1 | 2 | the catalog and user tables |
| 2 | 5 | `search_index` and its 15 triggers |

- Every version is exported to `drift_schemas/` (`drift_dev make-migrations`), which generates `app_database.steps.dart` and the schema helpers in `test/drift/app_database/generated/`.
- **v1 → v2** creates the index and the triggers, then fills the index from the rows already there (the triggers only see new writes). The SQL is frozen at v2 in the step, so a later change to the triggers adds its own step.
- **Tests:** every upgrade path is validated against a fresh install's schema; a seeded v1 database comes through with its rows kept, its catalog and notes searchable, and its triggers working afterwards. The upgrade was also checked on a real device: a Phase 4 install migrated in place with 86 rows indexed.
