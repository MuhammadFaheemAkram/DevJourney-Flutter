import 'package:dev_journey/features/welcome/welcome_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('each choice reports itself', (tester) async {
    final chosen = <String>[];
    await tester.pumpThemed(
      WelcomeView(
        onStartLearning: () => chosen.add('learn'),
        onExploreDemo: () => chosen.add('demo'),
      ),
    );

    await tester.tap(find.text('Start learning'));
    await tester.tap(find.text('Explore with demo progress'));

    expect(chosen, ['learn', 'demo']);
  });
}
