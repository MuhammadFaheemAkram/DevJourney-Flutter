# Roadmap

All seven build phases are complete. These are natural next steps, roughly in order of learning value.

## Done

- ✅ **Phase 1 — Foundation:** FVM toolchain, `material_ui`, the design system base, typed routes with an onboarding gate, five tabs and a navigation drawer, CI, an accessibility tour from day one.
- ✅ **Phase 2 — Data layer:** the catalog and user tables in drift v1, the fake learning API, a validated upsert sync, demo progress with relative dates, Welcome.
- ✅ **Phase 3 — Roadmaps and topics:** derived progress, the learning path as one query, the recommendation and the streak, the Dashboard.
- ✅ **Phase 4 — Notes and goals:** Markdown notes with Undo, goals per ISO week and month, check-ins, derived goal progress.
- ✅ **Phase 5 — Challenges, resources and search:** FTS5 with triggers (drift v2), `SearchBloc`, challenges with autosaved notes, resources in the in-app browser.
- ✅ **Phase 6 — Analytics, settings and reminders:** charts and a heatmap, the goal completion rate, dynamic color, a real daily reminder on both platforms, reset, a catalog update to sync.
- ✅ **Phase 7 — Documentation and CI:** the docs, screenshots and community files, and mutation checks of the key behaviours.

## Next ideas

- **A smarter reminder:** skip days that are already active, or remind about a goal close to its target (a background check with `workmanager`).
- **Custom roadmaps:** the user's own sections and topics, kept apart from the catalog like the rest of their data.
- **Prerequisites between topics,** shown on the path, with the recommendation respecting them.
- **Spaced repetition:** resurface completed topics and notes after 1, 3, 7 and 30 days.
- **Search filters by kind** and typo tolerance (FTS5's `trigram` tokenizer).
- **A real backend** behind `LearningService`: pagination, ETags for "Everything is up to date", and syncing the user's data across devices.
- **Export and import:** progress and notes as JSON or Markdown files.
- **Home-screen widgets:** the streak and the next topic (`home_widget`).
- **Adaptive layout:** a `NavigationRail` on tablets and in landscape, with the path and a topic side by side.
- **Localization:** `flutter_localizations` + `gen-l10n`, with dates and numbers in the user's locale.
- **Syntax highlighting** in notes' code blocks.
- **Integration tests** on devices (`integration_test`), and golden tests for the charts and the heatmap.
- **CI:** an iOS simulator build on a macOS runner, and coverage reporting.
- **A screen-reader pass on devices:** TalkBack and VoiceOver reading order. The tour checks labels, tap targets and contrast, but not the order.
