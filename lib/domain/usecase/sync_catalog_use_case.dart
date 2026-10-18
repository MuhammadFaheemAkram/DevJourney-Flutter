import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:dev_journey/domain/repository/catalog_repository.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Syncs the catalog, then records which version the device now holds.
@injectable
class SyncCatalogUseCase {
  const SyncCatalogUseCase(this._catalog, this._settings);

  final CatalogRepository _catalog;
  final SettingsRepository _settings;

  Future<Result<SyncResult>> call() async {
    final result = await _catalog.sync();
    if (result case Ok(:final value)) {
      await _settings.setCatalogVersion(value.version);
    }
    return result;
  }
}
