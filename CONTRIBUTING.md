# Contributing to DevJourney (Flutter)

Thanks for your interest! DevJourney is a learning-focused reference project, so contributions that improve clarity, correctness or teaching value are especially welcome.

## Ground Rules

- Be respectful. See the [Code of Conduct](CODE_OF_CONDUCT.md).
- **Keep the architecture intact:**
  - Respect the layer boundaries: View → Cubit/Bloc → UseCase → Repository → drift.
  - `domain/` stays pure Dart, Views never import `data/`, and drift files never import `material_ui`.
  - **The catalog and the user's data stay apart.** A sync upserts catalog rows (`ON CONFLICT DO UPDATE`, never `REPLACE`) and never writes a user table.
  - **Nothing derived is stored:** no percentage, count, streak or goal progress column. Screens watch rows and pure functions derive the figures.
  - **Days are `CalendarDate`, and "today" comes from the injected `Clock`**, never `DateTime.now()`.
  - **Platform services stay behind `domain/service` interfaces** (`ReminderScheduler`, `LinkOpener`, `DynamicColorSource`, `DeveloperTools`), so no plugin is reachable from a Cubit or use case test.
  - **The router owns navigation decisions.** Screens use typed routes only.
- **UI:** import `package:material_ui/material_ui.dart`, never `package:flutter/material.dart`. A third-party widget built on `flutter/material.dart` doesn't see the app's theme: style it explicitly (conventions §11.55, `NoteMarkdown`).
- **Search:** user text reaches FTS5 only through `ftsQuery`. The index is written only by the triggers in `search.drift`.
- **Links:** open them only through `OpenLinkUseCase` (https only).
- **Dependencies:** keep them few and mainstream, and explain each new one in the README's tech stack.

## Development Setup

- Install [FVM](https://fvm.app), then run `fvm install`. It reads `.fvmrc`, which pins Flutter 3.47.6.
- iOS needs Xcode. Android needs the Android SDK and Java 17+ (Android Studio's bundled JDK works).
- Get the packages with `fvm flutter pub get`, then start the app with `fvm flutter run` and choose **Explore with demo progress**.
- After changing annotated code (freezed, json_serializable, injectable, drift, typed routes), regenerate it:

  ```bash
  fvm dart run build_runner build
  ```

  Generated files are committed, and CI fails if they are stale.
- **Changing the database schema:**
  1. Bump `schemaVersion` in `app_database.dart`.
  2. Run `fvm dart run drift_dev make-migrations`. It exports the new version to `drift_schemas/` and regenerates the steps and the migration tests.
  3. Write the new step in `stepByStep`. Anything derived from existing rows (like the search index) needs filling in that step.
  4. Add a data test in `test/drift/app_database/migration_test.dart`.
  5. If you add a trigger to a `.drift` file, check the generated code has it: drift silently drops a trigger that calls `replace()` (conventions §11.56).
- **Changing the catalog or the demo:** keep ids stable (user data points at them) and demo dates relative (`daysAgo`). `test/data/bundled_content_test.dart` loads the bundled files; tests that assert the demo's figures say which numbers they expect.

## Coding Conventions

- **Lints:** `fvm flutter analyze` must report **no issues**. The rules are `flutter_lints` plus strict casts, inference and raw types.
- **Formatting:** `fvm dart format .` (the tall style).
- **Pages and Views:** Pages create and provide a Cubit/Bloc. Views render state and forward intents.
- **Cubit or Bloc:** use a Cubit by default. Use a Bloc only when event transformers (debounce, `restartable`) earn their place, as in `SearchBloc`.
- **Writes return a `Result`** and never throw (`guardWrite`); validation rules are pure functions shared by forms and use cases.
- **Immutable state:** freezed classes and sealed unions, rendered with an exhaustive `switch`.
- **Accessibility:** every tappable is at least 48 × 48 and has a label, text contrast meets WCAG AA in both themes, and color is never the only signal. Above 130 % text (`context.prefersStackedLayout`), side-by-side controls stack. Charts carry a written summary. The accessibility tour (`test/app/accessibility_tour_test.dart`) checks this, so add new screens and states to it.
- **Comments** explain *decisions*, not obvious code.

## Commits

This project uses **[Conventional Commits](https://www.conventionalcommits.org/)**:

```
<type>(<scope>): <message>
```

Examples: `feat(goals): add a yearly period`, `test(search): cover a hyphenated query`, `docs(project): update the data model`.

## Pull Requests

1. Fork the repository and create a topic branch.
2. Make sure `fvm flutter analyze`, `fvm dart format --output=none --set-exit-if-changed .` and `fvm flutter test` all pass.
3. Update or add documentation where relevant.
4. Open a PR with a clear description of the change and its motivation.

## Tests

- **Cubits/Blocs:** on the real data stack (`DataStack` in `test/helpers/`: real repositories, an in-memory database, the real fake service, a fixed clock, fake scheduler and link opener), with `waitFor` for bounded waits.
- **Views:** widget tests with `MockCubit` / `MockBloc` from `bloc_test`, and `mocktail`.
- **drift:** `NativeDatabase.memory()`, including FTS5.
- **Timing:** debounce timing in fake time (`fake_async`) with a stubbed source; anything that switches streams in real time with a short delay.
- **App-level flows:** `pumpDevJourney`, with `tearDown(getIt.reset)`. A plugin touched while the graph is built needs its channel mocked in `configureTestDependencies` (conventions §11.58).
- **Figures:** assert numbers worked out by hand from the demo. See [docs/TESTING.md](docs/TESTING.md).
