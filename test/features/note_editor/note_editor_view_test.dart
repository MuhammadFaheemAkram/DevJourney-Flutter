import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_cubit.dart';
import 'package:dev_journey/features/note_editor/cubit/note_editor_state.dart';
import 'package:dev_journey/features/note_editor/note_editor_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<NoteEditorState>
    implements NoteEditorCubit {}

void main() {
  late _MockCubit cubit;

  const draft = NoteDraft(
    title: 'Streams',
    content: '# Heading\n\nSome **bold** text',
    topicId: 'streams',
  );
  const editing = NoteEditorState(
    status: NoteEditorStatus.editing,
    original: draft,
    draft: draft,
    topics: [
      TopicChoice(id: 'streams', title: 'Streams', roadmapTitle: 'Flutter'),
    ],
  );

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.isNew).thenReturn(false);
    when(() => cubit.save()).thenAnswer((_) async {});
    when(() => cubit.delete()).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, NoteEditorState state) {
    whenListen(
      cubit,
      const Stream<NoteEditorState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<NoteEditorCubit>.value(
        value: cubit,
        child: const NoteEditorView(),
      ),
    );
  }

  testWidgets('editing: the fields, Save and Delete', (tester) async {
    await pump(tester, editing);

    expect(find.text('Edit note'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Streams'), findsOneWidget);
    expect(find.text('Streams · Flutter'), findsOneWidget);

    await tester.tap(find.text('Save'));
    verify(() => cubit.save()).called(1);
    await tester.tap(find.byTooltip('Delete note'));
    verify(() => cubit.delete()).called(1);
  });

  testWidgets('typing reaches the Cubit', (tester) async {
    await pump(tester, editing);

    await tester.enterText(find.widgetWithText(TextField, 'Streams'), 'Sinks');

    verify(() => cubit.titleChanged('Sinks')).called(1);
  });

  testWidgets('Preview renders the Markdown', (tester) async {
    await pump(tester, editing);

    await tester.tap(find.text('Preview'));
    await tester.pumpAndSettle();

    expect(find.text('Heading'), findsOneWidget);
    expect(
      find.textContaining('Some bold text', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('the title error, after a first Save', (tester) async {
    await pump(
      tester,
      editing.copyWith(draft: draft.copyWith(title: ''), showErrors: true),
    );

    expect(find.text('Give the note a title'), findsOneWidget);
  });

  testWidgets('closing with edits asks first, and discards on Discard', (
    tester,
  ) async {
    await pump(tester, editing.copyWith(draft: draft.copyWith(title: 'Sinks')));

    await tester.tap(find.byType(CloseButton));
    await tester.pumpAndSettle();
    expect(find.text('Discard changes?'), findsOneWidget);

    await tester.tap(find.widgetWithText(TextButton, 'Discard'));
    await tester.pumpAndSettle();
    verify(() => cubit.discard()).called(1);
  });

  testWidgets('a new note: no Delete', (tester) async {
    when(() => cubit.isNew).thenReturn(true);
    await pump(tester, const NoteEditorState(status: NoteEditorStatus.editing));

    expect(find.text('New note'), findsOneWidget);
    expect(find.byTooltip('Delete note'), findsNothing);
  });
}
