import 'package:injectable/injectable.dart';
import 'package:material_ui/material_ui.dart';

/// TEMPORARY (Phase 1): whether the user has left the Welcome screen, kept in
/// memory so the onboarding redirect has something to follow.
///
/// Phase 2 replaces it with the saved "onboarded" setting, set once the
/// catalog is in the database and a roadmap is chosen. A `ChangeNotifier` is
/// a `Listenable`, so the router can re-run its redirect when it changes.
@lazySingleton
class PlaceholderOnboarding extends ChangeNotifier {
  bool _onboarded = false;

  bool get onboarded => _onboarded;

  void complete() {
    if (_onboarded) return;
    _onboarded = true;
    notifyListeners();
  }
}
