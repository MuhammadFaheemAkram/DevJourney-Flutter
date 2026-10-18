import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_cubit.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/wait_for.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  // A short pause, in real time: drift runs on the real event loop.
  ChallengeDetailCubit cubitFor(
    String id, {
    Duration notesDelay = const Duration(milliseconds: 20),
  }) => ChallengeDetailCubit(
    stack.watchChallenge,
    stack.setChallengeStatus,
    stack.saveSolutionNotes,
    id,
    notesDelay: notesDelay,
  )..load();

  Future<String> savedNotes(String id) async =>
      (await stack.watchChallenge(id).first)!.progress.solutionNotes;

  test('opens with the saved notes and status', () async {
    final cubit = cubitFor('ch-responsive-grid');
    addTearDown(cubit.close);

    final state = await waitFor(cubit, (s) => s.item != null);

    expect(state.item!.status, ChallengeStatus.inProgress);
    expect(state.notes, 'Breakpoints at 600 and 1024.');
    expect(state.notesSave, NotesSaveStatus.saved);
  });

  test('hints one at a time, up to the last', () async {
    final cubit = cubitFor('ch-debounce');
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.item != null);

    for (var i = 0; i < 5; i++) {
      cubit.showNextHint();
    }

    expect(cubit.state.hintsShown, 3);
  });

  test('status changes reach the database', () async {
    final cubit = cubitFor('ch-lru-cache');
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.item != null);

    await cubit.setStatus(ChallengeStatus.done);

    await waitFor(cubit, (s) => s.item!.status == ChallengeStatus.done);
    expect((await stack.progress.watchCompletedCounts().first).challenges, 2);
  });

  test('notes save once the typing pauses: one write for many keys', () async {
    final cubit = cubitFor('ch-lru-cache');
    addTearDown(cubit.close);
    await waitFor(cubit, (s) => s.item != null);

    cubit
      ..notesChanged('A')
      ..notesChanged('A map')
      ..notesChanged('A linked map');
    expect(cubit.state.notesSave, NotesSaveStatus.pending);
    expect(await savedNotes('ch-lru-cache'), '');

    await waitFor(cubit, (s) => s.notesSave == NotesSaveStatus.saved);
    expect(await savedNotes('ch-lru-cache'), 'A linked map');
  });

  test('leaving saves what is still waiting', () async {
    final cubit = cubitFor(
      'ch-lru-cache',
      notesDelay: const Duration(hours: 1),
    );
    await waitFor(cubit, (s) => s.item != null);

    cubit.notesChanged('Typed, then left');
    await cubit.close();

    expect(await savedNotes('ch-lru-cache'), 'Typed, then left');
  });

  test('a challenge that no longer exists', () async {
    final cubit = cubitFor('gone');
    addTearDown(cubit.close);

    await waitFor(cubit, (s) => s.status == ChallengeDetailStatus.notFound);
  });
}
