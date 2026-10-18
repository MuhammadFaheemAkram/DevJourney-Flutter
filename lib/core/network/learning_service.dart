import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';

/// The app's only "remote" API: it serves the learning catalog, and sample
/// progress for the demo.
///
/// DevJourney is offline-first: once synced, the catalog lives in drift and
/// every screen reads it there. The interface still looks like a real API
/// (async, typed DTOs, throwing `AppException`s), so a real implementation
/// could replace the fake without changing any caller.
abstract interface class LearningService {
  /// The whole catalog: roadmaps (with their sections and topics),
  /// resources and challenges.
  ///
  /// Throws a `NetworkException` when the request fails, and a
  /// `FormatException` (or `CheckedFromJsonException`) for malformed data.
  Future<CatalogDto> fetchCatalog();

  /// Sample progress for "Explore with demo progress", with relative dates.
  Future<DemoProgressDto> fetchDemoProgress();
}
