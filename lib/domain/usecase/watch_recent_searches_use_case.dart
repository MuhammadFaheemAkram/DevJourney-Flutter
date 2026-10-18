import 'package:dev_journey/domain/repository/recent_searches_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchRecentSearchesUseCase {
  const WatchRecentSearchesUseCase(this._recent);

  final RecentSearchesRepository _recent;

  Stream<List<String>> call() => _recent.watch();
}
