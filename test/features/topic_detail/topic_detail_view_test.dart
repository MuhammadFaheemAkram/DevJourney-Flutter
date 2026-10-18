import 'package:bloc_test/bloc_test.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_cubit.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_state.dart';
import 'package:dev_journey/features/topic_detail/topic_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/path_fixtures.dart';
import '../../helpers/pump_app.dart';

class _MockCubit extends MockCubit<TopicDetailState>
    implements TopicDetailCubit {}

void main() {
  late _MockCubit cubit;
  final today = CalendarDate(2026, 10, 14);

  setUp(() {
    cubit = _MockCubit();
    when(() => cubit.toggleCompleted()).thenAnswer((_) async {});
    when(() => cubit.toggleBookmark()).thenAnswer((_) async {});
  });

  TopicDetailState found(TopicItem item) => TopicDetailState(
    now: today.toDateTime(),
    status: TopicDetailStatus.found,
    details: TopicDetails(
      item: item,
      roadmap: sampleRoadmap,
      section: const RoadmapSection(
        id: 'basics',
        roadmapId: 'dart',
        title: 'Basics',
      ),
    ),
  );

  Future<void> pump(WidgetTester tester, TopicDetailState state) {
    when(() => cubit.state).thenReturn(state);
    tester.usePhoneSurface();
    return tester.pumpThemed(
      BlocProvider<TopicDetailCubit>.value(
        value: cubit,
        child: const TopicDetailView(),
      ),
    );
  }

  testWidgets('where it sits, what it is, what it teaches', (tester) async {
    await pump(tester, found(topicItem('streams', minutes: 45)));

    expect(find.text('Dart › Basics'), findsOneWidget);
    expect(find.text('Topic streams'), findsOneWidget);
    expect(find.text('45 min'), findsOneWidget);
    expect(find.text('About streams'), findsOneWidget);
    expect(find.text("What you'll learn"), findsOneWidget);
    expect(find.text('Learn it'), findsOneWidget);
  });

  testWidgets('not done: Mark complete', (tester) async {
    await pump(tester, found(topicItem('streams')));

    await tester.tap(find.text('Mark complete'));

    verify(() => cubit.toggleCompleted()).called(1);
  });

  testWidgets('done: says when, and the same button undoes it', (tester) async {
    await pump(
      tester,
      found(topicItem('streams', completedOn: today.addDays(-1))),
    );

    expect(find.text('Completed yesterday'), findsOneWidget);
    await tester.tap(find.text('Completed · tap to undo'));
    verify(() => cubit.toggleCompleted()).called(1);
  });

  testWidgets('the bookmark button follows the state', (tester) async {
    await pump(tester, found(topicItem('streams', bookmarked: true)));

    await tester.tap(find.byTooltip('Remove bookmark'));

    verify(() => cubit.toggleBookmark()).called(1);
  });

  testWidgets('a topic that is gone says so', (tester) async {
    await pump(
      tester,
      TopicDetailState(
        now: today.toDateTime(),
        status: TopicDetailStatus.notFound,
      ),
    );

    expect(find.text('This topic no longer exists'), findsOneWidget);
  });
}
