import 'package:dev_journey/domain/model/roadmap_progress.dart';

/// Roadmaps and their progress.
abstract interface class RoadmapRepository {
  /// Every roadmap, in the catalog's order, with its completed and total
  /// topics, kept live.
  Stream<List<RoadmapProgress>> watchRoadmaps();
}
