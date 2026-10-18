import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:material_ui/material_ui.dart';

/// Picks the reminder's time the platform's way: Material's clock dialog on
/// Android, a wheel in a bottom sheet on iOS. `null` if dismissed.
Future<ReminderTime?> pickReminderTime(
  BuildContext context,
  ReminderTime initial,
) async {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return showAppSheet<ReminderTime>(
      context,
      (_) => _CupertinoTimeSheet(initial: initial),
    );
  }
  final picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initial.hour, minute: initial.minute),
    helpText: 'Remind me at',
  );
  return picked == null
      ? null
      : ReminderTime(hour: picked.hour, minute: picked.minute);
}

class _CupertinoTimeSheet extends StatefulWidget {
  const _CupertinoTimeSheet({required this.initial});

  final ReminderTime initial;

  @override
  State<_CupertinoTimeSheet> createState() => _CupertinoTimeSheetState();
}

class _CupertinoTimeSheetState extends State<_CupertinoTimeSheet> {
  late ReminderTime _time = widget.initial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.medium,
        0,
        AppSpacing.medium,
        AppSpacing.medium,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Remind me at', style: theme.textTheme.titleLarge),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(_time),
                child: const Text('Done'),
              ),
            ],
          ),
          SizedBox(
            height: 216,
            child: CupertinoTheme(
              data: CupertinoThemeData(brightness: theme.brightness),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(
                  2026,
                  1,
                  1,
                  widget.initial.hour,
                  widget.initial.minute,
                ),
                onDateTimeChanged: (value) => _time = ReminderTime(
                  hour: value.hour,
                  minute: value.minute,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
