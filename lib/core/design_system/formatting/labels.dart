import 'package:dev_journey/domain/model/learning_enums.dart';

// How the domain's enums read on screen. Text lives in the UI layer, never
// in the domain.

extension RoadmapCategoryLabel on RoadmapCategory {
  String get label => switch (this) {
    RoadmapCategory.mobile => 'Mobile',
    RoadmapCategory.backend => 'Backend',
    RoadmapCategory.ai => 'AI',
    RoadmapCategory.architecture => 'Architecture',
  };
}

extension DifficultyLabel on Difficulty {
  String get label => switch (this) {
    Difficulty.beginner => 'Beginner',
    Difficulty.intermediate => 'Intermediate',
    Difficulty.advanced => 'Advanced',
  };
}

/// "1 topic", "12 topics".
String countLabel(int count, String singular, [String? plural]) =>
    '$count ${count == 1 ? singular : (plural ?? '${singular}s')}';
