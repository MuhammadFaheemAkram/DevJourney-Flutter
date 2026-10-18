import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenges/challenges_view.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_cubit.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<ChallengesState>
    implements ChallengesCubit {}

void main() {
  late _MockCubit cubit;

  ChallengeItem item(
    String id,
    Difficulty difficulty,
    ChallengeStatus status,
  ) => ChallengeItem(
    challenge: Challenge(
      id: id,
      title: 'Challenge $id',
      category: ChallengeCategory.sql,
      difficulty: difficulty,
      prompt: '',
      hints: const [],
    ),
    progress: ChallengeProgress(status: status),
  );

  final ready = ChallengesState(
    status: ChallengesStatus.ready,
    challenges: [
      item('a', Difficulty.beginner, ChallengeStatus.done),
      item('b', Difficulty.advanced, ChallengeStatus.todo),
    ],
  );

  setUpAll(() {
    registerFallbackValue(Difficulty.beginner);
    registerFallbackValue(ChallengeStatus.todo);
  });

  setUp(() => cubit = _MockCubit());

  Future<void> pump(WidgetTester tester, ChallengesState state) {
    whenListen(
      cubit,
      const Stream<ChallengesState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<ChallengesCubit>.value(
        value: cubit,
        child: const ChallengesView(),
      ),
    );
  }

  testWidgets('the filters and the cards', (tester) async {
    await pump(tester, ready);

    expect(find.text('2 challenges'), findsOneWidget);
    expect(find.text('Challenge a'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Advanced'));
    verify(() => cubit.filterByDifficulty(Difficulty.advanced)).called(1);
    await tester.tap(
      find.descendant(
        of: find.byType(SegmentedButton<ChallengeStatus?>),
        matching: find.text('Done'),
      ),
    );
    verify(() => cubit.filterByStatus(ChallengeStatus.done)).called(1);
  });

  testWidgets('nothing matches: a way back to all', (tester) async {
    await pump(tester, ready.copyWith(difficulty: Difficulty.intermediate));

    expect(find.text('No challenges match'), findsOneWidget);
    await tester.tap(find.text('Show all'));
    verify(() => cubit.clearFilters()).called(1);
  });
}
