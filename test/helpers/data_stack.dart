import 'package:clock/clock.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/asset_json_loader.dart';
import 'package:dev_journey/core/network/fake_learning_service.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/data/repository/catalog_repository_impl.dart';
import 'package:dev_journey/data/repository/roadmap_repository_impl.dart';
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart';
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart';
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
  late final roadmaps = RoadmapRepositoryImpl(db.catalogDao);

  late final syncCatalog = SyncCatalogUseCase(catalog, settings);
  late final watchRoadmaps = WatchRoadmapsUseCase(roadmaps);
  late final startLearning = StartLearningUseCase(settings);
  late final startWithDemoProgress = StartWithDemoProgressUseCase(
    catalog,
    startLearning,
  );

  Future<void> close() => db.close();
}
