import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/data/mapper/catalog_mappers.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart' show SqliteException;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/catalog_fixtures.dart';
import '../../helpers/database.dart';

void main() {
  late AppDatabase db;

  setUp(() async {
    db = newTestDatabase();
    await db.catalogDao.upsertCatalog(catalogDto().toRows());
  });
  tearDown(() => db.close());

  final day = CalendarDate(2026, 10, 14);
  final at = DateTime.utc(2026, 10, 14, 12);

  UserRows rows({String topicId = 'vars'}) => UserRows(
    progress: [
      TopicProgressCompanion.insert(
        topicId: topicId,
        completedOn: day,
        completedAt: at,
      ),
    ],
    goals: [
      GoalsCompanion.insert(
        id: 'g',
        title: 'Read',
        kind: GoalKind.custom,
        period: GoalPeriod.daily,
        target: 1,
        createdOn: day,
        createdAt: at,
      ),
    ],
    checkIns: [
      GoalCheckInsCompanion.insert(goalId: 'g', day: day, createdAt: at),
    ],
  );

  test('replaceAll writes every table, and running it twice gives the same '
      'result', () async {
    await db.userDataDao.replaceAll(rows());
    await db.userDataDao.replaceAll(rows());

    expect(await db.select(db.topicProgress).get(), hasLength(1));
    expect(await db.select(db.goals).get(), hasLength(1));
    expect(await db.select(db.goalCheckIns).get(), hasLength(1));
  });

  test('a broken row rolls everything back', () async {
    await db.userDataDao.replaceAll(rows());

    // A completion of a topic that doesn't exist breaks the foreign key.
    await expectLater(
      db.userDataDao.replaceAll(rows(topicId: 'nope')),
      throwsA(isA<SqliteException>()),
    );

    final progress = await db.select(db.topicProgress).get();
    expect(progress.single.topicId, 'vars');
  });

  test('goal targets must be 1–50', () async {
    await expectLater(
      db
          .into(db.goals)
          .insert(
            GoalsCompanion.insert(
              id: 'x',
              title: 'X',
              kind: GoalKind.topics,
              period: GoalPeriod.weekly,
              target: 0,
              createdOn: day,
              createdAt: at,
            ),
          ),
      throwsA(isA<SqliteException>()),
    );
  });

  test('a note keeps its text when its topic goes (SET NULL)', () async {
    await db
        .into(db.notes)
        .insert(
          NotesCompanion.insert(
            id: 'n',
            topicId: const Value('vars'),
            title: 'T',
            content: 'C',
            createdAt: at,
            updatedAt: at,
          ),
        );

    await (db.delete(db.topics)..where((t) => t.id.equals('vars'))).go();

    final note = await db.select(db.notes).getSingle();
    expect((note.title, note.topicId), ('T', null));
  });
}
