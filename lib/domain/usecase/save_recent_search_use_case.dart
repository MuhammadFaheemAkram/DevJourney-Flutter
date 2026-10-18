import 'package:dev_journey/domain/repository/recent_searches_repository.dart';
import 'package:injectable/injectable.dart';

/// Remembers a search the user acted on (opened a result of), trimmed.
@injectable
class SaveRecentSearchUseCase {
  const SaveRecentSearchUseCase(this._recent);

  final RecentSearchesRepository _recent;

  Future<void> call(String query) async {
    final trimmed = query.trim();
    if (trimmed.isNotEmpty) await _recent.save(trimmed);
  }
}
