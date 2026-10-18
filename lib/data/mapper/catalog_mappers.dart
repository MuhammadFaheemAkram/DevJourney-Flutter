import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:drift/drift.dart' show Value;

/// Flattens the API's nested catalog into rows, checking it first.
extension CatalogMapping on CatalogDto {
  /// - **Flattened:** sections and topics come out of their roadmaps, and
  ///   each row keeps its position (`sort_order`) and its parents' ids.
  /// - **Checked before writing:** ids are unique; titles aren't blank;
  ///   minutes are positive; every resource's topic exists; every URL is
  ///   `https`. Broken data throws a [FormatException] here, instead of a
  ///   database error half-way through the sync.
  CatalogRows toRows() {
    void require(bool condition, String problem) {
      if (!condition) throw FormatException('Catalog: $problem');
    }

    final seen = <String>{};
    void unique(String kind, String id) {
      require(id.trim().isNotEmpty, 'a $kind without an id');
      require(seen.add('$kind:$id'), 'two ${kind}s with the id "$id"');
    }

    final roadmapRows = <RoadmapsCompanion>[];
    final sectionRows = <RoadmapSectionsCompanion>[];
    final topicRows = <TopicsCompanion>[];
    for (final (roadmapOrder, roadmap) in roadmaps.indexed) {
      unique('roadmap', roadmap.id);
      require(roadmap.title.trim().isNotEmpty, '${roadmap.id} has no title');
      roadmapRows.add(
        RoadmapsCompanion.insert(
          id: roadmap.id,
          title: roadmap.title,
          description: roadmap.description,
          category: roadmap.category,
          sortOrder: roadmapOrder,
        ),
      );
      for (final (sectionOrder, section) in roadmap.sections.indexed) {
        unique('section', section.id);
        sectionRows.add(
          RoadmapSectionsCompanion.insert(
            id: section.id,
            roadmapId: roadmap.id,
            title: section.title,
            sortOrder: sectionOrder,
          ),
        );
        for (final (topicOrder, topic) in section.topics.indexed) {
          unique('topic', topic.id);
          require(topic.title.trim().isNotEmpty, '${topic.id} has no title');
          require(topic.estimatedMinutes > 0, '${topic.id} takes no time');
          topicRows.add(
            TopicsCompanion.insert(
              id: topic.id,
              roadmapId: roadmap.id,
              sectionId: section.id,
              title: topic.title,
              description: topic.description,
              objectives: topic.objectives,
              difficulty: topic.difficulty,
              estimatedMinutes: topic.estimatedMinutes,
              sortOrder: topicOrder,
            ),
          );
        }
      }
    }

    final topicIds = {for (final t in topicRows) t.id.value};
    final resourceRows = <ResourcesCompanion>[];
    for (final (order, resource) in resources.indexed) {
      unique('resource', resource.id);
      final url = Uri.tryParse(resource.url);
      require(
        url != null && url.scheme == 'https' && url.host.isNotEmpty,
        '${resource.id} needs an https URL',
      );
      require(resource.estimatedMinutes > 0, '${resource.id} takes no time');
      require(
        resource.topicId == null || topicIds.contains(resource.topicId),
        '${resource.id}: unknown topic',
      );
      resourceRows.add(
        ResourcesCompanion.insert(
          id: resource.id,
          title: resource.title,
          type: resource.type,
          url: url!,
          source: sourceOf(url),
          estimatedMinutes: resource.estimatedMinutes,
          topicId: Value(resource.topicId),
          sortOrder: order,
        ),
      );
    }

    final challengeRows = <ChallengesCompanion>[];
    for (final (order, challenge) in challenges.indexed) {
      unique('challenge', challenge.id);
      require(
        challenge.prompt.trim().isNotEmpty,
        '${challenge.id} has no prompt',
      );
      challengeRows.add(
        ChallengesCompanion.insert(
          id: challenge.id,
          title: challenge.title,
          category: challenge.category,
          difficulty: challenge.difficulty,
          prompt: challenge.prompt,
          hints: challenge.hints,
          sortOrder: order,
        ),
      );
    }

    return CatalogRows(
      roadmaps: roadmapRows,
      sections: sectionRows,
      topics: topicRows,
      resources: resourceRows,
      challenges: challengeRows,
    );
  }

  /// Where a resource is published, for display: "docs.flutter.dev",
  /// "youtube.com".
  static String sourceOf(Uri url) =>
      url.host.startsWith('www.') ? url.host.substring(4) : url.host;
}

extension RoadmapRowMapping on RoadmapRow {
  Roadmap toDomain() => Roadmap(
    id: id,
    title: title,
    description: description,
    category: category,
  );
}
