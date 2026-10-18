import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// The roadmap the Dashboard follows.
@injectable
class SetActiveRoadmapUseCase {
  const SetActiveRoadmapUseCase(this._settings);

  final SettingsRepository _settings;

  Future<void> call(String roadmapId) =>
      _settings.setActiveRoadmapId(roadmapId);
}
