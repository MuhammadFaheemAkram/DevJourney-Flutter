import 'package:dev_journey/features/analytics/cubit/analytics_cubit.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_state.dart';
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

  test(
    'live: completing a topic today moves the streak and this week',
    () async {
      final cubit = AnalyticsCubit(stack.watchAnalytics)..load();
      addTearDown(cubit.close);
      final before = await waitFor(
        cubit,
        (s) => s.status == AnalyticsStatus.ready,
      );
      expect(before.analytics!.weekly.last.count, 2);

      await stack.setTopicCompleted('flutter-state', completed: true);

      final after = await waitFor(
        cubit,
        (s) => s.analytics!.topicsCompleted == 11,
      );
      expect(after.analytics!.weekly.last.count, 3);
      expect(after.analytics!.streak.current, 7);
      expect(after.analytics!.streak.todayCounts, isTrue);
    },
  );
}
