import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Welcome → "Start learning": [roadmapId] becomes the active roadmap, and
/// onboarding ends (the router's gate then opens the Dashboard).
@injectable
class StartLearningUseCase {
  const StartLearningUseCase(this._settings);

  final SettingsRepository _settings;

  Future<void> call(String roadmapId) async {
    // The roadmap first: the Dashboard must find it when the gate opens.
    await _settings.setActiveRoadmapId(roadmapId);
    await _settings.setOnboarded(onboarded: true);
  }
}
