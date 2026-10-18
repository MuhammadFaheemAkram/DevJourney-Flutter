import 'package:dev_journey/app/dev_journey_app.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:material_ui/material_ui.dart';

Future<void> main() async {
  // Bindings must exist before any async setup touches plugins or assets.
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const DevJourneyApp());
}
