import 'package:clock/clock.dart';
import 'package:dev_journey/data/repository/challenges_repository_impl.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';
import '../../helpers/test_dependencies.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;
  late DateTime now;
  late ChallengesRepositoryImpl challenges;

  setUp(() async {
    stack = DataStack();
    await stack.syncCatalogNow();
    now = demoNow;
    challenges = ChallengesRepositoryImpl(
      stack.db.challengesDao,
      Clock(() => now),
    );
  });
  tearDown(() => stack.close());

  Future<ChallengeProgress> progress(String id) async =>
      (await challenges.watchChallenge(id).first)!.progress;

  test('untouched: to do, no notes', () async {
    final items = await challenges.watchChallenges().first;

    expect(items, hasLength(12));
    expect(items.first.challenge.id, 'ch-fizzbuzz-stream');
    expect(items.first.progress, const ChallengeProgress());
  });

  test('in progress records the start; done records the day', () async {
    await challenges.setStatus('ch-debounce', ChallengeStatus.inProgress);
    final started = await progress('ch-debounce');
    expect(started.startedAt, demoNow.toUtc());
    expect(started.completedOn, isNull);

    now = demoNow.add(const Duration(days: 1));
    await challenges.setStatus('ch-debounce', ChallengeStatus.done);
    final done = await progress('ch-debounce');
    expect(done.status, ChallengeStatus.done);
    expect(done.startedAt, demoNow.toUtc(), reason: 'the first start stays');
    expect(done.completedOn, CalendarDate(2026, 10, 15));
  });

  test('leaving Done clears its day; To do clears the start', () async {
    await challenges.setStatus('ch-debounce', ChallengeStatus.done);
    await challenges.setStatus('ch-debounce', ChallengeStatus.inProgress);
    expect((await progress('ch-debounce')).completedOn, isNull);

    await challenges.setStatus('ch-debounce', ChallengeStatus.todo);
    final todo = await progress('ch-debounce');
    expect((todo.status, todo.startedAt), (ChallengeStatus.todo, null));
  });

  test('notes are kept across status changes', () async {
    await challenges.saveSolutionNotes('ch-debounce', 'Use a Timer');
    expect((await progress('ch-debounce')).status, ChallengeStatus.todo);

    await challenges.setStatus('ch-debounce', ChallengeStatus.done);
    expect((await progress('ch-debounce')).solutionNotes, 'Use a Timer');
  });

  test('done counts towards the totals and the active days', () async {
    await challenges.setStatus('ch-debounce', ChallengeStatus.done);

    expect((await stack.progress.watchCompletedCounts().first).challenges, 1);
    expect(
      await stack.progress.watchActiveDays().first,
      contains(CalendarDate(2026, 10, 14)),
    );
  });

  test('recent: the last touched first', () async {
    await challenges.setStatus('ch-debounce', ChallengeStatus.inProgress);
    now = now.add(const Duration(minutes: 5));
    await challenges.saveSolutionNotes('ch-lru-cache', 'A linked map');
    now = now.add(const Duration(minutes: 5));
    await challenges.saveSolutionNotes('ch-debounce', 'Timers');

    final recent = await challenges.watchRecent(limit: 3).first;

    expect(
      [for (final item in recent) item.challenge.id],
      ['ch-debounce', 'ch-lru-cache'],
    );
  });
}
