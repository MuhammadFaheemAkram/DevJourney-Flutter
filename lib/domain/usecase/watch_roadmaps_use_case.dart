import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchRoadmapsUseCase {
  const WatchRoadmapsUseCase(this._roadmaps);

  final RoadmapRepository _roadmaps;

  Stream<List<RoadmapProgress>> call() => _roadmaps.watchRoadmaps();
}
