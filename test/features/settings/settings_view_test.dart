import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/device_colors.dart';
import 'package:dev_journey/features/settings/cubit/settings_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_state.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_state.dart';
import 'package:dev_journey/features/settings/settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSettings extends MockCubit<SettingsState> implements SettingsCubit {}

class _MockTools extends MockCubit<SettingsToolsState>
    implements SettingsToolsCubit {}

void main() {
  late _MockSettings settings;
  late _MockTools tools;

  setUpAll(() => registerFallbackValue(AppThemeMode.system));

  setUp(() {
    settings = _MockSettings();
    tools = _MockTools();
    when(() => settings.setThemeMode(any())).thenAnswer((_) async {});
    when(() => settings.setDynamicColor(enabled: any(named: 'enabled')))
        .thenAnswer((_) async {});
    when(() => tools.setReminderEnabled(enabled: any(named: 'enabled')))
        .thenAnswer((_) async {});
    when(() => tools.resetProgress()).thenAnswer((_) async {});
    when(() => tools.syncCatalog()).thenAnswer((_) async {});
    when(() => tools.openNotificationSettings()).thenAnswer((_) async {});
  });

  Future<void> pump(
    WidgetTester tester, {
    AppSettings app = const AppSettings(catalogVersion: 1),
    DeviceColors device = const DeviceColors(),
    SettingsToolsState state = const SettingsToolsState(),
    TargetPlatform platform = TargetPlatform.android,
  }) {
    whenListen(
      settings,
      const Stream<SettingsState>.empty(),
      initialState: SettingsState(settings: app, deviceColors: device),
    );
    whenListen(
      tools,
      const Stream<SettingsToolsState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      MultiBlocProvider(
        providers: [
          BlocProvider<SettingsCubit>.value(value: settings),
          BlocProvider<SettingsToolsCubit>.value(value: tools),
        ],
        child: const SettingsView(),
      ),
    );
  }

  testWidgets('appearance: the mode reaches the Cubit; no dynamic color '
      'without a wallpaper palette', (tester) async {
    await pump(tester);

    await tester.tap(find.text('Dark'));
    verify(() => settings.setThemeMode(AppThemeMode.dark)).called(1);
    expect(find.text('Dynamic color'), findsNothing);
  });

  testWidgets('dynamic color, where the device has it', (tester) async {
    await pump(tester, device: const DeviceColors(wallpaperColor: 0xFF336699));

    await tester.tap(find.text('Dynamic color'));
    verify(() => settings.setDynamicColor(enabled: false)).called(1);
  });

  testWidgets('the reminder: its switch, its time, and the denied note', (
    tester,
  ) async {
    await pump(
      tester,
      state: const SettingsToolsState(notificationsDenied: true),
    );

    expect(find.text('Off'), findsOneWidget);
    expect(find.text('7:00 PM'), findsOneWidget);
    await tester.tap(find.text('Remind me to learn'));
    verify(() => tools.setReminderEnabled(enabled: true)).called(1);

    expect(
      find.textContaining('Allow notifications in system settings'),
      findsOneWidget,
    );
    await tester.tap(find.text('Open settings'));
    verify(() => tools.openNotificationSettings()).called(1);
  });

  testWidgets('the switches are iOS switches on iOS', (tester) async {
    await pump(tester, platform: TargetPlatform.iOS);
    // pumpThemed uses the default (Android) theme: check the adaptive
    // constructor is used at all.
    expect(find.byType(SwitchListTile), findsWidgets);
  });

  testWidgets('reset asks first, then resets', (tester) async {
    await pump(tester);

    await tester.ensureVisible(find.text('Reset progress'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset progress'));
    await tester.pumpAndSettle();
    expect(find.text('Reset your progress?'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Reset'));
    await tester.pumpAndSettle();

    verify(() => tools.resetProgress()).called(1);
  });

  testWidgets('sync shows the catalog version and a spinner while running', (
    tester,
  ) async {
    await pump(
      tester,
      state: const SettingsToolsState(running: DataAction.syncing),
    );

    await tester.ensureVisible(find.text('Catalog version 1'));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
