import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  test('shade levels: none, then one to four or more', () {
    expect(
      [
        for (final n in [0, 1, 2, 3, 4, 9]) ActivityHeatmap.level(n),
      ],
      [0, 1, 2, 3, 4, 4],
    );
  });

  testWidgets('read as its summary; the legend is decoration', (tester) async {
    await tester.pumpThemed(
      ActivityHeatmap(
        start: CalendarDate(2026, 4, 20),
        today: CalendarDate(2026, 10, 14),
        activity: {CalendarDate(2026, 10, 13): 3},
        summary: 'Active on 1 day',
      ),
    );

    expect(find.bySemanticsLabel('Active on 1 day'), findsOneWidget);
    expect(find.bySemanticsLabel('Less'), findsNothing);
  });
}
