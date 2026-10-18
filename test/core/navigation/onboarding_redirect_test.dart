import 'package:dev_journey/core/navigation/onboarding_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String? redirect({required bool onboarded, required String to}) =>
      onboardingRedirect(onboarded: onboarded, location: Uri.parse(to));

  group('before onboarding', () {
    test('every location goes to Welcome', () {
      expect(redirect(onboarded: false, to: '/dashboard'), welcomePath);
      expect(
        redirect(onboarded: false, to: '/topics/flutter-streams'),
        welcomePath,
      );
      expect(redirect(onboarded: false, to: '/notes/new'), welcomePath);
    });

    test('Welcome itself stays', () {
      expect(redirect(onboarded: false, to: '/welcome'), isNull);
    });
  });

  group('after onboarding', () {
    test('Welcome goes to the Dashboard', () {
      expect(redirect(onboarded: true, to: '/welcome'), dashboardPath);
    });

    test('everything else stays where it is, query included', () {
      expect(redirect(onboarded: true, to: '/roadmaps'), isNull);
      expect(redirect(onboarded: true, to: '/search?q=dart'), isNull);
    });
  });
}
