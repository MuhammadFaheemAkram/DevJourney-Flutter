# Phase 1 — Foundation

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 1, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 1 builds the frame every later phase hangs on:
- a **pinned toolchain** and strict analysis, with CI from the first commit;
- a **design system base:** themes, the learning colors, tokens and the shared state views;
- **navigation:** an onboarding gate, five tabs as in the Android edition, a navigation drawer for the screens that don't fit in a tab bar, and every screen above the tabs reachable by a typed route and by a link;
- **placeholder screens** with their final app bars, so the shape of the app is visible and testable now;
- an **accessibility tour** that checks every screen from day one.

---

## 🧱 What Was Implemented

- **Project:** `dev_journey` (org `co.bitfuse.flutter`, display name "DevJourney"), Flutter 3.47.6 pinned by FVM, Android and iOS, `material_ui`.
- **Quality gates:** `analysis_options.yaml` (flutter_lints plus strict casts, inference and raw types), `build.yaml` (lint-free generated parts), GitHub Actions CI (generated code up to date, format, analyze, test), the MIT license.
- **Design system:**
  - `AppTheme`: Material 3 light and dark themes from an indigo seed (`#4F46E5`), built through `AppTheme.fromScheme(ColorScheme)` so Android's dynamic color can replace the scheme in Phase 6;
  - `AppColors` (a `ThemeExtension`): `success`, `streak`, `beginner`, `intermediate`, `advanced`, each a text color that reaches WCAG AA on the page, cards and filled fields in both themes (tested);
  - spacing, radius and icon-size tokens, `LoadingView`, `ErrorView`, `EmptyStateView`, `SectionHeader`, and the large-text rule (`prefersStackedLayout`).
- **Navigation (typed `go_router` routes):**
  - `/welcome`, gated by the pure `onboardingRedirect(onboarded, location)` and a `refreshListenable`;
  - a `StatefulShellRoute` with five tabs: Dashboard, Roadmaps, Challenges, Analytics, Settings;
  - above the tabs: `/roadmaps/:roadmapId`, `/topics/:topicId`, `/challenges/:challengeId`, `/notes` with `/notes/new` and `/notes/:noteId` (the editor, as a full-screen dialog), `/goals`, `/resources`, `/search`, `/about`;
  - "Page not found" for an unknown location, with a way back.
- **The shell:** a `NavigationBar` whose labels keep their size at any text setting, and the **navigation drawer** on the shell's outer `Scaffold` (so it covers the tab bar), opened from every tab's menu button through a small `ShellDrawerScope`. The Dashboard and Roadmaps also have a Search button.
- **Screens:** Welcome ("Start learning", "Explore with demo progress"), the five tabs, the details, Notes, the note editor, Goals, Resources, Search and About, each with its final app bar. Screens opened by a link get a Close button to a sensible home (conventions §11.47); About opens the open-source licenses.
- **DI:** the `get_it` + `injectable` composition root, with a temporary in-memory `PlaceholderOnboarding` until the saved setting arrives in Phase 2.
- **Tests:** 104.

### Differences from the plan

- **The drawer is built from `ListTile`s, not Material's `NavigationDrawer`.** The accessibility tour found that `NavigationDrawerDestination` lays its label out in a fixed row that overflows at 200 % text, with no way to wrap. `ListTile`s wrap and grow; they keep the Material 3 look (a pill-shaped indicator on the current tab) and report "selected" to screen readers.
- **No adaptive helpers yet:** the first adaptive widgets (switches, dialogs, pull to refresh) arrive with the screens that use them, rather than as unused code.
- **No Goals or Notes FAB yet:** a button that does nothing would only confuse; they arrive in Phase 4 with the forms.

---

## 💙 Flutter / Dart Concepts Demonstrated

- **FVM pinning:** `.fvmrc` makes the Flutter version part of the repository; the machine's global version stays untouched.
- **Typed routes:** `@TypedGoRoute` classes generate `location`, `go` and `push`; a route with a parameter can't be built without it.
- **`StatefulShellRoute.indexedStack`:** a navigator per tab, kept alive, so each tab keeps its stack and scroll position.
- **A drawer above nested Scaffolds:** the drawer belongs to the outer `Scaffold`, and an `InheritedWidget` (`ShellDrawerScope`) lets the inner tab app bars open it. `Scaffold.of(context)` alone would find the tab's own Scaffold.
- **Sealed classes for a menu's results:** `DrawerDestination` is either a `TabDestination(index)` or a `ScreenDestination`, an enum that `implements` the sealed class; the shell handles both with an exhaustive `switch`.
- **Routes above the shell:** declared at the top level, they push on the root navigator, cover the tab bar, and Back (or the iOS edge swipe) returns to the tab.
- **Full-screen dialogs:** `MaterialPage(fullscreenDialog: true)` slides up and shows a Close button: Material's counterpart of an iOS sheet.
- **A pure redirect:** `onboardingRedirect` is a plain function, re-run by the router whenever its `refreshListenable` changes.
- **`ThemeExtension`:** colors Material has no slot for, switching and animating with the theme.
- **`MediaQuery.withNoTextScaling`** for the tab labels, with the label still available through a long press and to screen readers.
- **Accessibility guidelines in tests:** `meetsGuideline(androidTapTargetGuideline / labeledTapTargetGuideline / textContrastGuideline)`.

---

## 🔁 Data Flow (this phase)

```
App start ─▶ configureDependencies() ─▶ DevJourneyApp ─▶ GoRouter(initialLocation: /dashboard)
  redirect: onboardingRedirect(onboarded: PlaceholderOnboarding.onboarded, location)
    not onboarded ─▶ /welcome ── "Start learning" / "Explore…" ─▶ onboarding.complete()
                                     └─ notifyListeners ─▶ refreshListenable ─▶ redirect ─▶ /dashboard
    onboarded ─▶ the tab shell
      menu button ─▶ ShellDrawerScope.openDrawer ─▶ drawer
        tab item ─▶ goBranch(index)        screen item ─▶ push (root navigator)
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `.fvmrc`, `analysis_options.yaml`, `build.yaml`, `.github/workflows/flutter-ci.yml` | Toolchain, lints, codegen, CI. |
| `lib/core/design_system/**` | Theme, colors, tokens, state views, the large-text rule. |
| `lib/core/navigation/app_routes.dart` (+ `.g.dart`) | Every typed route. |
| `lib/core/navigation/app_router.dart`, `onboarding_redirect.dart`, `placeholder_onboarding.dart`, `fallback_close_button.dart` | The router, its gate, and the Close fallback for links. |
| `lib/features/shell/{main_shell,app_navigation_drawer,shell_drawer_scope}.dart` | Tabs and the drawer. |
| `lib/features/*/…_page.dart` | Welcome and the placeholder screens. |
| `lib/app/dev_journey_app.dart`, `lib/di/injection.dart`, `lib/main.dart` | The app root and DI. |
| `test/app/accessibility_tour_test.dart`, `test/core/navigation/*`, `test/helpers/*` | The tour, navigation tests, the app harness. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `AppTheme` | final class (namespace) | Themes from a seed or any `ColorScheme` | `core/design_system/theme` |
| `AppColors` | `ThemeExtension` | Completed, streak and difficulty colors | `core/design_system/theme` |
| `onboardingRedirect` | pure function | Welcome until started | `core/navigation`: one-line unit tests |
| `PlaceholderOnboarding` | `ChangeNotifier` (temporary) | The onboarded flag, in memory | replaced in Phase 2 |
| `MainShell` | StatefulWidget | Tabs and the drawer | `features/shell` |
| `AppTab`, `DrawerDestination` (`TabDestination`, `ScreenDestination`) | enum / sealed class | What the drawer and bar offer | `features/shell` |
| `ShellDrawerScope`, `DrawerMenuButton` | InheritedWidget / widget | Open the drawer from any tab | `features/shell` |

---

## 🌱 Folder Structure Changes

- **New project.** `lib/app`, `lib/core/{design_system,navigation}`, `lib/features/*`, `lib/di`; `test/` mirroring it, plus `test/app` and `test/helpers`.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Project | Compose, Hilt, Navigation Compose | SwiftUI, `AppEnvironment`, `Route` + `Router` | FVM-pinned Flutter, `get_it` + `injectable`, typed `go_router` |
| Tabs | bottom navigation: Dashboard, Roadmaps, Challenges, Analytics, Settings | `TabView` with the same five | `StatefulShellRoute` + `NavigationBar`, the same five |
| Secondary screens | `ModalNavigationDrawer`: Notes, Goals, Resources, Search, About | from the Dashboard or a More menu | a `Drawer` (as Android), plus Search in two app bars |
| Detail screens | Navigation Compose destinations | type-safe pushed routes | typed root-level routes, deep-linkable, with a Close fallback |
| Theme | Material 3, dark mode, dynamic color | light/dark, Dynamic Type | Material 3 from a seed; `fromScheme` ready for dynamic color; large-text rule |
| Placeholders | placeholder screens | placeholders | placeholders with their final app bars, tested |
| CI | Phase 7 | Phase 7 | Phase 1 |
| Accessibility checks | — | — | a test tour of every screen from Phase 1 |

The Android spec's drawer duplicates the tabs and adds four screens; the Flutter edition keeps that layout, because it's what an Android user expects, and adds a Search shortcut for iOS users.

---

## 🎤 Interview Notes

**Q: Why put the drawer on the shell, not on each tab?**
A: A modal drawer should cover the whole screen, including the tab bar. Each tab has its own `Scaffold` for its app bar, and a drawer there would stop above the tab bar. So the drawer lives on the outer shell `Scaffold`, and an `InheritedWidget` hands its `openDrawer` down to the tabs' menu buttons, because `Scaffold.of(context)` in a tab finds the tab's own `Scaffold`.

**Q: Why not use Material's `NavigationDrawer` widget?**
A: Its destinations put the label in a fixed row that can't wrap, so at 200 % text the labels overflowed; the accessibility tour caught it in this phase. `ListTile`s wrap and grow, and with a stadium shape and the secondary container color they look the same.

**Q: How does the app decide between Welcome and the Dashboard?**
A: The router does, with a pure function of two inputs, re-run whenever the onboarding flag changes. Welcome only records the choice; it never navigates.

**Q: How do screens opened by a link get back?**
A: An app bar adds Back only when there's something to pop. A screen opened by a link is the only page, so it gets a Close button that `go`es to a sensible home (Roadmaps for a topic, Challenges for a challenge).

---

## 📝 Learning Checklist

- ✅ Pin Flutter per project with FVM, and gate every commit with CI
- ✅ Build Material 3 themes from a seed, ready for any `ColorScheme`
- ✅ Add app-specific colors with a `ThemeExtension`, contrast-tested
- ✅ Declare typed routes, a tab shell, and screens above it
- ✅ Combine a bottom bar with a navigation drawer over nested Scaffolds
- ✅ Gate the app with a pure redirect and a `refreshListenable`
- ✅ Check accessibility guidelines in widget tests
- ⬜ The catalog, the database and Welcome for real (Phase 2)

---

## 🚀 Future Improvements

- **Phase 2:** the domain models, drift, the fake learning API and its catalog, a real Welcome (fetch, pick a roadmap, or explore with demo progress), and the saved onboarding flag.
- **Phase 3:** Roadmaps, the learning path, topics and the Dashboard.
- **Later:** a `NavigationRail` instead of the drawer on tablets and in landscape.
