import 'package:clock/clock.dart';
import 'package:dev_journey/domain/calculation/goals.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/repository/goals_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

/// Every goal with its progress in the current window, kept live: the goals
/// combined with the activity they count.
@injectable
class WatchGoalProgressUseCase {
  const WatchGoalProgressUseCase(this._goals, this._clock);

  final GoalsRepository _goals;
  final Clock _clock;

  Stream<List<GoalProgress>> call() => _goals.watchGoals().combineLatest(
    _goals.watchActivity(),
    (goals, activity) {
      final today = CalendarDate.fromDateTime(_clock.now());
      return [
        for (final goal in goals) goalProgress(goal, activity, today: today),
      ];
    },
  );
}
