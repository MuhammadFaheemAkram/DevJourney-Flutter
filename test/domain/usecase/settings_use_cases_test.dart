import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/reminder_time.dart';
import 'package:dev_journey/domain/model/roadmap_progress.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;

  setUp(() => stack = DataStack());
  tearDown(() => stack.close());

  const seven = ReminderTime(hour: 7, minute: 0);

  group('the daily reminder', () {
    test('on: asks, then schedules at the saved time', () async {
      await stack.settings.setReminderTime(seven);

      expect(await stack.setReminderEnabled(enabled: true), isA<Ok<void>>());

      expect(stack.reminders.calls, ['request', 'schedule 07:00']);
      expect(stack.settings.current.reminderEnabled, isTrue);
    });

    test('denied: stays off, and says why', () async {
      stack.reminders.granted = false;

      final result = await stack.setReminderEnabled(enabled: true);

      expect((result as Err).exception, isA<NotificationsDeniedException>());
      expect(stack.reminders.scheduled, isNull);
      expect(stack.settings.current.reminderEnabled, isFalse);
    });

    test('off: cancels', () async {
      await stack.setReminderEnabled(enabled: true);

      await stack.setReminderEnabled(enabled: false);

      expect(stack.reminders.calls.last, 'cancel');
      expect(stack.reminders.scheduled, isNull);
      expect(stack.settings.current.reminderEnabled, isFalse);
    });

    test(
      'a new time moves a reminder that is on; one that is off only saves it',
      () async {
        await stack.changeReminderTime(seven);
        expect(stack.reminders.calls, isEmpty);
        expect(stack.settings.current.reminderTime, seven);

        await stack.setReminderEnabled(enabled: true);
        await stack.changeReminderTime(
          const ReminderTime(hour: 21, minute: 15),
        );
        expect(
          stack.reminders.scheduled,
          const ReminderTime(hour: 21, minute: 15),
        );
      },
    );

    test('at launch: rescheduled in the current zone while allowed', () async {
      await stack.setReminderEnabled(enabled: true);
      stack.reminders.calls.clear();

      await stack.refreshReminder();

      expect(stack.reminders.calls, ['schedule 19:00']);
    });

    test(
      'at launch: permission revoked in system settings turns it off',
      () async {
        await stack.setReminderEnabled(enabled: true);
        stack.reminders.allowed = false;

        await stack.refreshReminder();

        expect(stack.settings.current.reminderEnabled, isFalse);
      },
    );

    test('at launch: nothing to do while off', () async {
      await stack.refreshReminder();

      expect(stack.reminders.calls, isEmpty);
    });
  });

  test(
    'reset progress: the Dashboard starts over, notes and goals stay',
    () async {
      await stack.loadDemo();

      expect(await stack.resetProgress(), isA<Ok<void>>());

      final summary = await stack.watchDashboard().first;
      expect(summary.streak.current, 0);
      expect((summary.topicsCompleted, summary.challengesCompleted), (0, 0));
      expect(summary.recentNotes, hasLength(3));
      expect(summary.goals, hasLength(4));
      expect(summary.goals.every((goal) => goal.current == 0), isTrue);
    },
  );

  test(
    'a published catalog update: the next sync brings it, progress stays',
    () async {
      await stack.loadDemo();
      stack.developerTools.publishesCatalogUpdate = true;

      final result = await stack.syncCatalog();

      final synced = (result as Ok<SyncResult>).value;
      expect(
        (synced.version, synced.newTopics, synced.newResources),
        (2, 3, 3),
      );
      expect(stack.settings.current.catalogVersion, 2);
      final flutter = (await stack.watchRoadmaps().first).firstWhere(
        (r) => r.roadmap.id == 'flutter',
      );
      expect((flutter.completedTopics, flutter.totalTopics), (7, 13));
    },
  );

  test('simulated network failure: sync says so', () async {
    stack.developerTools.simulatesNetworkFailure = true;

    final result = await stack.syncCatalog();

    expect((result as Err).exception, isA<NetworkException>());
  });

  test("the demo's analytics, worked out by hand", () async {
    await stack.loadDemo();

    final a = await stack.watchAnalytics().first;

    expect((a.streak.current, a.streak.longest), (6, 6));
    expect(
      (a.topicsCompleted, a.totalTopics, a.challengesCompleted),
      (10, 32, 1),
    );
    expect([for (final w in a.weekly) w.count], [0, 0, 0, 0, 2, 1, 5, 2]);
    expect([for (final m in a.monthly) m.count], [0, 0, 0, 0, 2, 8]);
    // Weekly topics 1/2, monthly topics 0/1, weekly challenge 1/2, daily
    // reading 4/14 (it was created 14 days ago).
    expect((a.goals.met, a.goals.total), (6, 19));
    expect(a.activity.length, 10);
    expect(a.activity.values.fold(0, (sum, n) => sum + n), 15);
    expect(a.roadmaps, hasLength(4));
  });
}
