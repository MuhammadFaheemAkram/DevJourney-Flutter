import 'package:dev_journey/features/about/about_page.dart';
import 'package:dev_journey/features/analytics/analytics_page.dart';
import 'package:dev_journey/features/challenge_detail/challenge_detail_page.dart';
import 'package:dev_journey/features/challenges/challenges_page.dart';
import 'package:dev_journey/features/dashboard/dashboard_page.dart';
import 'package:dev_journey/features/goals/goals_page.dart';
import 'package:dev_journey/features/note_editor/note_editor_page.dart';
import 'package:dev_journey/features/notes/notes_page.dart';
import 'package:dev_journey/features/resources/resources_page.dart';
import 'package:dev_journey/features/roadmap_detail/roadmap_detail_page.dart';
import 'package:dev_journey/features/roadmaps/roadmaps_page.dart';
import 'package:dev_journey/features/search/search_page.dart';
import 'package:dev_journey/features/settings/settings_page.dart';
import 'package:dev_journey/features/shell/main_shell.dart';
import 'package:dev_journey/features/topic_detail/topic_detail_page.dart';
import 'package:dev_journey/features/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

part 'app_routes.g.dart';

// Typed routes: every destination is a class, and `go_router_builder`
// generates its path parsing, `location` getter and `go`/`push` helpers. A
// typo or a missing parameter is a compile error instead of a runtime "page
// not found".
//
// The tree has three parts:
// 1. Welcome, shown until the user has started (first launch);
// 2. the tab shell: five tabs, as in the Android edition's bottom bar;
// 3. root-level screens, pushed *above* the shell: the details, and the
//    drawer's destinations (Notes, Goals, Resources, Search, About).

// ---------------------------------------------------------------------------
// 1. Welcome

@TypedGoRoute<WelcomeRoute>(path: '/welcome')
class WelcomeRoute extends GoRouteData with $WelcomeRoute {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomePage();
}

// ---------------------------------------------------------------------------
// 2. The tab shell

/// `StatefulShellRoute` gives every tab its own Navigator and keeps inactive
/// tabs alive in an IndexedStack, so switching tabs preserves each tab's
/// state (a search, a filter, a scroll position).
@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<DashboardBranch>(
      routes: [TypedGoRoute<DashboardRoute>(path: '/dashboard')],
    ),
    TypedStatefulShellBranch<RoadmapsBranch>(
      routes: [TypedGoRoute<RoadmapsRoute>(path: '/roadmaps')],
    ),
    TypedStatefulShellBranch<ChallengesBranch>(
      routes: [TypedGoRoute<ChallengesRoute>(path: '/challenges')],
    ),
    TypedStatefulShellBranch<AnalyticsBranch>(
      routes: [TypedGoRoute<AnalyticsRoute>(path: '/analytics')],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [TypedGoRoute<SettingsRoute>(path: '/settings')],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainShell(navigationShell: navigationShell);
  }
}

// A named navigator key per tab makes each back stack addressable (and
// readable in debugging tools).

class DashboardBranch extends StatefulShellBranchData {
  const DashboardBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'dashboardTab');
}

class RoadmapsBranch extends StatefulShellBranchData {
  const RoadmapsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'roadmapsTab');
}

class ChallengesBranch extends StatefulShellBranchData {
  const ChallengesBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'challengesTab');
}

class AnalyticsBranch extends StatefulShellBranchData {
  const AnalyticsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'analyticsTab');
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'settingsTab');
}

class DashboardRoute extends GoRouteData with $DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

class RoadmapsRoute extends GoRouteData with $RoadmapsRoute {
  const RoadmapsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RoadmapsPage();
}

class ChallengesRoute extends GoRouteData with $ChallengesRoute {
  const ChallengesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChallengesPage();
}

class AnalyticsRoute extends GoRouteData with $AnalyticsRoute {
  const AnalyticsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AnalyticsPage();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

// ---------------------------------------------------------------------------
// 3. Root-level screens
//
// Declared at the top level, so they live in the *root* Navigator: pushing
// one covers the tab bar, and Back (or the iOS swipe) returns to the tab it
// came from with its state intact. A topic opens from the Dashboard, a
// roadmap, a note and Search, so one route beats a copy per tab.

/// `/roadmaps/:roadmapId`: a roadmap's learning path. (The Roadmaps tab is
/// `/roadmaps`; a top-level route for its details keeps them above the tabs.)
@TypedGoRoute<RoadmapDetailRoute>(path: '/roadmaps/:roadmapId')
class RoadmapDetailRoute extends GoRouteData with $RoadmapDetailRoute {
  const RoadmapDetailRoute({required this.roadmapId});

  final String roadmapId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      RoadmapDetailPage(roadmapId: roadmapId);
}

/// `/topics/:topicId`.
@TypedGoRoute<TopicDetailRoute>(path: '/topics/:topicId')
class TopicDetailRoute extends GoRouteData with $TopicDetailRoute {
  const TopicDetailRoute({required this.topicId});

  final String topicId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TopicDetailPage(topicId: topicId);
}

/// `/notes` (from the drawer), with the editor as a child, so Close returns
/// to the list. `new` is declared before `:noteId`, or "new" would be read
/// as an id.
@TypedGoRoute<NotesRoute>(
  path: '/notes',
  routes: [
    TypedGoRoute<NewNoteRoute>(path: 'new'),
    TypedGoRoute<NoteEditorRoute>(path: ':noteId'),
  ],
)
class NotesRoute extends GoRouteData with $NotesRoute {
  const NotesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NotesPage();
}

/// `/notes/new`: the editor as a full-screen dialog (it slides up and has a
/// Close button), Material's counterpart of an iOS sheet.
class NewNoteRoute extends GoRouteData with $NewNoteRoute {
  const NewNoteRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const NoteEditorPage(),
      );
}

/// `/notes/:noteId`: the same editor, filled in.
class NoteEditorRoute extends GoRouteData with $NoteEditorRoute {
  const NoteEditorRoute({required this.noteId});

  final String noteId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        key: state.pageKey,
        fullscreenDialog: true,
        child: NoteEditorPage(noteId: noteId),
      );
}

/// `/goals` (from the drawer).
@TypedGoRoute<GoalsRoute>(path: '/goals')
class GoalsRoute extends GoRouteData with $GoalsRoute {
  const GoalsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const GoalsPage();
}

/// `/challenges/:challengeId` (the Challenges tab is `/challenges`).
@TypedGoRoute<ChallengeDetailRoute>(path: '/challenges/:challengeId')
class ChallengeDetailRoute extends GoRouteData with $ChallengeDetailRoute {
  const ChallengeDetailRoute({required this.challengeId});

  final String challengeId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ChallengeDetailPage(challengeId: challengeId);
}

/// `/resources` (from the drawer).
@TypedGoRoute<ResourcesRoute>(path: '/resources')
class ResourcesRoute extends GoRouteData with $ResourcesRoute {
  const ResourcesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ResourcesPage();
}

/// `/search` (from the drawer, and the Dashboard's and Roadmaps' app bars).
@TypedGoRoute<SearchRoute>(path: '/search')
class SearchRoute extends GoRouteData with $SearchRoute {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchPage();
}

/// `/about` (from the drawer, and Settings).
@TypedGoRoute<AboutRoute>(path: '/about')
class AboutRoute extends GoRouteData with $AboutRoute {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AboutPage();
}
