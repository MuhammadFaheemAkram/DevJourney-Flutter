import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDynamicColorUseCase {
  const UpdateDynamicColorUseCase(this._settings);

  final SettingsRepository _settings;

  Future<void> call({required bool enabled}) =>
      _settings.setDynamicColor(enabled: enabled);
}
