import 'dart:math';

import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/id_generator.dart';
import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/network/asset_json_loader.dart';
import 'package:dev_journey/core/network/catalog_publisher.dart';
import 'package:dev_journey/core/network/fake_api_developer_tools.dart';
import 'package:dev_journey/core/network/fake_learning_service.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/data/repository/catalog_repository_impl.dart';
import 'package:dev_journey/data/repository/challenges_repository_impl.dart';
import 'package:dev_journey/data/repository/goals_repository_impl.dart';
import 'package:dev_journey/data/repository/notes_repository_impl.dart';
import 'package:dev_journey/data/repository/progress_repository_impl.dart';
import 'package:dev_journey/data/repository/resources_repository_impl.dart';
import 'package:dev_journey/data/repository/roadmap_repository_impl.dart';
import 'package:dev_journey/data/repository/search_repository_impl.dart';
import 'package:dev_journey/domain/usecase/bookmark_resource_use_case.dart';
import 'package:dev_journey/domain/usecase/bookmark_topic_use_case.dart';
import 'package:dev_journey/domain/usecase/change_reminder_time_use_case.dart';
import 'package:dev_journey/domain/usecase/check_in_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/clear_recent_searches_use_case.dart';
import 'package:dev_journey/domain/usecase/delete_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/delete_note_use_case.dart';
import 'package:dev_journey/domain/usecase/find_note_use_case.dart';
import 'package:dev_journey/domain/usecase/open_link_use_case.dart';
import 'package:dev_journey/domain/usecase/open_resource_use_case.dart';
import 'package:dev_journey/domain/usecase/refresh_reminder_use_case.dart';
import 'package:dev_journey/domain/usecase/reset_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/restore_note_use_case.dart';
import 'package:dev_journey/domain/usecase/save_goal_use_case.dart';
import 'package:dev_journey/domain/usecase/save_note_use_case.dart';
import 'package:dev_journey/domain/usecase/save_recent_search_use_case.dart';
import 'package:dev_journey/domain/usecase/save_solution_notes_use_case.dart';
import 'package:dev_journey/domain/usecase/set_active_roadmap_use_case.dart';
import 'package:dev_journey/domain/usecase/set_challenge_status_use_case.dart';
import 'package:dev_journey/domain/usecase/set_reminder_enabled_use_case.dart';
import 'package:dev_journey/domain/usecase/set_section_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/set_topic_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart';
import 'package:dev_journey/domain/usecase/start_with_demo_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/sync_catalog_use_case.dart';
import 'package:dev_journey/domain/usecase/undo_check_in_use_case.dart';
import 'package:dev_journey/domain/usecase/update_dynamic_color_use_case.dart';
import 'package:dev_journey/domain/usecase/update_theme_mode_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_analytics_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_challenge_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_challenges_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_dashboard_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_goal_progress_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_notes_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_recent_searches_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_resources_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmap_path_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_roadmaps_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_search_results_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_settings_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_topic_choices_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_topic_use_case.dart';
import 'package:flutter/services.dart';

import 'database.dart';
import 'fakes/fake_recent_searches_repository.dart';
import 'fakes/fake_reminder_scheduler.dart';
import 'fakes/fake_settings_repository.dart';
import 'fakes/recording_link_opener.dart';
import 'test_dependencies.dart';

/// The real repositories and use cases on an in-memory database, with a
/// fixed clock and the real fake service (zero latency, reading the bundled
/// JSON): what Cubit and repository tests run against instead of mocks.
///
/// Tests that read the bundled assets need
/// `TestWidgetsFlutterBinding.ensureInitialized()`.
class DataStack {
  DataStack({DateTime? now, LearningService? service})
    : clock = Clock.fixed(now ?? demoNow) {
    this.service =
        service ??
        FakeLearningService(AssetJsonLoader(rootBundle), network, publisher);
  }

  final Clock clock;
  final network = NetworkSimulator(latency: Duration.zero);
  final publisher = CatalogPublisher();
  late final LearningService service;
  late final developerTools = FakeApiDeveloperTools(network, publisher);
  final reminders = FakeReminderScheduler();
  final AppDatabase db = newTestDatabase();
  final settings = FakeSettingsRepository();
  final recentSearches = FakeRecentSearchesRepository();
  final links = RecordingLinkOpener();

  /// Seeded, so ids repeat from run to run.
  final ids = IdGenerator(random: Random(7));

  late final catalog = CatalogRepositoryImpl(
    service,
    db.catalogDao,
    db.userDataDao,
    clock,
  );
  late final roadmaps = RoadmapRepositoryImpl(db.catalogDao, db.learningDao);
  late final progress = ProgressRepositoryImpl(
    db.learningDao,
    db.userDataDao,
    clock,
  );
  late final notes = NotesRepositoryImpl(db.notesDao, ids, clock);
  late final goals = GoalsRepositoryImpl(db.goalsDao, ids, clock);
  late final challenges = ChallengesRepositoryImpl(db.challengesDao, clock);
  late final resources = ResourcesRepositoryImpl(db.resourcesDao, clock);
  late final search = SearchRepositoryImpl(db.searchDao);

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
  late final watchNotes = WatchNotesUseCase(notes);
  late final findNote = FindNoteUseCase(notes);
  late final saveNote = SaveNoteUseCase(notes);
  late final deleteNote = DeleteNoteUseCase(notes);
  late final restoreNote = RestoreNoteUseCase(notes);
  late final watchTopicChoices = WatchTopicChoicesUseCase(roadmaps);
  late final watchGoalProgress = WatchGoalProgressUseCase(goals, clock);
  late final saveGoal = SaveGoalUseCase(goals);
  late final deleteGoal = DeleteGoalUseCase(goals);
  late final checkInGoal = CheckInGoalUseCase(goals);
  late final undoCheckIn = UndoCheckInUseCase(goals);
  late final watchChallenges = WatchChallengesUseCase(challenges);
  late final watchChallenge = WatchChallengeUseCase(challenges);
  late final setChallengeStatus = SetChallengeStatusUseCase(challenges);
  late final saveSolutionNotes = SaveSolutionNotesUseCase(challenges);
  late final watchResources = WatchResourcesUseCase(resources);
  late final bookmarkResource = BookmarkResourceUseCase(resources);
  late final openLink = OpenLinkUseCase(links);
  late final openResource = OpenResourceUseCase(resources, openLink);
  late final watchSearchResults = WatchSearchResultsUseCase(search);
  late final watchRecentSearches = WatchRecentSearchesUseCase(recentSearches);
  late final saveRecentSearch = SaveRecentSearchUseCase(recentSearches);
  late final clearRecentSearches = ClearRecentSearchesUseCase(recentSearches);
  late final updateThemeMode = UpdateThemeModeUseCase(settings);
  late final updateDynamicColor = UpdateDynamicColorUseCase(settings);
  late final setReminderEnabled = SetReminderEnabledUseCase(
    settings,
    reminders,
  );
  late final changeReminderTime = ChangeReminderTimeUseCase(
    settings,
    reminders,
  );
  late final refreshReminder = RefreshReminderUseCase(settings, reminders);
  late final resetProgress = ResetProgressUseCase(progress);
  late final watchAnalytics = WatchAnalyticsUseCase(goals, roadmaps, clock);
  late final watchDashboard = WatchDashboardUseCase(
    settings,
    roadmaps,
    progress,
    watchGoalProgress,
    notes,
    challenges,
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
