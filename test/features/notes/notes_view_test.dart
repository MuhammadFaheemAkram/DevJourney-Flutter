import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/features/notes/cubit/notes_cubit.dart';
import 'package:dev_journey/features/notes/cubit/notes_state.dart';
import 'package:dev_journey/features/notes/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<NotesState> implements NotesCubit {}

void main() {
  late _MockCubit cubit;
  late StreamController<NotesState> states;
  final now = DateTime(2026, 10, 14, 15);

  NoteItem item(String id, String title) => NoteItem(
    note: Note(
      id: id,
      title: title,
      content: 'About $title',
      createdAt: now,
      updatedAt: now,
    ),
  );
  final streams = item('a', 'Streams');
  final keys = item('b', 'Keys');
  final ready = NotesState(
    now: now,
    status: NotesStatus.ready,
    notes: [streams, keys],
  );

  setUpAll(() {
    registerFallbackValue(streams);
    registerFallbackValue(streams.note);
  });

  setUp(() {
    cubit = _MockCubit();
    states = StreamController<NotesState>();
    addTearDown(states.close);
    when(() => cubit.search(any())).thenAnswer((_) async {});
    when(() => cubit.restore(any())).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, NotesState state) {
    whenListen(cubit, states.stream, initialState: state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<NotesCubit>.value(value: cubit, child: const NotesView()),
    );
  }

  testWidgets('the notes, and a search that reaches the Cubit', (tester) async {
    await pump(tester, ready);

    expect(find.text('Streams'), findsOneWidget);
    expect(find.text('About Keys'), findsOneWidget);
    expect(find.text('New note'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'str');
    verify(() => cubit.search('str')).called(1);
  });

  testWidgets('swipe to delete, then Undo', (tester) async {
    await pump(tester, ready);
    when(() => cubit.delete(any())).thenAnswer((_) async {
      // As the Cubit does: the row leaves at once, then Undo is offered.
      states.add(
        ready.copyWith(notes: [keys], deleted: streams.note, deletedSerial: 1),
      );
    });

    await tester.drag(find.text('Streams'), const Offset(-600, 0));
    await tester.pumpAndSettle();

    verify(() => cubit.delete(streams)).called(1);
    expect(find.text('Deleted “Streams”'), findsOneWidget);
    await tester.tap(find.text('Undo'));
    verify(() => cubit.restore(streams.note)).called(1);
  });

  testWidgets('no notes yet: a way to write one', (tester) async {
    await pump(tester, NotesState(now: now, status: NotesStatus.ready));

    expect(find.text('No notes yet'), findsOneWidget);
    expect(find.text('Write a note'), findsOneWidget);
  });

  testWidgets('a search with no match', (tester) async {
    await pump(
      tester,
      NotesState(now: now, status: NotesStatus.ready, query: 'zzz'),
    );

    expect(find.text('No notes match'), findsOneWidget);
  });
}
