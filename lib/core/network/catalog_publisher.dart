import 'package:injectable/injectable.dart';

/// Which catalog the fake learning API serves: version 1, or version 2 once
/// "Publish a catalog update" is on (Settings → Developer). In memory: back
/// to version 1 at every launch, as a real server's history would be.
@lazySingleton
class CatalogPublisher {
  bool publishesUpdate = false;

  String get catalogPath => publishesUpdate
      ? 'assets/json/catalog_v2.json'
      : 'assets/json/catalog_v1.json';
}
