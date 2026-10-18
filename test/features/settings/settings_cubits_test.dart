import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/device_colors.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/features/settings/cubit/settings_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() => stack = DataStack());
  tearDown(() => stack.close());

  group('SettingsCubit (app-wide)', () {
    SettingsCubit open({int? wallpaper}) {
      final cubit = SettingsCubit(
        stack.settings,
        stack.updateThemeMode,
        stack.updateDynamicColor,
        DeviceColors(wallpaperColor: wallpaper),
      )..load();
      addTearDown(cubit.close);
      return cubit;
    }

    test('the theme mode follows the setting', () async {
      final cubit = open();

      await cubit.setThemeMode(AppThemeMode.dark);

      await waitFor(cubit, (s) => s.settings.themeMode == AppThemeMode.dark);
    });

    test(
      'dynamic color: the wallpaper seed while on, none while off',
      () async {
        final cubit = open(wallpaper: 0xFF336699);
        expect(cubit.state.dynamicSeed, 0xFF336699);

        await cubit.setDynamicColor(enabled: false);
        await waitFor(cubit, (s) => s.dynamicSeed == null);
      },
    );

    test('a device without dynamic color: never a seed', () {
      final cubit = open();

      expect(cubit.state.deviceColors.supportsDynamicColor, isFalse);
      expect(cubit.state.dynamicSeed, isNull);
    });
  });

  group('SettingsToolsCubit', () {
    SettingsToolsCubit open() {
      final cubit = SettingsToolsCubit(
        stack.setReminderEnabled,
        stack.changeReminderTime,
        stack.syncCatalog,
        stack.resetProgress,
        stack.reminders,
        stack.developerTools,
      );
      addTearDown(cubit.close);
      return cubit;
    }

    test('reminder on; denied shows where to allow it, quietly', () async {
      final cubit = open();
      await cubit.setReminderEnabled(enabled: true);
      expect(stack.settings.current.reminderEnabled, isTrue);
      expect(cubit.state.notificationsDenied, isFalse);

      await cubit.setReminderEnabled(enabled: false);
      stack.reminders
        ..allowed = false
        ..granted = false;
      await cubit.setReminderEnabled(enabled: true);

      expect(cubit.state.notificationsDenied, isTrue);
      expect(cubit.state.messageSerial, 0, reason: 'the card explains it');
      await cubit.openNotificationSettings();
      expect(stack.reminders.calls.last, 'open settings');
    });

    test('a new time is saved', () async {
      final cubit = open();

      await cubit.changeReminderTime(const ReminderTime(hour: 6, minute: 45));

      expect(
        stack.settings.current.reminderTime,
        const ReminderTime(hour: 6, minute: 45),
      );
    });

    test('sync says what came, and blocks a second action meanwhile', () async {
      await stack.loadDemo();
      final cubit = open()..setPublishesCatalogUpdate(enabled: true);

      final syncing = cubit.syncCatalog();
      expect(cubit.state.running, DataAction.syncing);
      await cubit.resetProgress();
      await syncing;

      expect(cubit.state.message, '3 new topics, 3 new resources');
      expect(cubit.state.messageSerial, 1);
      expect(cubit.state.running, isNull);
    });

    test('reset progress says what stayed', () async {
      await stack.loadDemo();
      final cubit = open();

      await cubit.resetProgress();

      expect(
        cubit.state.message,
        'Progress reset. Your notes and goals are still here.',
      );
      expect((await stack.progress.watchCompletedCounts().first).topics, 0);
    });

    test('the developer switches reach the fake API', () async {
      final cubit = open()..setSimulatesNetworkFailure(enabled: true);

      expect(stack.network.failRequests, isTrue);
      await cubit.syncCatalog();
      expect(cubit.state.message, contains("Couldn't reach the server"));

      cubit.setPublishesCatalogUpdate(enabled: true);
      expect(stack.publisher.publishesUpdate, isTrue);
    });
  });
}
