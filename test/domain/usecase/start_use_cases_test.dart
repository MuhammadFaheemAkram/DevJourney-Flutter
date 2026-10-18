import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() => stack = DataStack());
  tearDown(() => stack.close());

  test('a sync records the catalog version it stored', () async {
    await stack.syncCatalog();

    expect(stack.settings.current.catalogVersion, 1);
  });

  test('starting sets the roadmap before onboarding ends', () async {
    await stack.startLearning('backend');

    expect(stack.settings.writes, ['activeRoadmapId', 'onboarded']);
    expect(stack.settings.current.activeRoadmapId, 'backend');
    expect(stack.settings.current.onboarded, isTrue);
  });

  test('demo progress, then the start', () async {
    await stack.syncCatalog();

    expect(await stack.startWithDemoProgress('flutter'), isA<Ok<void>>());

    expect(stack.settings.current.onboarded, isTrue);
    expect(await stack.db.select(stack.db.notes).get(), hasLength(3));
  });

  test(
    'a failed demo leaves the user on Welcome, with nothing written',
    () async {
      final failing = DataStack(service: _NoDemoService(stack.service));
      addTearDown(failing.close);
      await failing.syncCatalog();

      final result = await failing.startWithDemoProgress('flutter');

      expect((result as Err).exception, isA<NetworkException>());
      expect(failing.settings.current.onboarded, isFalse);
      expect(await failing.db.select(failing.db.topicProgress).get(), isEmpty);
    },
  );
}

/// Serves the catalog, but fails the demo progress.
class _NoDemoService implements LearningService {
  _NoDemoService(this._real);

  final LearningService _real;

  @override
  Future<CatalogDto> fetchCatalog() => _real.fetchCatalog();

  @override
  Future<DemoProgressDto> fetchDemoProgress() async =>
      throw const NetworkException();
}
