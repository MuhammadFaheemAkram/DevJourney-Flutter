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
import 'package:dev_journey/core/database/daos/goals_dao.dart' as _i430;
import 'package:dev_journey/core/database/daos/learning_dao.dart' as _i46;
import 'package:dev_journey/core/database/daos/notes_dao.dart' as _i751;
import 'package:dev_journey/core/database/daos/user_data_dao.dart' as _i650;
import 'package:dev_journey/core/network/asset_json_loader.dart' as _i241;
import 'package:dev_journey/core/network/fake_learning_service.dart' as _i975;
import 'package:dev_journey/core/network/learning_service.dart' as _i343;
import 'package:dev_journey/core/network/network_simulator.dart' as _i885;
import 'package:dev_journey/core/storage/settings_local_data_source.dart'
    as _i669;
import 'package:dev_journey/data/repository/catalog_repository_impl.dart'
    as _i217;
import 'package:dev_journey/data/repository/goals_repository_impl.dart'
    as _i138;
import 'package:dev_journey/data/repository/notes_repository_impl.dart'
    as _i801;
import 'package:dev_journey/data/repository/progress_repository_impl.dart'
    as _i1067;
import 'package:dev_journey/data/repository/roadmap_repository_impl.dart'
    as _i5;
import 'package:dev_journey/data/repository/settings_repository_impl.dart'
    as _i362;
import 'package:dev_journey/di/app_module.dart' as _i713;
import 'package:dev_journey/domain/repository/catalog_repository.dart' as _i403;
import 'package:dev_journey/domain/repository/goals_repository.dart' as _i516;
import 'package:dev_journey/domain/repository/notes_repository.dart' as _i243;
import 'package:dev_journey/domain/repository/progress_repository.dart'
    as _i293;
import 'package:dev_journey/domain/repository/roadmap_repository.dart' as _i69;
import 'package:dev_journey/domain/repository/settings_repository.dart'
    as _i689;
import 'package:dev_journey/domain/usecase/bookmark_topic_use_case.dart'
    as _i325;
import 'package:dev_journey/domain/usecase/check_in_goal_use_case.dart'
    as _i849;
import 'package:dev_journey/domain/usecase/delete_goal_use_case.dart' as _i287;
import 'package:dev_journey/domain/usecase/delete_note_use_case.dart' as _i159;
import 'package:dev_journey/domain/usecase/find_note_use_case.dart' as _i872;
import 'package:dev_journey/domain/usecase/restore_note_use_case.dart' as _i672;
import 'package:dev_journey/domain/usecase/save_goal_use_case.dart' as _i190;
import 'package:dev_journey/domain/usecase/save_note_use_case.dart' as _i250;
import 'package:dev_journey/domain/usecase/set_active_roadmap_use_case.dart'
    as _i666;
import 'package:dev_journey/domain/usecase/set_section_completed_use_case.dart'
    as _i563;
import 'package:dev_journey/domain/usecase/set_topic_completed_use_case.dart'
    as _i623;
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart'
    as _i406;
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart'
    as _i198;
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart' as _i426;
import 'package:dev_journey/domain/usecase/undo_check_in_use_case.dart'
    as _i675;
import 'package:dev_journey/domain/usecase/watch_dashboard_use_case.dart'
    as _i618;
import 'package:dev_journey/domain/usecase/watch_goal_progress_use_case.dart'
    as _i85;
import 'package:dev_journey/domain/usecase/watch_notes_use_case.dart' as _i387;
import 'package:dev_journey/domain/usecase/watch_roadmap_path_use_case.dart'
    as _i808;
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart'
    as _i546;
import 'package:dev_journey/domain/usecase/watch_settings_use_case.dart'
    as _i594;
import 'package:dev_journey/domain/usecase/watch_topic_choices_use_case.dart'
    as _i977;
import 'package:dev_journey/domain/usecase/watch_topic_use_case.dart' as _i816;
import 'package:dev_journey/features/dashboard/cubit/dashboard_cubit.dart'
    as _i353;
import 'package:dev_journey/features/goals/cubit/goals_cubit.dart' as _i981;
import 'package:dev_journey/features/note_editor/cubit/note_editor_cubit.dart'
    as _i398;
import 'package:dev_journey/features/notes/cubit/notes_cubit.dart' as _i144;
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart'
    as _i424;
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_cubit.dart'
    as _i481;
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_cubit.dart'
    as _i1057;
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
    gh.lazySingleton<_i46.LearningDao>(
      () => appModule.learningDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i751.NotesDao>(
      () => appModule.notesDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i430.GoalsDao>(
      () => appModule.goalsDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i650.UserDataDao>(
      () => appModule.userDataDao(gh<_i340.AppDatabase>()),
    );
    gh.lazySingleton<_i669.SettingsLocalDataSource>(
      () =>
          _i669.SettingsLocalDataSource(gh<_i460.SharedPreferencesWithCache>()),
    );
    gh.lazySingleton<_i293.ProgressRepository>(
      () => _i1067.ProgressRepositoryImpl(
        gh<_i46.LearningDao>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.lazySingleton<_i241.AssetJsonLoader>(
      () => _i241.AssetJsonLoader(gh<_i281.AssetBundle>()),
    );
    gh.lazySingleton<_i243.NotesRepository>(
      () => _i801.NotesRepositoryImpl(
        gh<_i751.NotesDao>(),
        gh<_i927.IdGenerator>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.factory<_i159.DeleteNoteUseCase>(
      () => _i159.DeleteNoteUseCase(gh<_i243.NotesRepository>()),
    );
    gh.factory<_i872.FindNoteUseCase>(
      () => _i872.FindNoteUseCase(gh<_i243.NotesRepository>()),
    );
    gh.factory<_i672.RestoreNoteUseCase>(
      () => _i672.RestoreNoteUseCase(gh<_i243.NotesRepository>()),
    );
    gh.factory<_i250.SaveNoteUseCase>(
      () => _i250.SaveNoteUseCase(gh<_i243.NotesRepository>()),
    );
    gh.factory<_i387.WatchNotesUseCase>(
      () => _i387.WatchNotesUseCase(gh<_i243.NotesRepository>()),
    );
    gh.lazySingleton<_i516.GoalsRepository>(
      () => _i138.GoalsRepositoryImpl(
        gh<_i430.GoalsDao>(),
        gh<_i927.IdGenerator>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.lazySingleton<_i69.RoadmapRepository>(
      () => _i5.RoadmapRepositoryImpl(
        gh<_i1010.CatalogDao>(),
        gh<_i46.LearningDao>(),
      ),
    );
    gh.factory<_i325.BookmarkTopicUseCase>(
      () => _i325.BookmarkTopicUseCase(gh<_i293.ProgressRepository>()),
    );
    gh.factory<_i563.SetSectionCompletedUseCase>(
      () => _i563.SetSectionCompletedUseCase(gh<_i293.ProgressRepository>()),
    );
    gh.factory<_i623.SetTopicCompletedUseCase>(
      () => _i623.SetTopicCompletedUseCase(gh<_i293.ProgressRepository>()),
    );
    gh.factory<_i85.WatchGoalProgressUseCase>(
      () => _i85.WatchGoalProgressUseCase(
        gh<_i516.GoalsRepository>(),
        gh<_i454.Clock>(),
      ),
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
    gh.factory<_i144.NotesCubit>(
      () => _i144.NotesCubit(
        gh<_i387.WatchNotesUseCase>(),
        gh<_i159.DeleteNoteUseCase>(),
        gh<_i672.RestoreNoteUseCase>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.factory<_i618.WatchDashboardUseCase>(
      () => _i618.WatchDashboardUseCase(
        gh<_i689.SettingsRepository>(),
        gh<_i69.RoadmapRepository>(),
        gh<_i293.ProgressRepository>(),
        gh<_i85.WatchGoalProgressUseCase>(),
        gh<_i243.NotesRepository>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.factory<_i353.DashboardCubit>(
      () => _i353.DashboardCubit(gh<_i618.WatchDashboardUseCase>()),
    );
    gh.factory<_i666.SetActiveRoadmapUseCase>(
      () => _i666.SetActiveRoadmapUseCase(gh<_i689.SettingsRepository>()),
    );
    gh.factory<_i406.StartLearningUseCase>(
      () => _i406.StartLearningUseCase(gh<_i689.SettingsRepository>()),
    );
    gh.factory<_i594.WatchSettingsUseCase>(
      () => _i594.WatchSettingsUseCase(gh<_i689.SettingsRepository>()),
    );
    gh.factory<_i849.CheckInGoalUseCase>(
      () => _i849.CheckInGoalUseCase(gh<_i516.GoalsRepository>()),
    );
    gh.factory<_i287.DeleteGoalUseCase>(
      () => _i287.DeleteGoalUseCase(gh<_i516.GoalsRepository>()),
    );
    gh.factory<_i190.SaveGoalUseCase>(
      () => _i190.SaveGoalUseCase(gh<_i516.GoalsRepository>()),
    );
    gh.factory<_i675.UndoCheckInUseCase>(
      () => _i675.UndoCheckInUseCase(gh<_i516.GoalsRepository>()),
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
    gh.factory<_i808.WatchRoadmapPathUseCase>(
      () => _i808.WatchRoadmapPathUseCase(gh<_i69.RoadmapRepository>()),
    );
    gh.factory<_i546.WatchRoadmapsUseCase>(
      () => _i546.WatchRoadmapsUseCase(gh<_i69.RoadmapRepository>()),
    );
    gh.factory<_i977.WatchTopicChoicesUseCase>(
      () => _i977.WatchTopicChoicesUseCase(gh<_i69.RoadmapRepository>()),
    );
    gh.factory<_i816.WatchTopicUseCase>(
      () => _i816.WatchTopicUseCase(gh<_i69.RoadmapRepository>()),
    );
    gh.factory<_i481.RoadmapsCubit>(
      () => _i481.RoadmapsCubit(
        gh<_i546.WatchRoadmapsUseCase>(),
        gh<_i594.WatchSettingsUseCase>(),
        gh<_i426.SyncCatalogUseCase>(),
      ),
    );
    gh.factory<_i198.StartWithDemoProgressUseCase>(
      () => _i198.StartWithDemoProgressUseCase(
        gh<_i403.CatalogRepository>(),
        gh<_i406.StartLearningUseCase>(),
      ),
    );
    gh.factoryParam<_i398.NoteEditorCubit, String?, String?>(
      (noteId, topicId) => _i398.NoteEditorCubit(
        gh<_i872.FindNoteUseCase>(),
        gh<_i250.SaveNoteUseCase>(),
        gh<_i159.DeleteNoteUseCase>(),
        gh<_i977.WatchTopicChoicesUseCase>(),
        noteId,
        topicId,
      ),
    );
    gh.factoryParam<_i424.RoadmapDetailCubit, String, dynamic>(
      (roadmapId, _) => _i424.RoadmapDetailCubit(
        gh<_i808.WatchRoadmapPathUseCase>(),
        gh<_i594.WatchSettingsUseCase>(),
        gh<_i563.SetSectionCompletedUseCase>(),
        gh<_i666.SetActiveRoadmapUseCase>(),
        roadmapId,
      ),
    );
    gh.factory<_i981.GoalsCubit>(
      () => _i981.GoalsCubit(
        gh<_i85.WatchGoalProgressUseCase>(),
        gh<_i190.SaveGoalUseCase>(),
        gh<_i287.DeleteGoalUseCase>(),
        gh<_i849.CheckInGoalUseCase>(),
        gh<_i675.UndoCheckInUseCase>(),
        gh<_i454.Clock>(),
      ),
    );
    gh.factoryParam<_i1057.TopicDetailCubit, String, dynamic>(
      (topicId, _) => _i1057.TopicDetailCubit(
        gh<_i816.WatchTopicUseCase>(),
        gh<_i623.SetTopicCompletedUseCase>(),
        gh<_i325.BookmarkTopicUseCase>(),
        gh<_i387.WatchNotesUseCase>(),
        gh<_i454.Clock>(),
        topicId,
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
