# API Simulation

DevJourney has no server. A **fake learning API** plays one, close enough to a real client that a real one could replace it without changing any caller.

```
LearningService (abstract, lib/core/network)
  └── FakeLearningService
        ├── AssetJsonLoader   → assets/json/catalog_v1.json, catalog_v2.json, demo_progress.json
        ├── NetworkSimulator  → 700 ms per request; fails every request when switched on
        └── CatalogPublisher  → serves v1, or v2 once an update is "published"
```

```dart
abstract interface class LearningService {
  /// The whole catalog: roadmaps → sections → topics, resources, challenges.
  Future<CatalogDto> fetchCatalog();

  /// Sample progress for "Explore with demo progress", with relative dates.
  Future<DemoProgressDto> fetchDemoProgress();
}
```

## The responses

- **Typed DTOs** (`json_serializable`, `checked: true`) in the nested shape a real API would use. A field of the wrong type fails as a `DataFormatException`, not a crash.
- **Catalog v1** (`catalog_v1.json`): 4 roadmaps (Flutter Developer, Backend Developer, AI Engineer, System Design), 14 sections, 32 topics, 35 resources (real public documentation, courses and videos, all `https`), 12 challenges (Dart, UI, SQL, System Design; three levels) with prompts and three hints each.
- **Catalog v2** (`catalog_v2.json`): v1 plus an Observability section in System Design (Logs and metrics, Distributed tracing), an Accessibility topic in Flutter's Quality section, three resources for them, and an edited Backend description: 35 topics, 38 resources.
- **Stable ids** (`flutter-streams`, `res-dart-streams`, `ch-debounce`): the user's data points at them across every sync.
- **Demo progress** (`demo_progress.json`): 10 completions, 2 bookmarked topics, 2 bookmarked resources, 3 notes, 4 goals with check-ins, and 2 challenges (one done, one in progress, both with solution notes). Every date is **relative** (`daysAgo`), resolved against today when it loads, so the demo always shows a live streak and this week's goals.

## Validation before writing

Mappers in `lib/data/mapper/` check a payload completely before anything reaches the database:

| Catalog | Demo progress |
|---|---|
| every id present and unique per kind | no date in the future |
| no blank titles | every topic, resource and challenge it names exists in the catalog |
| durations above 0 minutes | goal targets 1–50 |
| resource URLs `https`, pointing at real topics | check-ins only on custom goals, not before the goal existed |
| the source shown for a resource is derived from its URL ("youtube.com") | notes have titles |
| challenges have a prompt | |

A payload that fails any rule is refused whole: "The learning content looks damaged. Please try again." Nothing is half-written.

## Sync rules

`CatalogRepository.sync()` fetches the catalog, validates it, and **upserts it in one transaction**:
- new rows are inserted and existing rows updated in place by id (`INSERT … ON CONFLICT DO UPDATE`), parents first;
- **the user's tables are never written:** not by a sync, and not by a cascade, because nothing is deleted (`REPLACE` would delete first and cascade; conventions §11.53);
- rows missing from a newer catalog are kept: catalogs only grow;
- the result says what's new ("3 new topics, 3 new resources", or "Everything is up to date"), and the catalog version is saved;
- the triggers re-index every inserted or updated row, so search follows.

A sync runs on Welcome, on pull-to-refresh in Roadmaps, and from Settings → Sync catalog.

## Errors

| Situation | Exception | What the user sees |
|---|---|---|
| Simulated network failure | `NetworkException` | "Couldn't reach the server. Check your connection and try again." (Welcome: Try again) |
| Malformed or invalid content | `DataFormatException` | "The learning content looks damaged. Please try again." |
| Anything else | `UnknownException` | "Something went wrong. Please try again." |

## Developer switches (Settings → Developer)

Both live in memory (`DeveloperTools`) and are off at every launch, as a real server's state would be:
- **Simulate network failure:** every request fails after the delay. Try Welcome on a fresh install, pull-to-refresh, or Sync.
- **Publish a catalog update:** the service serves catalog v2. Sync to receive it: "3 new topics, 3 new resources"; the Flutter roadmap goes from 7 of 12 to 7 of 13, System Design gains a section, and progress is untouched.

## What a restart keeps

| Kept | Reset |
|---|---|
| the catalog (drift), the user's data, the settings, the catalog version | the developer switches: the service serves v1 again. A sync after that brings back v1's text for the edited description and records version 1, while the topics and resources v2 added stay (catalogs only grow) |

## Other outside effects

All behind interfaces, faked in tests:
- **Links** (`LinkOpener`): the in-app browser, `https` only.
- **Notifications** (`ReminderScheduler`): one local, repeating notification.
- **Wallpaper colors** (`DynamicColorSource`): read once before the first frame.
