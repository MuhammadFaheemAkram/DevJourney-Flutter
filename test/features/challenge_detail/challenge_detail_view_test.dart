import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenge_detail/challenge_detail_view.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_cubit.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<ChallengeDetailState>
    implements ChallengeDetailCubit {}

void main() {
  late _MockCubit cubit;

  const item = ChallengeItem(
    challenge: Challenge(
      id: 'c',
      title: 'Debounce a stream',
      category: ChallengeCategory.dart,
      difficulty: Difficulty.intermediate,
      prompt: 'Only pass the last event of a burst.',
      hints: ['Use a Timer', 'Cancel the previous one'],
    ),
  );
  const found = ChallengeDetailState(
    status: ChallengeDetailStatus.found,
    item: item,
  );

  setUpAll(() => registerFallbackValue(ChallengeStatus.todo));

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.setStatus(any())).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, ChallengeDetailState state) {
    whenListen(
      cubit,
      const Stream<ChallengeDetailState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<ChallengeDetailCubit>.value(
        value: cubit,
        child: const ChallengeDetailView(),
      ),
    );
  }

  testWidgets('the prompt, the status, and hints still hidden', (tester) async {
    await pump(tester, found);

    expect(find.text('Debounce a stream'), findsOneWidget);
    expect(find.text('Only pass the last event of a burst.'), findsOneWidget);
    expect(find.text('Use a Timer'), findsNothing);

    await tester.tap(find.text('In progress'));
    verify(() => cubit.setStatus(ChallengeStatus.inProgress)).called(1);
    await tester.tap(find.text('Show a hint (2 available)'));
    verify(() => cubit.showNextHint()).called(1);
  });

  testWidgets('one hint shown, the next offered', (tester) async {
    await pump(tester, found.copyWith(hintsShown: 1));

    expect(find.text('Use a Timer'), findsOneWidget);
    expect(find.text('Show the next hint (2 of 2)'), findsOneWidget);
  });

  testWidgets('notes: typing reaches the Cubit; the save state shows', (
    tester,
  ) async {
    await pump(
      tester,
      found.copyWith(notes: 'Draft', notesSave: NotesSaveStatus.pending),
    );

    expect(find.text('Saving…'), findsOneWidget);
    await tester.ensureVisible(find.text('Draft'));
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'Draft'), 'Draft 2');
    verify(() => cubit.notesChanged('Draft 2')).called(1);
  });

  testWidgets('a challenge that no longer exists', (tester) async {
    await pump(
      tester,
      const ChallengeDetailState(status: ChallengeDetailStatus.notFound),
    );

    expect(find.text('This challenge no longer exists'), findsOneWidget);
  });
}
