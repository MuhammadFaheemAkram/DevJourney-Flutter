import 'package:dev_journey/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('follows the summary live', () async {
    final stack = DataStack();
    addTearDown(stack.close);
    await stack.loadDemo();
    final cubit = DashboardCubit(stack.watchDashboard)..load();
    addTearDown(cubit.close);

    await waitFor(cubit, (s) => s.summary?.topicsCompleted == 10);
    await stack.setTopicCompleted('flutter-state', completed: true);

    final state = await waitFor(cubit, (s) => s.summary?.topicsCompleted == 11);
    expect(state.summary!.streak.todayCounts, isTrue);
  });
}
