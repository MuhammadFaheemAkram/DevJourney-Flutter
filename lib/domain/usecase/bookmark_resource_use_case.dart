import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/resources_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookmarkResourceUseCase {
  const BookmarkResourceUseCase(this._resources);

  final ResourcesRepository _resources;

  Future<Result<void>> call(String id, {required bool bookmarked}) =>
      _resources.setBookmarked(id, bookmarked: bookmarked);
}
