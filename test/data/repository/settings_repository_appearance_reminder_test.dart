import 'package:dev_journey/core/storage/settings_local_data_source.dart';
import 'package:dev_journey/data/repository/settings_repository_impl.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late InMemorySharedPreferencesAsync store;

  setUp(() => store = InMemorySharedPreferencesAsync.empty());

  Future<SettingsRepositoryImpl> open() async {
    SharedPreferencesAsyncPlatform.instance = store;
    final repository = SettingsRepositoryImpl(
      SettingsLocalDataSource(
        await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
            allowList: SettingsLocalDataSource.allowList,
          ),
        ),
      ),
    );
    addTearDown(repository.dispose);
    return repository;
  }

  test(
    'defaults: system theme, dynamic color on, reminder off at 19:00',
    () async {
      final settings = (await open()).current;

      expect(settings.themeMode, AppThemeMode.system);
      expect(settings.dynamicColor, isTrue);
      expect(settings.reminderEnabled, isFalse);
      expect(settings.reminderTime, ReminderTime.evening);
    },
  );

  test('appearance and the reminder survive a relaunch', () async {
    final first = await open();
    await first.setThemeMode(AppThemeMode.dark);
    await first.setDynamicColor(enabled: false);
    await first.setReminderEnabled(enabled: true);
    await first.setReminderTime(const ReminderTime(hour: 7, minute: 30));

    final again = (await open()).current;
    expect(again.themeMode, AppThemeMode.dark);
    expect(again.dynamicColor, isFalse);
    expect(again.reminderEnabled, isTrue);
    expect(again.reminderTime, const ReminderTime(hour: 7, minute: 30));
  });

  test('damaged values fall back to the defaults', () async {
    SharedPreferencesAsyncPlatform.instance = store;
    final raw = SharedPreferencesAsync();
    await raw.setString('settings.themeMode', 'sepia');
    await raw.setString('settings.reminderTime', '25:99');

    final settings = (await open()).current;
    expect(settings.themeMode, AppThemeMode.system);
    expect(settings.reminderTime, ReminderTime.evening);
  });
}
