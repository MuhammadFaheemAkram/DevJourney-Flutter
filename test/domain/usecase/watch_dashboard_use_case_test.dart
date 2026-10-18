import 'package:dev_journey/domain/model/learning_streak.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() => stack = DataStack()); // Wednesday 14 October 2026
  tearDown(() => stack.close());

  test("the demo's Dashboard, worked out by hand", () async {
    await stack.loadDemo();

    final summary = await stack.watchDashboard().first;

    // Active on each of the last six days (completions, a finished
    // challenge, check-ins), not yet today.
    expect(summary.streak, const LearningStreak(current: 6, longest: 6));
    expect(summary.activeRoadmap?.roadmap.title, 'Flutter Developer');
    expect(
      (
        summary.activeRoadmap?.completedTopics,
        summary.activeRoadmap?.totalTopics,
      ),
      (7, 12),
    );
    expect(summary.nextTopic?.topic.title, 'State management');
    expect((summary.topicsCompleted, summary.challengesCompleted), (10, 1));
  });

  test('completing a topic today moves everything at once', () async {
    await stack.loadDemo();
    final summaries = stack.watchDashboard();

    await stack.setTopicCompleted('flutter-state', completed: true);
    final summary = await summaries.firstWhere((s) => s.topicsCompleted == 11);

    expect(
      summary.streak,
      const LearningStreak(current: 7, longest: 7, todayCounts: true),
    );
    expect(summary.nextTopic?.topic.title, 'Dependency injection');
  });

  test('another active roadmap swaps the path', () async {
    await stack.loadDemo();
    final summaries = stack.watchDashboard();

    await stack.setActiveRoadmap('system-design');
    final summary = await summaries.firstWhere(
      (s) => s.activeRoadmap?.roadmap.id == 'system-design',
    );

    expect(summary.nextTopic?.topic.title, 'Consistency and CAP');
  });

  test('a fresh start: no streak, the first topic next', () async {
    await stack.syncCatalogNow();
    await stack.startLearning('backend');

    final summary = await stack.watchDashboard().first;

    expect(summary.streak, const LearningStreak());
    expect(summary.nextTopic?.topic.title, 'Python essentials');
  });
}
