import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.syncCatalogNow();
  });
  tearDown(() => stack.close());

  test('every resource with its topic, none saved yet', () async {
    final items = await stack.resources.watchResources().first;

    expect(items, hasLength(35));
    final first = items.first;
    expect(first.resource.id, 'res-dart-language');
    expect(first.resource.type, ResourceType.documentation);
    expect(first.resource.source, 'dart.dev');
    expect(first.topicTitle, 'Dart fundamentals');
    expect(items.any((item) => item.bookmarked), isFalse);
  });

  test("one topic's resources", () async {
    final items = await stack.resources
        .watchResources(topicId: 'flutter-streams')
        .first;

    expect([
      for (final item in items) item.resource.id,
    ], contains('res-dart-streams'));
    expect(
      items.every((item) => item.resource.topicId == 'flutter-streams'),
      isTrue,
    );
  });

  test('saving twice is one bookmark; unsaving removes it', () async {
    await stack.resources.setBookmarked('res-null-safety', bookmarked: true);
    await stack.resources.setBookmarked('res-null-safety', bookmarked: true);
    var items = await stack.resources.watchResources().first;
    expect(
      [
        for (final i in items)
          if (i.bookmarked) i.resource.id,
      ],
      ['res-null-safety'],
    );

    await stack.resources.setBookmarked('res-null-safety', bookmarked: false);
    items = await stack.resources.watchResources().first;
    expect(items.any((item) => item.bookmarked), isFalse);
  });

  test('find by id', () async {
    expect(
      (await stack.resources.findResource('res-null-safety'))?.url,
      Uri.parse('https://dart.dev/null-safety'),
    );
    expect(await stack.resources.findResource('nope'), isNull);
  });
}
