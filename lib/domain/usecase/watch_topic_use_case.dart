import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTopicUseCase {
  const WatchTopicUseCase(this._roadmaps);

  final RoadmapRepository _roadmaps;

  Stream<TopicDetails?> call(String topicId) => _roadmaps.watchTopic(topicId);
}
