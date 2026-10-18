import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;
  late RoadmapsCubit cubit;

  setUp(() async {
    stack = DataStack();
    await stack.loadDemo();
    cubit = RoadmapsCubit(
      stack.watchRoadmaps,
      stack.watchSettings,
      stack.syncCatalog,
    )..load();
  });
  tearDown(() async {
    await cubit.close();
    await stack.close();
  });

  List<String> visibleTitles() => [
    for (final r in cubit.state.visible) r.roadmap.title,
  ];

  test('every roadmap, with progress, and which one is active', () async {
    final state = await waitFor(
      cubit,
      (s) => s.roadmaps != null && s.activeRoadmapId != null,
    );

    expect(state.activeRoadmapId, 'flutter');
    expect(
      [for (final r in state.visible) (r.roadmap.id, r.completedTopics)],
      [
        ('flutter', 7),
        ('backend', 2),
        ('ai-engineer', 0),
        ('system-design', 1),
      ],
    );
  });

  test(
    'search matches titles and descriptions; the category narrows it',
    () async {
      await waitFor(cubit, (s) => s.roadmaps != null);

      cubit.search('python');
      expect(visibleTitles(), ['Backend Developer']);

      cubit
        ..search('')
        ..filter(RoadmapCategory.ai);
      expect(visibleTitles(), ['AI Engineer']);

      cubit.search('flutter');
      expect(visibleTitles(), isEmpty);
      expect(cubit.state.isFiltering, isTrue);
    },
  );

  test('refreshing an up-to-date catalog says so', () async {
    await cubit.refresh();

    expect(cubit.state.message, 'Everything is up to date');
    expect(cubit.state.messageSerial, 1);
  });
}
