import 'dart:async';

import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/usecase/watch_challenges_use_case.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// The challenges, kept live, filtered by difficulty and status in memory
/// (a dozen rows need no query per filter).
@injectable
class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit(this._watchChallenges) : super(const ChallengesState());

  final WatchChallengesUseCase _watchChallenges;

  StreamSubscription<List<ChallengeItem>>? _challenges;

  void load() {
    _challenges ??= _watchChallenges().listen(
      (challenges) => emit(
        state.copyWith(status: ChallengesStatus.ready, challenges: challenges),
      ),
      onError: (Object _) =>
          emit(state.copyWith(status: ChallengesStatus.failure)),
    );
  }

  void filterByDifficulty(Difficulty? difficulty) =>
      emit(state.copyWith(difficulty: difficulty));

  void filterByStatus(ChallengeStatus? status) =>
      emit(state.copyWith(challengeStatus: status));

  void clearFilters() =>
      emit(state.copyWith(difficulty: null, challengeStatus: null));

  @override
  Future<void> close() async {
    await _challenges?.cancel();
    return super.close();
  }
}
