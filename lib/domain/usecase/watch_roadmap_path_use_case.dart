import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchRoadmapPathUseCase {
  const WatchRoadmapPathUseCase(this._roadmaps);

  final RoadmapRepository _roadmaps;

  Stream<RoadmapPath?> call(String roadmapId) =>
      _roadmaps.watchRoadmapPath(roadmapId);
}
