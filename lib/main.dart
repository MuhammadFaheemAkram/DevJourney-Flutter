import 'package:dev_journey/app/dev_journey_app.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  // Bindings must exist before any setup touches plugins or assets.
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const DevJourneyApp());
}
