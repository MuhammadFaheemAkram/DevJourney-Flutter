import 'package:dev_journey/domain/service/link_opener.dart';

/// Records the links that would have opened, instead of launching a
/// browser; [succeeds] decides what the platform answers.
class RecordingLinkOpener implements LinkOpener {
  final opened = <Uri>[];
  bool succeeds = true;

  @override
  Future<bool> open(Uri url) async {
    opened.add(url);
    return succeeds;
  }
}
