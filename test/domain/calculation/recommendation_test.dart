import 'package:dev_journey/domain/calculation/recommendation.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/path_fixtures.dart';

void main() {
  final day = CalendarDate(2026, 10, 14);

  test('the first open topic, in section then topic order', () {
    final path = roadmapPath([
      sectionPath('basics', [
        topicItem('a', completedOn: day),
        topicItem('b', completedOn: day),
      ]),
      sectionPath('async', [
        topicItem('c', sectionId: 'async'),
        topicItem('d', sectionId: 'async'),
      ]),
    ]);

    expect(recommendedTopic(path)?.topic.id, 'c');
  });

  test('a topic skipped earlier comes back first', () {
    final path = roadmapPath([
      sectionPath('basics', [topicItem('a'), topicItem('b', completedOn: day)]),
      sectionPath('async', [topicItem('c', sectionId: 'async')]),
    ]);

    expect(recommendedTopic(path)?.topic.id, 'a');
  });

  test('nothing once everything is done, or with no topics', () {
    expect(
      recommendedTopic(
        roadmapPath([
          sectionPath('basics', [topicItem('a', completedOn: day)]),
        ]),
      ),
      isNull,
    );
    expect(recommendedTopic(roadmapPath(const [])), isNull);
  });

  test('the path counts its topics; a section with none is never complete', () {
    final path = roadmapPath([
      sectionPath('basics', [topicItem('a', completedOn: day), topicItem('b')]),
      sectionPath('empty', const []),
    ]);

    expect((path.completedTopics, path.totalTopics, path.ratio), (1, 2, 0.5));
    expect(path.sections.last.isComplete, isFalse);
  });
}
