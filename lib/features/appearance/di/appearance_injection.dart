import 'package:get_it/get_it.dart';

import '../../../core/databases/hive_database.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../subscription/domain/usecases/watch_current_premium_status_use_case.dart';
import '../data/repositories/background_palette_firebase_repository.dart';
import '../data/repositories/background_palette_hive_repository.dart';
import '../domain/repositories/i_background_palette_local_repository.dart';
import '../domain/repositories/i_background_palette_repository.dart';
import '../domain/usecases/get_background_palette_use_case.dart';
import '../domain/usecases/save_background_palette_use_case.dart';
import '../presentation/bloc/background_palette_bloc/background_palette_bloc.dart';

void initAppearanceFeature(GetIt getIt) {
  getIt.registerLazySingleton<IBackgroundPaletteLocalRepository>(
    () => BackgroundPaletteHiveRepository(
      hiveDatabase: getIt<HiveDatabase>(),
    ),
  );
  getIt.registerLazySingleton<IBackgroundPaletteRepository>(
    () => BackgroundPaletteFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
    ),
  );
  getIt.registerLazySingleton<GetBackgroundPaletteUseCase>(
    () => GetBackgroundPaletteUseCase(
      localRepository: getIt<IBackgroundPaletteLocalRepository>(),
      remoteRepository: getIt<IBackgroundPaletteRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SaveBackgroundPaletteUseCase>(
    () => SaveBackgroundPaletteUseCase(
      localRepository: getIt<IBackgroundPaletteLocalRepository>(),
      remoteRepository: getIt<IBackgroundPaletteRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );

  /// Global, app-lifetime bloc — one instance read by every background.
  getIt.registerLazySingleton<BackgroundPaletteBloc>(
    () => BackgroundPaletteBloc(
      getBackgroundPaletteUseCase: getIt<GetBackgroundPaletteUseCase>(),
      saveBackgroundPaletteUseCase: getIt<SaveBackgroundPaletteUseCase>(),
      watchCurrentPremiumStatusUseCase:
          getIt<WatchCurrentPremiumStatusUseCase>(),
    ),
  );
}
