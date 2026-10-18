import 'dart:convert';
import 'dart:io';

import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/data/mapper/demo_progress_mappers.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_dependencies.dart';

// The JSON files the fake API serves, checked as data: a typo in an id or a
// broken URL fails here, not on someone's first launch.
void main() {
  Map<String, dynamic> read(String path) =>
      jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

  final catalog = CatalogDto.fromJson(read('assets/json/catalog_v1.json'));
  final rows = catalog.toRows();

  test('four roadmaps, each in sections, with topics, resources and '
      'challenges', () {
    expect(
      [for (final r in rows.roadmaps) r.id.value],
      ['flutter', 'backend', 'ai-engineer', 'system-design'],
    );
    expect(rows.sections.length, greaterThanOrEqualTo(12));
    expect(rows.topics, hasLength(32));
    expect(rows.resources.length, greaterThanOrEqualTo(30));
    expect(rows.challenges, hasLength(12));
  });

  test('every topic has objectives and a description', () {
    for (final topic in catalog.roadmaps.expand(
      (r) => r.sections.expand((s) => s.topics),
    )) {
      expect(topic.objectives, isNotEmpty, reason: topic.id);
      expect(topic.description.trim(), isNotEmpty, reason: topic.id);
    }
  });

  test('every challenge has hints to reveal', () {
    for (final challenge in catalog.challenges) {
      expect(challenge.hints, isNotEmpty, reason: challenge.id);
    }
  });

  test('the demo progress fits the catalog', () {
    final demo = DemoProgressDto.fromJson(
      read('assets/json/demo_progress.json'),
    );
    final ids = (
      topics: {for (final t in rows.topics) t.id.value},
      resources: {for (final r in rows.resources) r.id.value},
      challenges: {for (final c in rows.challenges) c.id.value},
    );

    final user = demo.toUserRows(now: demoNow, catalog: ids);

    expect(user.progress, hasLength(10));
    expect(user.notes, hasLength(3));
    expect(user.goals, hasLength(4));
    expect(user.challengeStates, hasLength(2));
  });
}
