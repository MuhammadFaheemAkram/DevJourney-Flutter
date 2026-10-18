import 'package:clock/clock.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/asset_json_loader.dart';
import 'package:dev_journey/core/network/fake_learning_service.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/data/repository/catalog_repository_impl.dart';
import 'package:dev_journey/data/repository/progress_repository_impl.dart';
import 'package:dev_journey/data/repository/roadmap_repository_impl.dart';
import 'package:dev_journey/domain/usecase/bookmark_topic_use_case.dart';
import 'package:dev_journey/domain/usecase/set_active_roadmap_use_case.dart';
import 'package:dev_journey/domain/usecase/set_section_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/set_topic_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart';
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_dashboard_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmap_path_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_settings_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_topic_use_case.dart';
import 'package:flutter/services.dart';

import 'database.dart';
import 'fakes/fake_settings_repository.dart';
import 'test_dependencies.dart';

/// The real repositories and use cases on an in-memory database, with a
/// fixed clock and the real fake service (zero latency, reading the bundled
/// JSON): what Cubit and repository tests run against instead of mocks.
///
/// Tests that read the bundled assets need
/// `TestWidgetsFlutterBinding.ensureInitialized()`.
class DataStack {
  DataStack({DateTime? now, LearningService? service})
    : clock = Clock.fixed(now ?? demoNow),
      service =
          service ??
          FakeLearningService(
            AssetJsonLoader(rootBundle),
            NetworkSimulator(latency: Duration.zero),
          );

  final Clock clock;
  final LearningService service;
  final AppDatabase db = newTestDatabase();
  final settings = FakeSettingsRepository();

  late final catalog = CatalogRepositoryImpl(
    service,
    db.catalogDao,
    db.userDataDao,
    clock,
  );
  late final roadmaps = RoadmapRepositoryImpl(db.catalogDao, db.learningDao);
  late final progress = ProgressRepositoryImpl(db.learningDao, clock);

  late final syncCatalog = SyncCatalogUseCase(catalog, settings);
  late final watchRoadmaps = WatchRoadmapsUseCase(roadmaps);
  late final startLearning = StartLearningUseCase(settings);
  late final startWithDemoProgress = StartWithDemoProgressUseCase(
    catalog,
    startLearning,
  );
  late final watchSettings = WatchSettingsUseCase(settings);
  late final watchRoadmapPath = WatchRoadmapPathUseCase(roadmaps);
  late final watchTopic = WatchTopicUseCase(roadmaps);
  late final setTopicCompleted = SetTopicCompletedUseCase(progress);
  late final setSectionCompleted = SetSectionCompletedUseCase(progress);
  late final bookmarkTopic = BookmarkTopicUseCase(progress);
  late final setActiveRoadmap = SetActiveRoadmapUseCase(settings);
  late final watchDashboard = WatchDashboardUseCase(
    settings,
    roadmaps,
    progress,
    clock,
  );

  /// The catalog synced, as on any launch after Welcome.
  Future<void> syncCatalogNow() async => catalog.sync();

  /// The catalog and the demo progress, following [roadmapId].
  Future<void> loadDemo({String roadmapId = 'flutter'}) async {
    await catalog.sync();
    await catalog.loadDemoProgress();
    await settings.setActiveRoadmapId(roadmapId);
  }

  Future<void> close() => db.close();
}
