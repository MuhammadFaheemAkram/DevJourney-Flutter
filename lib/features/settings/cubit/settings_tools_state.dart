import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_tools_state.freezed.dart';

/// A data action in progress, so its row shows a spinner and the others
/// wait.
enum DataAction { syncing, resetting }

@freezed
abstract class SettingsToolsState with _$SettingsToolsState {
  const factory SettingsToolsState({
    /// Asking for permission or (re)scheduling.
    @Default(false) bool reminderBusy,

    /// The last attempt to turn the reminder on was refused: Settings says
    /// where to allow notifications.
    @Default(false) bool notificationsDenied,
    DataAction? running,
    @Default(false) bool simulatesNetworkFailure,
    @Default(false) bool publishesCatalogUpdate,
    String? message,
    @Default(0) int messageSerial,
  }) = _SettingsToolsState;
}
