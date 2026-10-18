import 'package:dev_journey/core/database/daos/catalog_dao.dart';
import 'package:dev_journey/core/database/daos/user_data_dao.dart';
import 'package:dev_journey/core/network/learning_service.dart';
import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/domain/repository/catalog_repository.dart';
import 'package:dev_journey/domain/repository/roadmap_repository.dart';
import 'package:dev_journey/domain/repository/settings_repository.dart';
import 'package:dev_journey/features/welcome/cubit/welcome_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_dependencies.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(getIt.reset);

  // A smoke test of the real composition root (with the database in memory).
  // A dependency injectable can't resolve only fails when its type is first
  // resolved, at runtime; resolving the top of each graph here catches it in
  // CI. Every new Cubit, repository and service belongs here.
  test('the real container resolves every Cubit, repository and DAO', () async {
    await configureTestDependencies();

    expect(getIt<SettingsRepository>(), same(getIt<SettingsRepository>()));
    expect(getIt<LearningService>(), isNotNull);
    expect(getIt<CatalogDao>(), isNotNull);
    expect(getIt<UserDataDao>(), isNotNull);
    expect(getIt<CatalogRepository>(), isNotNull);
    expect(getIt<RoadmapRepository>(), isNotNull);
    await getIt<WelcomeCubit>().close();
  });
}
