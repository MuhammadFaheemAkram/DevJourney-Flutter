import 'package:dev_journey/domain/model/app_info.dart';
import 'package:dev_journey/features/about/about_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('the version and the other editions', (tester) async {
    tester.usePhoneSurface();
    await tester.pumpThemed(
      const AboutPage(
        appInfo: AppInfo(
          name: 'DevJourney',
          version: '1.0.0',
          buildNumber: '7',
        ),
      ),
    );

    expect(find.text('Version 1.0.0 (7)'), findsOneWidget);
    expect(find.text('Android'), findsOneWidget);
    expect(find.text('iOS'), findsOneWidget);
    expect(find.text('Flutter (this app)'), findsOneWidget);
    expect(find.text('Open-source licenses'), findsOneWidget);
  });
}
