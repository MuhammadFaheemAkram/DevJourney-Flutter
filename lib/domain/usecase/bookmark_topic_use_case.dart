import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookmarkTopicUseCase {
  const BookmarkTopicUseCase(this._progress);

  final ProgressRepository _progress;

  Future<Result<void>> call(String topicId, {required bool bookmarked}) =>
      _progress.setTopicBookmarked(topicId, bookmarked: bookmarked);
}
