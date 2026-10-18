import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() => stack = DataStack()); // 14 October 2026
  tearDown(() => stack.close());

  AppException errorOf(Result<Object?> result) => (result as Err).exception;

  test('a first sync stores the whole catalog and reports it new', () async {
    final result = await stack.catalog.sync();

    expect(
      (result as Ok<SyncResult>).value,
      const SyncResult(
        version: 1,
        newRoadmaps: 4,
        newTopics: 32,
        newResources: 35,
        newChallenges: 12,
      ),
    );
    final roadmaps = await stack.roadmaps.watchRoadmaps().first;
    expect(
      [for (final r in roadmaps) (r.roadmap.title, r.totalTopics)],
      [
        ('Flutter Developer', 12),
        ('Backend Developer', 7),
        ('AI Engineer', 7),
        ('System Design', 6),
      ],
    );
  });

  test('syncing again changes nothing', () async {
    await stack.catalog.sync();

    final again = await stack.catalog.sync();

    expect((again as Ok<SyncResult>).value.hasNewContent, isFalse);
  });

  test('the demo progress lands, with dates counted back from today', () async {
    await stack.catalog.sync();

    expect(await stack.catalog.loadDemoProgress(), isA<Ok<void>>());

    final roadmaps = await stack.roadmaps.watchRoadmaps().first;
    final flutter = roadmaps.firstWhere((r) => r.roadmap.id == 'flutter');
    expect((flutter.completedTopics, flutter.totalTopics), (7, 12));
    final latest = await (stack.db.select(
      stack.db.topicProgress,
    )..where((p) => p.topicId.equals('flutter-navigation'))).getSingle();
    expect(latest.completedOn, CalendarDate(2026, 10, 13));
  });

  test('a network failure is a NetworkException; nothing is written', () async {
    final failing = DataStack(service: _FailingService());
    addTearDown(failing.close);

    expect(errorOf(await failing.catalog.sync()), isA<NetworkException>());
    expect(await failing.roadmaps.watchRoadmaps().first, isEmpty);
  });

  test('malformed content is a DataFormatException', () async {
    final broken = DataStack(service: _BrokenService());
    addTearDown(broken.close);

    expect(errorOf(await broken.catalog.sync()), isA<DataFormatException>());
  });
}

class _FailingService implements LearningService {
  @override
  Future<CatalogDto> fetchCatalog() async => throw const NetworkException();

  @override
  Future<DemoProgressDto> fetchDemoProgress() async =>
      throw const NetworkException();
}

class _BrokenService implements LearningService {
  @override
  Future<CatalogDto> fetchCatalog() async =>
      CatalogDto.fromJson({'version': 1, 'roadmaps': 'not a list'});

  @override
  Future<DemoProgressDto> fetchDemoProgress() => throw UnimplementedError();
}
