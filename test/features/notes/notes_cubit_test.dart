import 'package:dev_journey/features/notes/cubit/notes_cubit.dart';
import 'package:dev_journey/features/notes/cubit/notes_state.dart';
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

  NotesCubit newCubit() {
    final cubit = NotesCubit(
      stack.watchNotes,
      stack.deleteNote,
      stack.restoreNote,
      stack.clock,
    )..load();
    addTearDown(cubit.close);
    return cubit;
  }

  List<String> titles(NotesState state) => [
    for (final item in state.notes) item.note.title,
  ];

  test('every note, the latest edit first', () async {
    final state = await waitFor(
      newCubit(),
      (s) => s.status == NotesStatus.ready,
    );

    expect(titles(state), [
      'Interview questions to practise',
      'Streams cheat sheet',
      'Null safety gotchas',
    ]);
    expect(state.notes[1].topicTitle, 'Streams');
  });

  test('searching narrows the list; clearing it brings all back', () async {
    final cubit = newCubit();
    await waitFor(cubit, (s) => s.status == NotesStatus.ready);

    await cubit.search('promotion');
    expect(titles(await waitFor(cubit, (s) => s.notes.length == 1)), [
      'Null safety gotchas',
    ]);

    await cubit.search('');
    await waitFor(cubit, (s) => s.notes.length == 3);
  });

  test(
    'delete: gone at once, offered for Undo, and Undo restores it',
    () async {
      final cubit = newCubit();
      final ready = await waitFor(cubit, (s) => s.status == NotesStatus.ready);
      final streams = ready.notes[1];

      final deleting = cubit.delete(streams);
      expect(cubit.state.notes, hasLength(2));
      await deleting;

      expect(cubit.state.deleted, streams.note);
      expect(cubit.state.deletedSerial, 1);

      await cubit.restore(streams.note);
      final restored = await waitFor(cubit, (s) => s.notes.length == 3);
      expect(restored.notes[1], streams);
    },
  );
}
