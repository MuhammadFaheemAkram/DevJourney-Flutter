import 'package:clock/clock.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/challenges_dao.dart';
import 'package:dev_journey/core/database/daos/goals_dao.dart';
import 'package:dev_journey/core/database/daos/learning_dao.dart';
import 'package:dev_journey/core/database/daos/notes_dao.dart';
import 'package:dev_journey/core/database/daos/resources_dao.dart';
import 'package:dev_journey/core/database/daos/search_dao.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/core/storage/settings_local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Registers types the app doesn't own, so they can be injected (and replaced
/// in tests) like everything else.
@module
abstract class AppModule {
  /// The asset bundle the fake learning service reads the catalog from.
  @lazySingleton
  AssetBundle get assetBundle => rootBundle;

  /// The current time, injected so tests can fix it (`Clock.fixed`): "today"
  /// decides every streak, goal period and demo date.
  @lazySingleton
  Clock get clock => const Clock();

  /// One database for the whole app. Several connections to the same SQLite
  /// file would break drift's change notifications.
  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();

  @lazySingleton
  CatalogDao catalogDao(AppDatabase database) => database.catalogDao;

  @lazySingleton
  LearningDao learningDao(AppDatabase database) => database.learningDao;

  @lazySingleton
  NotesDao notesDao(AppDatabase database) => database.notesDao;

  @lazySingleton
  GoalsDao goalsDao(AppDatabase database) => database.goalsDao;

  @lazySingleton
  ChallengesDao challengesDao(AppDatabase database) => database.challengesDao;

  @lazySingleton
  ResourcesDao resourcesDao(AppDatabase database) => database.resourcesDao;

  @lazySingleton
  SearchDao searchDao(AppDatabase database) => database.searchDao;

  @lazySingleton
  UserDataDao userDataDao(AppDatabase database) => database.userDataDao;

  /// `@preResolve` awaits this before `runApp`, so preferences can be read
  /// synchronously from the first frame: the router knows at once whether
  /// to open Welcome or the Dashboard.
  @preResolve
  @lazySingleton
  Future<SharedPreferencesWithCache> get preferences =>
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: SettingsLocalDataSource.allowList,
        ),
      );
}
