import 'package:dev_journey/core/network/catalog_publisher.dart';
import 'package:dev_journey/core/network/network_simulator.dart';
import 'package:dev_journey/domain/service/developer_tools.dart';
import 'package:injectable/injectable.dart';

/// The developer switches, wired to the fake learning API.
@LazySingleton(as: DeveloperTools)
class FakeApiDeveloperTools implements DeveloperTools {
  const FakeApiDeveloperTools(this._network, this._publisher);

  final NetworkSimulator _network;
  final CatalogPublisher _publisher;

  @override
  bool get simulatesNetworkFailure => _network.failRequests;

  @override
  set simulatesNetworkFailure(bool value) => _network.failRequests = value;

  @override
  bool get publishesCatalogUpdate => _publisher.publishesUpdate;

  @override
  set publishesCatalogUpdate(bool value) => _publisher.publishesUpdate = value;
}
