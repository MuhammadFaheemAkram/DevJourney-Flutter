import 'package:dev_journey/domain/repository/recent_searches_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearRecentSearchesUseCase {
  const ClearRecentSearchesUseCase(this._recent);

  final RecentSearchesRepository _recent;

  Future<void> call() => _recent.clear();
}
