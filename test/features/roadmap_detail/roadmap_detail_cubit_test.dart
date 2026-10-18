import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  RoadmapDetailCubit cubitFor(String roadmapId) {
    final cubit = RoadmapDetailCubit(
      stack.watchRoadmapPath,
      stack.watchSettings,
      stack.setSectionCompleted,
      stack.setActiveRoadmap,
      roadmapId,
    )..load();
    addTearDown(cubit.close);
    return cubit;
  }

  test('opens on the section with the next topic', () async {
    final cubit = cubitFor('flutter');

    final state = await waitFor(cubit, (s) => s.path != null && s.isActive);

    expect(state.expandedSectionIds, {'flutter-architecture'});
  });

  test('sections open and close, and stay so as the path changes', () async {
    final cubit = cubitFor('flutter');
    await waitFor(cubit, (s) => s.path != null);

    cubit.toggleSection('flutter-dart');
    await stack.setTopicCompleted('flutter-state', completed: true);
    final state = await waitFor(cubit, (s) => s.path!.completedTopics == 8);

    expect(state.expandedSectionIds, {'flutter-architecture', 'flutter-dart'});
    cubit.toggleSection('flutter-architecture');
    expect(cubit.state.expandedSectionIds, {'flutter-dart'});
  });

  test('completing a section says how many topics it completed', () async {
    final cubit = cubitFor('flutter');
    await waitFor(cubit, (s) => s.path != null);

    await cubit.setSectionCompleted('flutter-architecture', completed: true);

    expect(cubit.state.message, '3 topics completed');
    final state = await waitFor(cubit, (s) => s.path!.completedTopics == 10);
    expect(state.path!.sections[2].isComplete, isTrue);

    await cubit.setSectionCompleted('flutter-architecture', completed: false);
    expect(cubit.state.message, 'Section marked as not done');
  });

  test('another roadmap can become the active one', () async {
    final cubit = cubitFor('backend');
    expect((await waitFor(cubit, (s) => s.path != null)).isActive, isFalse);

    await cubit.setActive();

    expect(stack.settings.current.activeRoadmapId, 'backend');
    await waitFor(cubit, (s) => s.isActive);
  });

  test('a roadmap that is gone: not found', () async {
    final cubit = cubitFor('nope');

    await waitFor(cubit, (s) => s.status == RoadmapDetailStatus.notFound);
  });
}
