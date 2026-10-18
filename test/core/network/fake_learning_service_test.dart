import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/network/asset_json_loader.dart';
import 'package:dev_journey/core/network/catalog_publisher.dart';
import 'package:dev_journey/core/network/fake_learning_service.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NetworkSimulator network;
  late FakeLearningService service;

  setUp(() {
    network = NetworkSimulator(latency: Duration.zero);
    service = FakeLearningService(
      AssetJsonLoader(rootBundle),
      network,
      CatalogPublisher(),
    );
  });

  test('serves the bundled catalog and demo progress', () async {
    final catalog = await service.fetchCatalog();
    final demo = await service.fetchDemoProgress();

    expect(catalog.version, 1);
    expect(catalog.roadmaps.first.title, 'Flutter Developer');
    expect(demo.completedTopics, isNotEmpty);
  });

  test('fails every request while the network is "down"', () async {
    network.failRequests = true;

    await expectLater(service.fetchCatalog(), throwsA(isA<NetworkException>()));
    await expectLater(
      service.fetchDemoProgress(),
      throwsA(isA<NetworkException>()),
    );
  });
}
