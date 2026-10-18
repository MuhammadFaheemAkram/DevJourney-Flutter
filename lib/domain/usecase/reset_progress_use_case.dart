import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/progress_repository.dart';
import 'package:injectable/injectable.dart';

/// Starts the learning over: completions, bookmarks, check-ins and
/// challenge work go; notes, goals, the catalog and settings stay.
@injectable
class ResetProgressUseCase {
  const ResetProgressUseCase(this._progress);

  final ProgressRepository _progress;

  Future<Result<void>> call() => _progress.resetProgress();
}
