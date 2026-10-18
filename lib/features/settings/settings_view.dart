import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/features/settings/cubit/settings_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_cubit.dart';
import 'package:dev_journey/features/settings/cubit/settings_tools_state.dart';
import 'package:dev_journey/features/settings/widgets/reminder_time_picker.dart';
import 'package:dev_journey/features/shell/shell_drawer_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Appearance, the daily reminder, data, developer switches and About.
/// Switches are adaptive (an iOS switch on iOS), as is the time picker.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsToolsCubit, SettingsToolsState>(
      listenWhen: (previous, current) =>
          previous.messageSerial != current.messageSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.message ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: const DrawerMenuButton(),
          title: const Text('Settings'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.large),
          children: const [
            SectionHeader('Appearance'),
            _Appearance(),
            SectionHeader('Daily reminder'),
            _Reminder(),
            SectionHeader('Data'),
            _Data(),
            SectionHeader('Developer'),
            _Developer(),
            SectionHeader('About'),
            _About(),
          ],
        ),
      ),
    );
  }
}

class _Appearance extends StatelessWidget {
  const _Appearance();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    final state = context.watch<SettingsCubit>().state;
    final mode = state.settings.themeMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Three segments fit a phone at normal sizes; at large text a radio
        // list keeps every label whole.
        if (context.prefersStackedLayout)
          RadioGroup<AppThemeMode>(
            groupValue: mode,
            onChanged: (mode) {
              if (mode != null) cubit.setThemeMode(mode);
            },
            child: Column(
              children: [
                for (final option in AppThemeMode.values)
                  RadioListTile<AppThemeMode>(
                    value: option,
                    title: Text(option.label),
                  ),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.xSmall,
            ),
            child: SegmentedChoice<AppThemeMode>(
              values: AppThemeMode.values,
              labelOf: (mode) => mode.label,
              selected: mode,
              onSelected: cubit.setThemeMode,
            ),
          ),
        if (state.deviceColors.supportsDynamicColor)
          SwitchListTile.adaptive(
            title: const Text('Dynamic color'),
            subtitle: const Text('Use the colors of your wallpaper'),
            value: state.settings.dynamicColor,
            onChanged: (enabled) => cubit.setDynamicColor(enabled: enabled),
          ),
      ],
    );
  }
}

class _Reminder extends StatelessWidget {
  const _Reminder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tools = context.read<SettingsToolsCubit>();
    final toolsState = context.watch<SettingsToolsCubit>().state;
    final settings = context.watch<SettingsCubit>().state.settings;
    final time = _format(context, settings.reminderTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile.adaptive(
          title: const Text('Remind me to learn'),
          subtitle: Text(
            settings.reminderEnabled ? 'Every day at $time' : 'Off',
          ),
          value: settings.reminderEnabled,
          onChanged: toolsState.reminderBusy
              ? null
              : (enabled) => tools.setReminderEnabled(enabled: enabled),
        ),
        ListTile(
          leading: const Icon(Icons.schedule),
          title: const Text('Time'),
          trailing: Text(time, style: theme.textTheme.titleMedium),
          onTap: () async {
            final picked = await pickReminderTime(
              context,
              settings.reminderTime,
            );
            if (picked != null) await tools.changeReminderTime(picked);
          },
        ),
        if (toolsState.notificationsDenied && !settings.reminderEnabled)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.medium,
              0,
              AppSpacing.medium,
              AppSpacing.xSmall,
            ),
            child: Card(
              margin: EdgeInsets.zero,
              color: theme.colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.notifications_off_outlined,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: AppSpacing.xSmall),
                        Expanded(
                          child: Text(
                            'Notifications are off for DevJourney. Allow '
                            'notifications in system settings to get the '
                            'reminder.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: tools.openNotificationSettings,
                        child: const Text('Open settings'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// "19:00" or "7:00 PM", as the device shows times.
  static String _format(BuildContext context, ReminderTime time) =>
      MaterialLocalizations.of(context).formatTimeOfDay(
        TimeOfDay(hour: time.hour, minute: time.minute),
        alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
      );
}

class _Data extends StatelessWidget {
  const _Data();

  static Widget _progress(BuildContext context) => const SizedBox.square(
    dimension: 24,
    child: CircularProgressIndicator.adaptive(strokeWidth: 2),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tools = context.read<SettingsToolsCubit>();
    final running = context.watch<SettingsToolsCubit>().state.running;
    final version = context.select(
      (SettingsCubit cubit) => cubit.state.settings.catalogVersion,
    );
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.sync),
          title: const Text('Sync catalog'),
          subtitle: Text('Catalog version $version'),
          trailing: running == DataAction.syncing ? _progress(context) : null,
          enabled: running == null,
          onTap: tools.syncCatalog,
        ),
        ListTile(
          leading: Icon(Icons.restart_alt, color: theme.colorScheme.error),
          title: Text(
            'Reset progress',
            style: TextStyle(color: theme.colorScheme.error),
          ),
          subtitle: const Text(
            'Completions, bookmarks, check-ins and challenge work. Notes and '
            'goals stay.',
          ),
          trailing: running == DataAction.resetting ? _progress(context) : null,
          enabled: running == null,
          onTap: () async {
            final confirmed = await showConfirmDialog(
              context,
              title: 'Reset your progress?',
              message:
                  'Every completion, bookmark, goal check-in and challenge '
                  'status goes, and your streak with them. Your notes and '
                  'goals stay. This can’t be undone.',
              confirmLabel: 'Reset',
              destructive: true,
            );
            if (confirmed) await tools.resetProgress();
          },
        ),
      ],
    );
  }
}

class _Developer extends StatelessWidget {
  const _Developer();

  @override
  Widget build(BuildContext context) {
    final tools = context.read<SettingsToolsCubit>();
    final state = context.watch<SettingsToolsCubit>().state;
    return Column(
      children: [
        SwitchListTile.adaptive(
          title: const Text('Simulate network failure'),
          subtitle: const Text('Every request to the learning API fails'),
          value: state.simulatesNetworkFailure,
          onChanged: (enabled) =>
              tools.setSimulatesNetworkFailure(enabled: enabled),
        ),
        SwitchListTile.adaptive(
          title: const Text('Publish a catalog update'),
          subtitle: const Text(
            'The learning API serves catalog version 2: sync to get it',
          ),
          value: state.publishesCatalogUpdate,
          onChanged: (enabled) =>
              tools.setPublishesCatalogUpdate(enabled: enabled),
        ),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: const Text('About DevJourney'),
      subtitle: const Text('Version, licenses, other editions'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => const AboutRoute().push<void>(context),
    );
  }
}
