import 'package:dev_journey/domain/model/app_theme_mode.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateThemeModeUseCase {
  const UpdateThemeModeUseCase(this._settings);

  final SettingsRepository _settings;

  Future<void> call(AppThemeMode mode) => _settings.setThemeMode(mode);
}
