/// Opens a web page in the in-app browser (Custom Tabs on Android,
/// SFSafariViewController on iOS). An interface, so tests can record what
/// would have opened instead of launching a browser.
abstract interface class LinkOpener {
  /// `false` if the system couldn't open it.
  Future<bool> open(Uri url);
}
