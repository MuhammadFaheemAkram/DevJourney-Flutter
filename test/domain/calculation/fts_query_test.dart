import 'package:dev_journey/domain/calculation/fts_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('each word quoted, the last one a prefix', () {
    expect(ftsQuery('stream'), '"stream"*');
    expect(ftsQuery('  dart   streams  '), '"dart" "streams"*');
  });

  test('nothing to search for: null', () {
    expect(ftsQuery(''), isNull);
    expect(ftsQuery('   '), isNull);
    expect(ftsQuery('* - ( ) "'), isNull);
  });

  group('FTS5 syntax is neutralised', () {
    for (final (typed, query) in [
      ('stream AND future', '"stream" "AND" "future"*'),
      ('a OR b', '"a" "OR" "b"*'),
      ('NOT dart', '"NOT" "dart"*'),
      ('NEAR(dart flutter)', '"NEAR(dart" "flutter)"*'),
      ('"quoted', '"quoted"*'),
      ('say "hi"', '"say" "hi"*'),
      ('dart*', '"dart*"*'),
      ('-dart', '"-dart"*'),
      ('title:dart', '"title:dart"*'),
      ('^dart', '"^dart"*'),
      ('(dart)', '"(dart)"*'),
      ('café', '"café"*'),
      ('42', '"42"*'),
    ]) {
      test(typed, () => expect(ftsQuery(typed), query));
    }
  });
}
