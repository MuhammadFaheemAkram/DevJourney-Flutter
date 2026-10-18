import 'package:dev_journey/core/network/asset_json_loader.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:injectable/injectable.dart';

/// Serves the catalog and the demo progress from JSON files bundled with the
/// app, after a simulated network delay (700 ms) that can also fail on
/// request.
@LazySingleton(as: LearningService)
class FakeLearningService implements LearningService {
  const FakeLearningService(this._json, this._network);

  static const catalogPath = 'assets/json/catalog_v1.json';
  static const demoProgressPath = 'assets/json/demo_progress.json';

  final AssetJsonLoader _json;
  final NetworkSimulator _network;

  @override
  Future<CatalogDto> fetchCatalog() async {
    await _network();
    return CatalogDto.fromJson(await _json.loadObject(catalogPath));
  }

  @override
  Future<DemoProgressDto> fetchDemoProgress() async {
    await _network();
    return DemoProgressDto.fromJson(await _json.loadObject(demoProgressPath));
  }
}
