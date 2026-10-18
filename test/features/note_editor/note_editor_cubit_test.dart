import 'package:dev_journey/features/note_editor/cubit/note_editor_cubit.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_state.dart';
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

  Future<NoteEditorCubit> open({String? noteId, String? topicId}) async {
    final cubit = NoteEditorCubit(
      stack.findNote,
      stack.saveNote,
      stack.deleteNote,
      stack.watchTopicChoices,
      noteId,
      topicId,
    );
    addTearDown(cubit.close);
    await cubit.load();
    return cubit;
  }

  Future<int> noteCount() async =>
      (await stack.notes.watchNotes().first).length;

  test('a new note from a topic: attached, and not yet changed', () async {
    final cubit = await open(topicId: 'flutter-streams');
    final state = await waitFor(cubit, (s) => s.topics.isNotEmpty);

    expect(state.status, NoteEditorStatus.editing);
    expect(state.topic?.title, 'Streams');
    expect(state.isDirty, isFalse);
  });

  test('an empty new note is discarded, not saved', () async {
    final cubit = await open();
    cubit.contentChanged('   ');

    await cubit.save();

    expect(cubit.state.exit, isA<NoteDiscarded>());
    expect(await noteCount(), 3);
  });

  test('content without a title: the error shows, nothing is saved', () async {
    final cubit = await open();
    cubit.contentChanged('Some text');

    await cubit.save();

    expect(cubit.state.exit, isNull);
    expect(cubit.state.titleError, 'Give the note a title');
    expect(await noteCount(), 3);
  });

  test('a valid new note is saved', () async {
    final cubit = await open();
    cubit
      ..titleChanged('Keys')
      ..contentChanged('Use `ValueKey` in lists.')
      ..topicChanged('flutter-widgets');

    await cubit.save();

    expect(cubit.state.exit, isA<NoteSaved>());
    final latest = (await stack.notes.watchNotes().first).first;
    expect(latest.note.title, 'Keys');
    expect(latest.topicTitle, 'Widgets and the widget tree');
  });

  test('editing: loads the note, saves the change', () async {
    final cubit = await open(noteId: 'note-interview');
    expect(cubit.state.draft.title, 'Interview questions to practise');

    cubit.topicChanged('flutter-state');
    expect(cubit.state.isDirty, isTrue);
    await cubit.save();

    expect(cubit.state.exit, isA<NoteSaved>());
    expect((await stack.findNote('note-interview'))?.topicId, 'flutter-state');
  });

  test('deleting closes with the note, for Undo underneath', () async {
    final cubit = await open(noteId: 'note-interview');

    await cubit.delete();

    final exit = cubit.state.exit;
    expect(exit, isA<NoteDeleted>());
    expect((exit! as NoteDeleted).note.id, 'note-interview');
    expect(await stack.findNote('note-interview'), isNull);
  });

  test('a note that no longer exists', () async {
    final cubit = await open(noteId: 'gone');

    expect(cubit.state.status, NoteEditorStatus.notFound);
  });
}
