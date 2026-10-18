import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';

// A small catalog for tests: one roadmap ("dart") in two sections with three
// topics, two resources and one challenge.

TopicDto topicDto(String id, {int minutes = 30, String? title}) => TopicDto(
  id: id,
  title: title ?? 'Topic $id',
  description: 'About $id',
  objectives: const ['Learn it'],
  difficulty: Difficulty.beginner,
  estimatedMinutes: minutes,
);

CatalogDto catalogDto({
  int version = 1,
  List<RoadmapDto>? roadmaps,
  List<ResourceDto>? resources,
  List<ChallengeDto>? challenges,
}) => CatalogDto(
  version: version,
  roadmaps:
      roadmaps ??
      [
        RoadmapDto(
          id: 'dart',
          title: 'Dart',
          description: 'The language',
          category: RoadmapCategory.mobile,
          sections: [
            SectionDto(
              id: 'basics',
              title: 'Basics',
              topics: [topicDto('vars'), topicDto('functions')],
            ),
            SectionDto(
              id: 'async',
              title: 'Async',
              topics: [topicDto('futures')],
            ),
          ],
        ),
      ],
  resources:
      resources ??
      const [
        ResourceDto(
          id: 'tour',
          title: 'Language tour',
          type: ResourceType.documentation,
          url: 'https://www.dart.dev/language',
          estimatedMinutes: 60,
          topicId: 'vars',
        ),
        ResourceDto(
          id: 'channel',
          title: 'A channel',
          type: ResourceType.video,
          url: 'https://youtube.com/@x',
          estimatedMinutes: 10,
        ),
      ],
  challenges:
      challenges ??
      const [
        ChallengeDto(
          id: 'fizz',
          title: 'FizzBuzz',
          category: ChallengeCategory.dart,
          difficulty: Difficulty.beginner,
          prompt: 'Print FizzBuzz.',
          hints: ['Use %'],
        ),
      ],
);
