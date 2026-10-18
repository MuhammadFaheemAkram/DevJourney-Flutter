import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';

/// The learning catalog, and the demo progress that goes with it.
abstract interface class CatalogRepository {
  /// Fetches the catalog and upserts it in one transaction: new content is
  /// added, changed content updated, and the user's data never touched.
  Future<Result<SyncResult>> sync();

  /// Fetches the sample progress and writes it, replacing the user's data,
  /// in one transaction. The catalog must be synced first.
  Future<Result<void>> loadDemoProgress();
}
