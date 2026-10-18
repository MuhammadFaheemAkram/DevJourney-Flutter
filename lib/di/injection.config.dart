// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:clock/clock.dart' as _i454;
import 'package:dev_journey/core/common/id_generator.dart' as _i927;
import 'package:dev_journey/core/database/app_database.dart' as _i340;
import 'package:dev_journey/core/database/daos/catalog_dao.dart' as _i1010;
import 'package:dev_journey/core/database/daos/user_data_dao.dart' as _i650;
import 'package:dev_journey/core/network/asset_json_loader.dart' as _i241;
import 'package:dev_journey/core/network/fake_learning_service.dart' as _i975;
import 'package:dev_journey/core/network/learning_service.dart' as _i343;
import 'package:dev_journey/core/network/network_simulator.dart' as _i885;
import 'package:dev_journey/core/storage/settings_local_data_source.dart'
    as _i669;
import 'package:dev_journey/data/repository/catalog_repository_impl.dart'
    as _i217;
import 'package:dev_journey/data/repository/roadmap_repository_impl.dart'
    as _i5;
import 'package:dev_journey/data/repository/settings_repository_impl.dart'
    as _i362;
import 'package:dev_journey/di/app_module.dart' as _i713;
import 'package:dev_journey/domain/repository/catalog_repository.dart' as _i403;
import 'package:dev_journey/domain/repository/roadmap_repository.dart' as _i69;
import 'package:dev_journey/domain/repository/settings_repository.dart'
    as _i689;
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart'
    as _i406;
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart'
    as _i198;
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart' as _i426;
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart'
    as _i546;
import 'package:dev_journey/features/welcome/cubit/welcome_cubit.dart' as _i695;
import 'package:flutter/services.dart' as _i281;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i927.IdGenerator>(() => _i927.IdGenerator());
    gh.lazySingleton<_i885.NetworkSimulator>(() => _i885.NetworkSimulator());
    gh.lazySingleton<_i281.AssetBundle>(() => appModule.assetBundle);
    gh.lazySingleton<_i454.Clock>(() => appModule.clock);
    gh.lazySingleton<_i340.AppDatabase>(() => appModule.appDatabase);
    await gh.lazySingletonAsync<_i460.SharedPreferencesWithCache>(
      () => appModule.preferences,
      preResolve: true,
    );
    gh.lazySingleton<_i1010.CatalogDao>(
      () => appModule.catalogDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i650.UserDataDao>(
      () => appModule.userDataDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i69.RoadmapRepository>(
      () => _i5.RoadmapRepositoryImpl(gh<_i1010.CatalogDao>()),
    );
    gh.lazySingleton<_i669.SettingsLocalDataSource>(
      () =>
          _i669.SettingsLocalDataSource(gh<_i460.SharedPreferencesWithCache>()),
    );
    gh.lazySingleton<_i241.AssetJsonLoader>(
      () => _i241.AssetJsonLoader(gh<_i281.AssetBundle>()),
    );
    gh.factory<_i546.WatchRoadmapsUseCase>(
      () => _i546.WatchRoadmapsUseCase(gh<_i69.RoadmapRepository>()),
    );
    gh.lazySingleton<_i689.SettingsRepository>(
      () => _i362.SettingsRepositoryImpl(gh<_i669.SettingsLocalDataSource>()),
    );
    gh.lazySingleton<_i343.LearningService>(
      () => _i975.FakeLearningService(
        gh<_i241.AssetJsonLoader>(),
        gh<_i885.NetworkSimulator>(),
      ),
    );
    gh.factory<_i406.StartLearningUseCase>(
      () => _i406.StartLearningUseCase(gh<_i689.SettingsRepository>()),
    );
    gh.lazySingleton<_i403.CatalogRepository>(
      () => _i217.CatalogRepositoryImpl(
        gh<_i343.LearningService>(),
        gh<_i1010.CatalogDao>(),
        gh<_i650.UserDataDao>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.factory<_i426.SyncCatalogUseCase>(
      () => _i426.SyncCatalogUseCase(
        gh<_i403.CatalogRepository>(),
        gh<_i689.SettingsRepository>(),
      ),
    );
    gh.factory<_i198.StartWithDemoProgressUseCase>(
      () => _i198.StartWithDemoProgressUseCase(
        gh<_i403.CatalogRepository>(),
        gh<_i406.StartLearningUseCase>(),
      ),
    );
    gh.factory<_i695.WelcomeCubit>(
      () => _i695.WelcomeCubit(
        gh<_i426.SyncCatalogUseCase>(),
        gh<_i546.WatchRoadmapsUseCase>(),
        gh<_i406.StartLearningUseCase>(),
        gh<_i198.StartWithDemoProgressUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i713.AppModule {}
