import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_cubit.dart';
import 'package:dev_journey/features/settings/settings_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// The Settings tab. The appearance comes from the app-wide `SettingsCubit`
/// (above the router); the actions from this screen's own Cubit.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsToolsCubit>(),
      child: const SettingsView(),
    );
  }
}
