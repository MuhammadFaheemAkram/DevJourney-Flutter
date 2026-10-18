import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/data/mapper/demo_progress_mappers.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/repository/catalog_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

@LazySingleton(as: CatalogRepository)
class CatalogRepositoryImpl implements CatalogRepository {
  const CatalogRepositoryImpl(
    this._service,
    this._catalog,
    this._userData,
    this._clock,
  );

  final LearningService _service;
  final CatalogDao _catalog;
  final UserDataDao _userData;
  final Clock _clock;

  @override
  Future<Result<SyncResult>> sync() => _guard('Syncing the catalog', () async {
    final catalog = await _service.fetchCatalog();
    final added = await _catalog.upsertCatalog(catalog.toRows());
    return SyncResult(
      version: catalog.version,
      newRoadmaps: added.roadmaps,
      newTopics: added.topics,
      newResources: added.resources,
      newChallenges: added.challenges,
    );
  });

  @override
  Future<Result<void>> loadDemoProgress() =>
      _guard('Loading the demo progress', () async {
        final progress = await _service.fetchDemoProgress();
        final rows = progress.toUserRows(
          now: _clock.now(),
          catalog: await _catalog.ids(),
        );
        await _userData.replaceAll(rows);
      });

  /// Maps every failure to an [AppException] the UI can show: the app's own
  /// exceptions pass through, malformed data becomes [DataFormatException],
  /// and anything else (a database error) is logged and becomes
  /// [UnknownException].
  Future<Result<T>> _guard<T>(String what, Future<T> Function() run) async {
    try {
      return Ok(await run());
    } on AppException catch (exception) {
      return Err(exception);
    } on FormatException catch (error, stackTrace) {
      log('$what failed', error: error, stackTrace: stackTrace);
      return const Err(DataFormatException());
    } on CheckedFromJsonException catch (error, stackTrace) {
      log('$what failed', error: error, stackTrace: stackTrace);
      return const Err(DataFormatException());
    } on Object catch (error, stackTrace) {
      log('$what failed', error: error, stackTrace: stackTrace);
      return const Err(UnknownException());
    }
  }
}
