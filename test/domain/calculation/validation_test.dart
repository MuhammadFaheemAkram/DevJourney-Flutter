import 'package:dev_journey/domain/calculation/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a note needs a title of at most 80 characters, as seen', () {
    expect(noteTitleError('   '), 'Give the note a title');
    expect(noteTitleError('a' * 80), isNull);
    expect(noteTitleError('a' * 81), isNotNull);
    // 80 emoji are 80 characters, though many more UTF-16 units.
    expect(noteTitleError('👩‍💻' * 80), isNull);
    expect(noteTitleError('👩‍💻' * 81), isNotNull);
  });

  test("a note's content is at most 20 000 characters", () {
    expect(noteContentError(''), isNull);
    expect(noteContentError('a' * 20000), isNull);
    expect(noteContentError('a' * 20001), isNotNull);
  });

  test('a goal needs a title (60 at most) and a target from 1 to 50', () {
    expect(goalTitleError(''), 'Give the goal a title');
    expect(goalTitleError('a' * 60), isNull);
    expect(goalTitleError('a' * 61), isNotNull);
    expect(goalTargetError(0), isNotNull);
    expect(goalTargetError(1), isNull);
    expect(goalTargetError(50), isNull);
    expect(goalTargetError(51), isNotNull);
  });
}
