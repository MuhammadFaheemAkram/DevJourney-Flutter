import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/network/dto/catalog_dto.dart';
import 'package:dev_journey/core/network/dto/demo_progress_dto.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_cubit.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  WelcomeCubit cubitOn(DataStack stack) {
    final cubit = WelcomeCubit(
      stack.syncCatalog,
      stack.watchRoadmaps,
      stack.startLearning,
      stack.startWithDemoProgress,
    );
    addTearDown(cubit.close);
    addTearDown(stack.close);
    return cubit;
  }

  test('loads the roadmaps, with the first selected', () async {
    final cubit = cubitOn(DataStack());

    await cubit.load();

    expect(cubit.state.status, WelcomeStatus.ready);
    expect(cubit.state.roadmaps, hasLength(4));
    expect(cubit.state.selectedRoadmapId, 'flutter');
  });

  test('a failed fetch says why, and Try again recovers', () async {
    final service = _FlakyService();
    final cubit = cubitOn(DataStack(service: service));

    await cubit.load();
    expect(cubit.state.status, WelcomeStatus.failed);
    expect(cubit.state.errorMessage, const NetworkException().message);

    service.online = true;
    await cubit.load();
    expect(cubit.state.status, WelcomeStatus.ready);
  });

  test('start learning with the chosen roadmap', () async {
    final stack = DataStack();
    final cubit = cubitOn(stack);
    await cubit.load();

    cubit.select('system-design');
    await cubit.start(StartChoice.learn);

    expect(stack.settings.current.activeRoadmapId, 'system-design');
    expect(stack.settings.current.onboarded, isTrue);
    expect(cubit.state.starting, isNull);
  });

  test('a second tap while starting does nothing', () async {
    final stack = DataStack();
    final cubit = cubitOn(stack);
    await cubit.load();

    final first = cubit.start(StartChoice.demo);
    await cubit.start(StartChoice.learn);
    await first;

    expect(stack.settings.writes.where((w) => w == 'onboarded'), hasLength(1));
  });

  test('a failed demo start reports it, and stays on Welcome', () async {
    final service = _FlakyService(online: true, demoOnline: false);
    final stack = DataStack(service: service);
    final cubit = cubitOn(stack);
    await cubit.load();

    await cubit.start(StartChoice.demo);

    expect(cubit.state.errorMessage, const NetworkException().message);
    expect(cubit.state.errorSerial, 1);
    expect(cubit.state.starting, isNull);
    expect(stack.settings.current.onboarded, isFalse);
  });
}

class _FlakyService implements LearningService {
  _FlakyService({this.online = false, this.demoOnline = true});

  final _real = DataStack().service;
  bool online;
  bool demoOnline;

  @override
  Future<CatalogDto> fetchCatalog() async {
    if (!online) throw const NetworkException();
    return _real.fetchCatalog();
  }

  @override
  Future<DemoProgressDto> fetchDemoProgress() async {
    if (!demoOnline) throw const NetworkException();
    return _real.fetchDemoProgress();
  }
}
