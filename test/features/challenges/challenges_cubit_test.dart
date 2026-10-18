import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_cubit.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_state.dart';
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

  Future<ChallengesCubit> open() async {
    final cubit = ChallengesCubit(stack.watchChallenges)..load();
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.status == ChallengesStatus.ready);
    return cubit;
  }

  List<String> visible(ChallengesState state) => [
    for (final item in state.visible) item.challenge.id,
  ];

  test('all twelve, with the demo progress', () async {
    final cubit = await open();

    expect(cubit.state.visible, hasLength(12));
    expect(
      visible(cubit.state.copyWith(challengeStatus: ChallengeStatus.done)),
      ['ch-debounce'],
    );
  });

  test('filters combine, and clear together', () async {
    final cubit = await open()
      ..filterByDifficulty(Difficulty.advanced)
      ..filterByStatus(ChallengeStatus.todo);

    expect(visible(cubit.state), [
      'ch-infinite-list',
      'ch-find-gaps',
      'ch-rate-limiter',
      'ch-news-feed',
    ]);

    cubit.clearFilters();
    expect(cubit.state.isFiltered, isFalse);
    expect(cubit.state.visible, hasLength(12));
  });

  test('a status change elsewhere shows at once', () async {
    final cubit = await open()
      ..filterByStatus(ChallengeStatus.done);

    await stack.setChallengeStatus('ch-lru-cache', ChallengeStatus.done);

    await waitFor(cubit, (s) => s.visible.length == 2);
  });
}
