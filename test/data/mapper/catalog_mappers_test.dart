import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';

void main() {
  test('flattens roadmaps, sections and topics, keeping the order and the '
      'parents', () {
    final rows = catalogDto().toRows();

    expect(
      [for (final s in rows.sections) (s.id.value, s.sortOrder.value)],
      [('basics', 0), ('async', 1)],
    );
    expect(
      [
        for (final t in rows.topics)
          (t.id.value, t.roadmapId.value, t.sectionId.value, t.sortOrder.value),
      ],
      [
        ('vars', 'dart', 'basics', 0),
        ('functions', 'dart', 'basics', 1),
        ('futures', 'dart', 'async', 0),
      ],
    );
  });

  test("a resource's source is its host, without www.", () {
    final rows = catalogDto().toRows();

    expect(
      [for (final r in rows.resources) r.source.value],
      ['dart.dev', 'youtube.com'],
    );
    expect(
      rows.resources.first.url.value,
      Uri.parse('https://www.dart.dev/language'),
    );
  });

  group('broken data fails before anything is written', () {
    void expectBroken(CatalogDto catalog) =>
        expect(catalog.toRows, throwsFormatException);

    test('a duplicate id', () {
      expectBroken(
        catalogDto(
          roadmaps: [
            RoadmapDto(
              id: 'r',
              title: 'R',
              description: '',
              category: RoadmapCategory.ai,
              sections: [
                SectionDto(
                  id: 's',
                  title: 'S',
                  topics: [topicDto('same'), topicDto('same')],
                ),
              ],
            ),
          ],
          resources: const [],
        ),
      );
    });

    test('a topic that takes no time, or has no title', () {
      for (final topic in [
        topicDto('t', minutes: 0),
        topicDto('t', title: ' '),
      ]) {
        expectBroken(
          catalogDto(
            roadmaps: [
              RoadmapDto(
                id: 'r',
                title: 'R',
                description: '',
                category: RoadmapCategory.ai,
                sections: [
                  SectionDto(id: 's', title: 'S', topics: [topic]),
                ],
              ),
            ],
            resources: const [],
          ),
        );
      }
    });

    test("a resource that isn't https, or points at no topic", () {
      for (final resource in const [
        ResourceDto(
          id: 'x',
          title: 'X',
          type: ResourceType.article,
          url: 'http://example.com',
          estimatedMinutes: 5,
        ),
        ResourceDto(
          id: 'x',
          title: 'X',
          type: ResourceType.article,
          url: 'https://example.com',
          estimatedMinutes: 5,
          topicId: 'nope',
        ),
      ]) {
        expectBroken(catalogDto(resources: [resource]));
      }
    });
  });
}
