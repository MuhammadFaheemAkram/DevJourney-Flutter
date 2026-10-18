import 'package:dev_journey/core/storage/settings_local_data_source.dart';
import 'package:dev_journey/data/repository/recent_searches_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  Future<RecentSearchesRepositoryImpl> open([
    Map<String, Object> stored = const {},
  ]) async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData(Map.of(stored));
    final preferences = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: SettingsLocalDataSource.allowList,
      ),
    );
    final repository = RecentSearchesRepositoryImpl(
      SettingsLocalDataSource(preferences),
    );
    addTearDown(repository.dispose);
    return repository;
  }

  test('latest first, once each (ignoring case), five at most', () async {
    final recent = await open();

    for (final query in ['a1', 'b2', 'c3', 'd4', 'e5', 'B2', 'f6']) {
      await recent.save(query);
    }

    expect(await recent.watch().first, ['f6', 'B2', 'e5', 'd4', 'c3']);
  });

  test('kept across launches; cleared on request', () async {
    final first = await open();
    await first.save('streams');

    final again = await open({
      'search.recent': ['streams'],
    });
    expect(await again.watch().first, ['streams']);

    await again.clear();
    expect(await again.watch().first, isEmpty);
  });
}
