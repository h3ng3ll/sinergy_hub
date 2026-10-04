import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../features/auth/data/models/auth_temp_credentials/auth_temp_credentials.dart';
import '../databases/hive_database.dart';
import '../di/injection.dart';
import 'enum_adapters.dart';
import 'hive_registrar.g.dart';

/// Box that caches the credentials captured during Apple authorization.
const String authTempCredentialsBoxName = 'auth_temp_credentials';

/// Initializes Hive, registers the generated adapters and opens the app boxes,
/// then registers them in [getIt]. Must run before [initDependencies] so that
/// feature repositories can resolve their boxes.
Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  Hive.registerAdapter(EImageStateAdapter());
  Hive.registerAdapter(ESpecializationAdapter());
  Hive.registerAdapter(EExperienceAdapter());
  Hive.registerAdapter(ELikedYouQuotaPeriodAdapter());

  final authTempCredentialsBox = await Hive.openBox<AuthTempCredentials>(
    authTempCredentialsBoxName,
  );

  getIt.registerSingleton<Box<AuthTempCredentials>>(
    authTempCredentialsBox,
  );

  getIt.registerLazySingleton<HiveDatabase>(
    HiveDatabase.new,
  );
}
