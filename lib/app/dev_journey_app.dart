import 'dart:async';

import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_router.dart';
import 'package:dev_journey/core/navigation/stream_listenable.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/domain/usecase/refresh_reminder_use_case.dart';
import 'package:dev_journey/features/settings/cubit/settings_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// The root widget: the app-wide `SettingsCubit`, themes, and the router.
///
/// This `State` owns the router and the [StreamListenable] that lets it
/// follow the settings, and disposes both. The router is created once, not
/// in `build`: a new router on every rebuild would reset navigation.
///
/// It also keeps the daily reminder in step with the device: at launch and
/// whenever the app comes back to the foreground (permission revoked, time
/// zone changed).
class DevJourneyApp extends StatefulWidget {
  const DevJourneyApp({super.key, this.initialLocation});

  /// Lets tests start on a deep link. The app itself starts on the
  /// Dashboard, and the onboarding gate redirects from there.
  final String? initialLocation;

  @override
  State<DevJourneyApp> createState() => _DevJourneyAppState();
}

class _DevJourneyAppState extends State<DevJourneyApp> {
  final _settings = getIt<SettingsRepository>();
  late final _settingsChanges = StreamListenable(_settings.watch());
  late final GoRouter _router = createAppRouter(
    settings: _settings,
    refreshListenable: _settingsChanges,
    initialLocation: widget.initialLocation,
  );
  final _refreshReminder = getIt<RefreshReminderUseCase>();
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    unawaited(_refreshReminder());
    _lifecycle = AppLifecycleListener(onResume: () => _refreshReminder());
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _router.dispose();
    _settingsChanges.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>()..load(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final seed = state.dynamicSeed;
          return MaterialApp.router(
            title: 'DevJourney',
            debugShowCheckedModeBanner: false,
            theme: seed == null
                ? AppTheme.light()
                : AppTheme.fromWallpaper(Color(seed), Brightness.light),
            darkTheme: seed == null
                ? AppTheme.dark()
                : AppTheme.fromWallpaper(Color(seed), Brightness.dark),
            themeMode: switch (state.settings.themeMode) {
              AppThemeMode.system => ThemeMode.system,
              AppThemeMode.light => ThemeMode.light,
              AppThemeMode.dark => ThemeMode.dark,
            },
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
