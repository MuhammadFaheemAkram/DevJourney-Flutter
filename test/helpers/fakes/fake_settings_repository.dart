import 'dart:async';

import 'package:dev_journey/domain/model/app_settings.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';

/// Settings in memory, with the real repository's watch behaviour, and a log
/// of the writes in order.
class FakeSettingsRepository implements SettingsRepository {
  FakeSettingsRepository([this._current = const AppSettings()]);

  AppSettings _current;
  final _changes = StreamController<AppSettings>.broadcast(sync: true);

  /// Every write, in order: `onboarded`, `activeRoadmapId`, …
  final writes = <String>[];

  @override
  AppSettings get current => _current;

  @override
  Stream<AppSettings> watch() => Stream.multi((watcher) {
    final subscription = _changes.stream.listen(watcher.add);
    watcher
      ..onCancel = subscription.cancel
      ..add(_current);
  });

  @override
  Future<void> setOnboarded({required bool onboarded}) async {
    writes.add('onboarded');
    publish(_current.copyWith(onboarded: onboarded));
  }

  @override
  Future<void> setActiveRoadmapId(String roadmapId) async {
    writes.add('activeRoadmapId');
    publish(_current.copyWith(activeRoadmapId: roadmapId));
  }

  @override
  Future<void> setCatalogVersion(int version) async {
    writes.add('catalogVersion');
    publish(_current.copyWith(catalogVersion: version));
  }

  void publish(AppSettings settings) {
    _current = settings;
    _changes.add(settings);
  }
}
