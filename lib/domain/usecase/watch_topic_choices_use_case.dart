import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTopicChoicesUseCase {
  const WatchTopicChoicesUseCase(this._roadmaps);

  final RoadmapRepository _roadmaps;

  Stream<List<TopicChoice>> call() => _roadmaps.watchTopicChoices();
}
