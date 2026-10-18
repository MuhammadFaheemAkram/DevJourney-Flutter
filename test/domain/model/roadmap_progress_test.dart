import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const roadmap = Roadmap(
    id: 'r',
    title: 'R',
    description: '',
    category: RoadmapCategory.mobile,
  );

  RoadmapProgress progress(int completed, int total) => RoadmapProgress(
    roadmap: roadmap,
    completedTopics: completed,
    totalTopics: total,
  );

  test('the ratio of completed topics, 0 with no topics', () {
    expect(progress(3, 12).ratio, 0.25);
    expect(progress(0, 0).ratio, 0);
  });

  test('complete only when every topic is done, and there are some', () {
    expect(progress(12, 12).isComplete, isTrue);
    expect(progress(11, 12).isComplete, isFalse);
    expect(progress(0, 0).isComplete, isFalse);
  });

  test('a sync result reports whether anything is new', () {
    expect(const SyncResult(version: 2).hasNewContent, isFalse);
    expect(const SyncResult(version: 2, newTopics: 3).hasNewContent, isTrue);
  });
}
