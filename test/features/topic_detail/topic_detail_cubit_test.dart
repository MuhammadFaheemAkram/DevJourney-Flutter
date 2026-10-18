import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_cubit.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() async {
    stack = DataStack(); // 14 October 2026
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  TopicDetailCubit cubitFor(String topicId) {
    final cubit = TopicDetailCubit(
      stack.watchTopic,
      stack.setTopicCompleted,
      stack.bookmarkTopic,
      stack.clock,
      topicId,
    )..load();
    addTearDown(cubit.close);
    return cubit;
  }

  test('the topic with where it sits and its state', () async {
    final cubit = cubitFor('flutter-streams');

    final details = (await waitFor(cubit, (s) => s.details != null)).details!;

    expect(details.roadmap.title, 'Flutter Developer');
    expect(details.section.title, 'Dart');
    expect(details.item.completedOn, CalendarDate(2026, 10, 9));
  });

  test('complete, then undo, with the same button', () async {
    final cubit = cubitFor('flutter-state');
    await waitFor(cubit, (s) => s.details != null);

    await cubit.toggleCompleted();
    final done = await waitFor(cubit, (s) => s.details!.item.isCompleted);
    expect(done.details!.item.completedOn, CalendarDate(2026, 10, 14));

    await cubit.toggleCompleted();
    await waitFor(cubit, (s) => !s.details!.item.isCompleted);
  });

  test('bookmark and unbookmark', () async {
    final cubit = cubitFor('flutter-di');
    await waitFor(cubit, (s) => s.details != null);

    await cubit.toggleBookmark();
    await waitFor(cubit, (s) => s.details!.item.bookmarked);
    await cubit.toggleBookmark();
    await waitFor(cubit, (s) => !s.details!.item.bookmarked);
  });

  test('a topic that is gone: not found', () async {
    final cubit = cubitFor('nope');

    await waitFor(cubit, (s) => s.status == TopicDetailStatus.notFound);
  });
}
