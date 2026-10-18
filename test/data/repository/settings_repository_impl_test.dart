import 'package:dev_journey/core/storage/settings_local_data_source.dart';
import 'package:dev_journey/data/repository/settings_repository_impl.dart';
import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  Future<SettingsRepositoryImpl> launch([Map<String, Object>? saved]) async {
    if (saved != null) {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.withData(saved);
    }
    return SettingsRepositoryImpl(
      SettingsLocalDataSource(
        await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
            allowList: SettingsLocalDataSource.allowList,
          ),
        ),
      ),
    );
  }

  test('a first launch: not onboarded, no roadmap, no catalog', () async {
    final repository = await launch({});

    expect(repository.current, const AppSettings());
  });

  test('every setting is saved, published and read back', () async {
    final repository = await launch({});
    final seen = <AppSettings>[];
    final subscription = repository.watch().listen(seen.add);

    await repository.setActiveRoadmapId('backend');
    await repository.setOnboarded(onboarded: true);
    await repository.setCatalogVersion(2);
    await pumpEventQueue();
    await subscription.cancel();

    const expected = AppSettings(
      onboarded: true,
      activeRoadmapId: 'backend',
      catalogVersion: 2,
    );
    expect(seen.first, const AppSettings());
    expect(seen.last, expected);
    expect((await launch()).current, expected);
  });

  test('an unchanged value publishes nothing', () async {
    final repository = await launch({});
    final seen = <bool>[];
    final subscription = repository.watch().listen(
      (settings) => seen.add(settings.onboarded),
    );

    await repository.setOnboarded(onboarded: true);
    await repository.setOnboarded(onboarded: true);
    await pumpEventQueue();
    await subscription.cancel();

    expect(seen, [false, true]);
  });

  test(
    'a negative saved catalog version falls back to 0, and is refused',
    () async {
      final repository = await launch({'settings.catalogVersion': -3});

      expect(repository.current.catalogVersion, 0);
      expect(() => repository.setCatalogVersion(-1), throwsRangeError);
    },
  );
}
