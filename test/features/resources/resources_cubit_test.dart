import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/resources/cubit/resources_cubit.dart';
import 'package:dev_journey/features/resources/cubit/resources_state.dart';
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

  Future<ResourcesCubit> open() async {
    final cubit = ResourcesCubit(
      stack.watchResources,
      stack.bookmarkResource,
      stack.openLink,
    )..load();
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.status == ResourcesStatus.ready);
    return cubit;
  }

  test('search matches the title, the source and the topic', () async {
    final cubit = await open();

    cubit.search('youtube');
    final videos = cubit.state.visible;
    expect(videos, isNotEmpty);
    expect(videos.every((i) => i.resource.source == 'youtube.com'), isTrue);

    cubit.search('NULL SAFETY');
    expect([
      for (final item in cubit.state.visible) item.resource.id,
    ], contains('res-null-safety'));
  });

  test('type and Saved narrow it down', () async {
    final cubit = await open()
      ..filterByType(ResourceType.video);
    expect(
      cubit.state.visible.every((i) => i.resource.type == ResourceType.video),
      isTrue,
    );

    cubit
      ..filterByType(null)
      ..showSavedOnly(savedOnly: true);
    // The demo saved some: every one shown is saved.
    expect(cubit.state.visible, isNotEmpty);
    expect(cubit.state.visible.every((i) => i.bookmarked), isTrue);
  });

  test('bookmarking toggles, and shows live', () async {
    final cubit = await open();
    final item = cubit.state.resources.firstWhere((i) => !i.bookmarked);

    await cubit.toggleBookmark(item);

    await waitFor(
      cubit,
      (s) => s.resources.any(
        (i) => i.resource.id == item.resource.id && i.bookmarked,
      ),
    );
  });

  test('opening: the link goes to the in-app browser', () async {
    final cubit = await open();
    final item = cubit.state.resources.first;

    await cubit.open(item);

    expect(stack.links.opened, [item.resource.url]);
  });

  test('a link the platform can not open: says so', () async {
    final cubit = await open();
    stack.links.succeeds = false;

    await cubit.open(cubit.state.resources.first);

    expect(cubit.state.message, "Couldn't open the link.");
    expect(cubit.state.messageSerial, 1);
  });
}
