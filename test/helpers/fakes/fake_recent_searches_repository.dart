import 'dart:async';

import 'package:dev_journey/data/repository/recent_searches_repository_impl.dart';
import 'package:dev_journey/domain/repository/recent_searches_repository.dart';

/// Recent searches in memory, with the real repository's rules (latest
/// first, no duplicates ignoring case, five at most).
class FakeRecentSearchesRepository implements RecentSearchesRepository {
  FakeRecentSearchesRepository([this._current = const []]);

  List<String> _current;
  final _changes = StreamController<List<String>>.broadcast(sync: true);

  @override
  Stream<List<String>> watch() => Stream.multi((watcher) {
    final subscription = _changes.stream.listen(watcher.add);
    watcher
      ..onCancel = subscription.cancel
      ..add(_current);
  });

  @override
  Future<void> save(String query) async => _publish(
    [
      query,
      for (final old in _current)
        if (old.toLowerCase() != query.toLowerCase()) old,
    ].take(RecentSearchesRepositoryImpl.limit).toList(),
  );

  @override
  Future<void> clear() async => _publish(const []);

  void _publish(List<String> searches) {
    _current = searches;
    _changes.add(searches);
  }
}
