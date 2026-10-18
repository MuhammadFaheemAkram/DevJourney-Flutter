import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/data/repository/notes_repository_impl.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/test_dependencies.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.syncCatalogNow();
  });
  tearDown(() => stack.close());

  Note added(Result<Note> result) => (result as Ok<Note>).value;

  test('adding: an id, and now as both times', () async {
    final note = added(
      await stack.notes.addNote(
        const NoteDraft(
          title: 'Streams',
          content: '# Hi',
          topicId: 'flutter-streams',
        ),
      ),
    );

    expect(note.id, startsWith('note_'));
    expect(note.createdAt, stack.clock.now().toUtc());
    expect(note.updatedAt, note.createdAt);
    final items = await stack.notes.watchNotes().first;
    expect(items.single.note, note);
    expect(items.single.topicTitle, 'Streams');
  });

  test('updating keeps the creation time and moves the edit time', () async {
    var now = demoNow;
    final notes = NotesRepositoryImpl(
      stack.db.notesDao,
      stack.ids,
      Clock(() => now),
    );
    final note = added(
      await notes.addNote(const NoteDraft(title: 'A', content: '')),
    );

    now = now.add(const Duration(hours: 2));
    final updated = added(
      await notes.updateNote(
        note.id,
        const NoteDraft(title: 'B', content: 'more'),
      ),
    );

    expect(updated.title, 'B');
    expect(updated.createdAt, note.createdAt);
    expect(updated.updatedAt, now.toUtc());
    expect(await notes.findNote(note.id), updated);
  });

  test(
    'deleting hands the note back; restoring puts back the same note',
    () async {
      final note = added(
        await stack.notes.addNote(const NoteDraft(title: 'A', content: 'x')),
      );

      final deleted = added(await stack.notes.deleteNote(note.id));
      expect(await stack.notes.findNote(note.id), isNull);

      expect(await stack.notes.restoreNote(deleted), isA<Ok<void>>());
      expect(await stack.notes.findNote(note.id), note);
    },
  );

  test('removing the topic writes the null (not "unchanged")', () async {
    final note = added(
      await stack.notes.addNote(
        const NoteDraft(title: 'A', content: '', topicId: 'flutter-streams'),
      ),
    );

    await stack.notes.updateNote(
      note.id,
      const NoteDraft(title: 'A', content: ''),
    );

    expect((await stack.notes.findNote(note.id))?.topicId, isNull);
  });

  test('a missing note: not found', () async {
    final update = await stack.notes.updateNote(
      'nope',
      const NoteDraft(title: 'A', content: ''),
    );
    final delete = await stack.notes.deleteNote('nope');

    expect((update as Err).exception, isA<NotFoundException>());
    expect((delete as Err).exception, isA<NotFoundException>());
  });
}
