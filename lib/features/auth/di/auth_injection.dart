import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_realtime_db_service.dart';
import '../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../chat/data/services/presence_service.dart';
import '../../chat/domain/services/i_presence_service.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/auth_repository/firebase_auth_repository.dart';
import '../domain/repostories/i_auth_repository.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/register_use_case.dart';
import '../domain/use_cases/sign_in_with_google_use_case.dart';

void initAuthFeature(GetIt getIt) {
  getIt.registerLazySingleton<IPresenceService>(
    () => PresenceService(
      firebaseRealtimeDbService: getIt<FirebaseRealtimeDbService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerLazySingleton<IAuthRepository>(
    () => FirebaseAuthRepository(
      auth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
      googleSignInService: getIt<GoogleSignInService>(),
    ),
  );

  getIt.registerFactory(
    () => RegisterUseCase(
      authRepository: getIt<IAuthRepository>(),
      userRepository: getIt<IUserRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => LoginUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => SignInWithGoogleUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
}
