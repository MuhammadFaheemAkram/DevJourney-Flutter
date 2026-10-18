import 'package:drift/drift.dart' show Table, TableInfo;
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DataStack stack;

  setUp(() async {
    stack = DataStack();
    await stack.loadDemo();
  });
  tearDown(() => stack.close());

  Future<int> count(TableInfo<Table, Object?> table) async =>
      (await stack.db.select(table).get()).length;

  test('reset clears what was done, keeps what was written', () async {
    final db = stack.db;
    final notes = await count(db.notes);
    final goals = await count(db.goals);
    expect(await count(db.topicProgress), greaterThan(0));
    expect(await count(db.goalCheckIns), greaterThan(0));
    expect(await count(db.challengeStates), greaterThan(0));

    await db.userDataDao.resetProgress();

    for (final table in <TableInfo<Table, Object?>>[
      db.topicProgress,
      db.topicBookmarks,
      db.resourceBookmarks,
      db.goalCheckIns,
      db.challengeStates,
    ]) {
      expect(await count(table), 0, reason: table.actualTableName);
    }
    expect(await count(db.notes), notes);
    expect(await count(db.goals), goals);
    expect(await count(db.topics), 32, reason: 'the catalog stays');
  });
}
