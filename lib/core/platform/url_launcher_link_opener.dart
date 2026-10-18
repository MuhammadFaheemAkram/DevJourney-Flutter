import 'package:dev_journey/domain/service/link_opener.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens links with `url_launcher` in the in-app browser view: Custom Tabs
/// on Android, SFSafariViewController on iOS. The user stays in the app and
/// returns with Back or Done, and the page shares the system browser's
/// cookies.
@LazySingleton(as: LinkOpener)
class UrlLauncherLinkOpener implements LinkOpener {
  const UrlLauncherLinkOpener();

  @override
  Future<bool> open(Uri url) async {
    try {
      return await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } on Exception {
      return false;
    }
  }
}
