import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;

  setUp(() async {
    stack = DataStack(); // Wednesday 14 October 2026
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  group('OpenLink', () {
    test('opens https links', () async {
      final url = Uri.parse('https://dart.dev/language');

      expect(await stack.openLink(url), isA<Ok<void>>());
      expect(stack.links.opened, [url]);
    });

    for (final link in [
      'http://dart.dev',
      'javascript:alert(1)',
      'file:///etc/passwd',
      'mailto:me@example.com',
      'intent://scan',
      'https:///no-host',
      'relative/path',
    ]) {
      test('refuses $link', () async {
        final result = await stack.openLink(Uri.parse(link));

        expect((result as Err).exception, isA<UnsafeLinkException>());
        expect(stack.links.opened, isEmpty);
      });
    }

    test('says so when the platform can not open it', () async {
      stack.links.succeeds = false;

      final result = await stack.openLink(Uri.parse('https://dart.dev'));

      expect((result as Err).exception, isA<LinkOpenFailedException>());
    });
  });

  test('OpenResource: by id, through the same https check', () async {
    expect(await stack.openResource('res-null-safety'), isA<Ok<void>>());
    expect(
      stack.links.opened.single,
      Uri.parse('https://dart.dev/null-safety'),
    );

    final missing = await stack.openResource('nope');
    expect((missing as Err).exception, isA<NotFoundException>());
  });

  test('SaveSolutionNotes: at most 10 000 characters', () async {
    expect(
      await stack.saveSolutionNotes('ch-debounce', 'a' * 10000),
      isA<Ok<void>>(),
    );

    final tooLong = await stack.saveSolutionNotes('ch-debounce', 'a' * 10001);
    expect((tooLong as Err).exception, isA<InvalidInputException>());
  });

  group('WatchSearchResults', () {
    test('finds content and the demo notes, grouped', () async {
      final results = await stack.watchSearchResults('stream').first;

      final kinds = results.groups.keys.map((kind) => kind.name);
      expect(kinds, containsAll(['topic', 'note', 'resource', 'challenge']));
    });

    test('text with nothing to search for finds nothing', () async {
      expect((await stack.watchSearchResults('*').first).isEmpty, isTrue);
    });
  });

  test("the Dashboard's recent challenges: the last touched first", () async {
    final summary = await stack.watchDashboard().first;

    // The demo: the grid in progress two days ago, the debounce done four
    // days ago.
    expect(
      [for (final item in summary.recentChallenges) item.challenge.id],
      ['ch-responsive-grid', 'ch-debounce'],
    );
  });
}
