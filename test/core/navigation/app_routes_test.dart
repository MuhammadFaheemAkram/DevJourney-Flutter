import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/onboarding_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('tab routes have their own paths', () {
    expect(const DashboardRoute().location, '/dashboard');
    expect(const RoadmapsRoute().location, '/roadmaps');
    expect(const ChallengesRoute().location, '/challenges');
    expect(const AnalyticsRoute().location, '/analytics');
    expect(const SettingsRoute().location, '/settings');
  });

  test('screens above the tabs build their locations from typed data', () {
    expect(
      const RoadmapDetailRoute(roadmapId: 'flutter').location,
      '/roadmaps/flutter',
    );
    expect(
      const TopicDetailRoute(topicId: 'flutter-streams').location,
      '/topics/flutter-streams',
    );
    expect(const NotesRoute().location, '/notes');
    expect(const NewNoteRoute().location, '/notes/new');
    expect(const NoteEditorRoute(noteId: 'n1').location, '/notes/n1');
    expect(const GoalsRoute().location, '/goals');
    expect(
      const ChallengeDetailRoute(challengeId: 'c1').location,
      '/challenges/c1',
    );
    expect(const ResourcesRoute().location, '/resources');
    expect(const SearchRoute().location, '/search');
    expect(const AboutRoute().location, '/about');
  });

  test("the gate's constants match the typed routes", () {
    expect(const WelcomeRoute().location, welcomePath);
    expect(const DashboardRoute().location, dashboardPath);
  });
}
