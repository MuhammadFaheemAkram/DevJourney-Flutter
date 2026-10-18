import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_router.dart';
import 'package:dev_journey/core/navigation/stream_listenable.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// The root widget: themes and the router.
///
/// This `State` owns the router and the [StreamListenable] that lets it
/// follow the settings, and disposes both. The router is created once, not
/// in `build`: a new router on every rebuild would reset navigation.
/// Phase 6 adds the app-scoped `SettingsCubit` here, above
/// `MaterialApp.router`, for the theme mode and dynamic color.
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

  @override
  void dispose() {
    _router.dispose();
    _settingsChanges.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevJourney',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: _router,
    );
  }
}
