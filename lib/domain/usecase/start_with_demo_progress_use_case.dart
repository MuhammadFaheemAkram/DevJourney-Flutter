import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/catalog_repository.dart';
import 'package:dev_journey/domain/usecase/start_learning_use_case.dart';
import 'package:injectable/injectable.dart';

/// Welcome → "Explore with demo progress": the sample progress is written
/// first; only if that succeeds does onboarding end, so a failure leaves the
/// user on Welcome with nothing half-done.
@injectable
class StartWithDemoProgressUseCase {
  const StartWithDemoProgressUseCase(this._catalog, this._start);

  final CatalogRepository _catalog;
  final StartLearningUseCase _start;

  Future<Result<void>> call(String roadmapId) async {
    final result = await _catalog.loadDemoProgress();
    if (result is Ok) await _start(roadmapId);
    return result;
  }
}
