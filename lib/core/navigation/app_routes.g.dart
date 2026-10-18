// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $welcomeRoute,
  $mainShellRoute,
  $roadmapDetailRoute,
  $topicDetailRoute,
  $notesRoute,
  $goalsRoute,
  $challengeDetailRoute,
  $resourcesRoute,
  $searchRoute,
  $aboutRoute,
];

RouteBase get $welcomeRoute => GoRouteData.$route(
  path: '/welcome',
  hasOverriddenOnExit: false,
  factory: $WelcomeRoute._fromState,
);

mixin $WelcomeRoute on GoRouteData {
  static WelcomeRoute _fromState(GoRouterState state) => const WelcomeRoute();

  @override
  String get location => GoRouteData.$location('/welcome');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRoute => StatefulShellRouteData.$route(
  factory: $MainShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: DashboardBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          hasOverriddenOnExit: false,
          factory: $DashboardRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: RoadmapsBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/roadmaps',
          hasOverriddenOnExit: false,
          factory: $RoadmapsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: ChallengesBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/challenges',
          hasOverriddenOnExit: false,
          factory: $ChallengesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: AnalyticsBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/analytics',
          hasOverriddenOnExit: false,
          factory: $AnalyticsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: SettingsBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/settings',
          hasOverriddenOnExit: false,
          factory: $SettingsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin $DashboardRoute on GoRouteData {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  @override
  String get location => GoRouteData.$location('/dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $RoadmapsRoute on GoRouteData {
  static RoadmapsRoute _fromState(GoRouterState state) => const RoadmapsRoute();

  @override
  String get location => GoRouteData.$location('/roadmaps');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChallengesRoute on GoRouteData {
  static ChallengesRoute _fromState(GoRouterState state) =>
      const ChallengesRoute();

  @override
  String get location => GoRouteData.$location('/challenges');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AnalyticsRoute on GoRouteData {
  static AnalyticsRoute _fromState(GoRouterState state) =>
      const AnalyticsRoute();

  @override
  String get location => GoRouteData.$location('/analytics');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $roadmapDetailRoute => GoRouteData.$route(
  path: '/roadmaps/:roadmapId',
  hasOverriddenOnExit: false,
  factory: $RoadmapDetailRoute._fromState,
);

mixin $RoadmapDetailRoute on GoRouteData {
  static RoadmapDetailRoute _fromState(GoRouterState state) =>
      RoadmapDetailRoute(roadmapId: state.pathParameters['roadmapId']!);

  RoadmapDetailRoute get _self => this as RoadmapDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/roadmaps/${Uri.encodeComponent(_self.roadmapId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $topicDetailRoute => GoRouteData.$route(
  path: '/topics/:topicId',
  hasOverriddenOnExit: false,
  factory: $TopicDetailRoute._fromState,
);

mixin $TopicDetailRoute on GoRouteData {
  static TopicDetailRoute _fromState(GoRouterState state) =>
      TopicDetailRoute(topicId: state.pathParameters['topicId']!);

  TopicDetailRoute get _self => this as TopicDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/topics/${Uri.encodeComponent(_self.topicId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notesRoute => GoRouteData.$route(
  path: '/notes',
  hasOverriddenOnExit: false,
  factory: $NotesRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'new',
      hasOverriddenOnExit: false,
      factory: $NewNoteRoute._fromState,
    ),
    GoRouteData.$route(
      path: ':noteId',
      hasOverriddenOnExit: false,
      factory: $NoteEditorRoute._fromState,
    ),
  ],
);

mixin $NotesRoute on GoRouteData {
  static NotesRoute _fromState(GoRouterState state) => const NotesRoute();

  @override
  String get location => GoRouteData.$location('/notes');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NewNoteRoute on GoRouteData {
  static NewNoteRoute _fromState(GoRouterState state) =>
      NewNoteRoute(topicId: state.uri.queryParameters['topic-id']);

  NewNoteRoute get _self => this as NewNoteRoute;

  @override
  String get location => GoRouteData.$location(
    '/notes/new',
    queryParams: {if (_self.topicId != null) 'topic-id': _self.topicId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NoteEditorRoute on GoRouteData {
  static NoteEditorRoute _fromState(GoRouterState state) =>
      NoteEditorRoute(noteId: state.pathParameters['noteId']!);

  NoteEditorRoute get _self => this as NoteEditorRoute;

  @override
  String get location =>
      GoRouteData.$location('/notes/${Uri.encodeComponent(_self.noteId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $goalsRoute => GoRouteData.$route(
  path: '/goals',
  hasOverriddenOnExit: false,
  factory: $GoalsRoute._fromState,
);

mixin $GoalsRoute on GoRouteData {
  static GoalsRoute _fromState(GoRouterState state) => const GoalsRoute();

  @override
  String get location => GoRouteData.$location('/goals');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $challengeDetailRoute => GoRouteData.$route(
  path: '/challenges/:challengeId',
  hasOverriddenOnExit: false,
  factory: $ChallengeDetailRoute._fromState,
);

mixin $ChallengeDetailRoute on GoRouteData {
  static ChallengeDetailRoute _fromState(GoRouterState state) =>
      ChallengeDetailRoute(challengeId: state.pathParameters['challengeId']!);

  ChallengeDetailRoute get _self => this as ChallengeDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/challenges/${Uri.encodeComponent(_self.challengeId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resourcesRoute => GoRouteData.$route(
  path: '/resources',
  hasOverriddenOnExit: false,
  factory: $ResourcesRoute._fromState,
);

mixin $ResourcesRoute on GoRouteData {
  static ResourcesRoute _fromState(GoRouterState state) =>
      const ResourcesRoute();

  @override
  String get location => GoRouteData.$location('/resources');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $searchRoute => GoRouteData.$route(
  path: '/search',
  hasOverriddenOnExit: false,
  factory: $SearchRoute._fromState,
);

mixin $SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  @override
  String get location => GoRouteData.$location('/search');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $aboutRoute => GoRouteData.$route(
  path: '/about',
  hasOverriddenOnExit: false,
  factory: $AboutRoute._fromState,
);

mixin $AboutRoute on GoRouteData {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  @override
  String get location => GoRouteData.$location('/about');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
