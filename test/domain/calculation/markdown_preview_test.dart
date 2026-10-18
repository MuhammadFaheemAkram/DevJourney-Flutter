import 'package:dev_journey/domain/calculation/markdown_preview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Markdown marks go; the words stay, on one line', () {
    expect(
      plainTextPreview(
        '# Streams\n\n- **Single** by default\n> a *quote*\n1. use `cancel()`',
      ),
      'Streams Single by default a quote use cancel()',
    );
  });

  test('a link keeps its text', () {
    expect(
      plainTextPreview('See [the docs](https://dart.dev) first.'),
      'See the docs first.',
    );
  });

  test('code blocks are left out', () {
    expect(
      plainTextPreview('Before\n```dart\nprint(1);\n```\nAfter'),
      'Before After',
    );
  });

  test('nothing but formatting: an empty preview', () {
    expect(plainTextPreview('\n\n```\ncode\n```\n'), '');
  });
}
