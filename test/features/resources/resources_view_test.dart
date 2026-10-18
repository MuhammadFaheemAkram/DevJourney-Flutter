import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:dev_journey/features/resources/cubit/resources_cubit.dart';
import 'package:dev_journey/features/resources/cubit/resources_state.dart';
import 'package:dev_journey/features/resources/resources_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<ResourcesState> implements ResourcesCubit {}

void main() {
  late _MockCubit cubit;

  final docs = ResourceItem(
    resource: Resource(
      id: 'r',
      title: 'Sound null safety',
      type: ResourceType.documentation,
      url: Uri.parse('https://dart.dev/null-safety'),
      source: 'dart.dev',
      estimatedMinutes: 30,
    ),
  );
  final ready = ResourcesState(
    status: ResourcesStatus.ready,
    resources: [docs],
  );

  setUpAll(() {
    registerFallbackValue(docs);
    registerFallbackValue(ResourceType.video);
  });

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.open(any())).thenAnswer((_) async {});
    when(() => cubit.toggleBookmark(any())).thenAnswer((_) async {});
  });

  Future<void> pump(WidgetTester tester, ResourcesState state) {
    whenListen(
      cubit,
      const Stream<ResourcesState>.empty(),
      initialState: state,
    );
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<ResourcesCubit>.value(
        value: cubit,
        child: const ResourcesView(),
      ),
    );
  }

  testWidgets('search, filters, open and save reach the Cubit', (tester) async {
    await pump(tester, ready);

    await tester.enterText(find.byType(TextField), 'null');
    verify(() => cubit.search('null')).called(1);
    await tester.tap(find.text('Video'));
    verify(() => cubit.filterByType(ResourceType.video)).called(1);
    await tester.tap(find.text('Saved only'));
    verify(() => cubit.showSavedOnly(savedOnly: true)).called(1);
    await tester.tap(find.text('Sound null safety'));
    verify(() => cubit.open(docs)).called(1);
    await tester.tap(find.byTooltip('Save'));
    verify(() => cubit.toggleBookmark(docs)).called(1);
  });

  testWidgets('Saved, with nothing saved', (tester) async {
    await pump(tester, ready.copyWith(savedOnly: true));

    expect(find.text('Nothing saved yet'), findsOneWidget);
  });

  testWidgets('no match', (tester) async {
    await pump(tester, ready.copyWith(query: 'zzz'));

    expect(find.text('No resources match'), findsOneWidget);
  });
}
