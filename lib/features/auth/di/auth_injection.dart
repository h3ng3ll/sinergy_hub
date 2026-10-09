import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/services/crypto_service.dart';
import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../../core/services/firebase/firebase_realtime_db_service.dart';
import '../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../core/services/logger_service.dart';
import '../../../core/utils/env/env.dart';
import '../../chat/data/services/presence_service.dart';
import '../../chat/domain/services/i_presence_service.dart';
import '../data/models/auth_temp_credentials/auth_temp_credentials.dart';
import '../data/repositories/auth_repository/firebase_auth_repository.dart';
import '../data/repositories/auth_temp_credentials_local_repository.dart';
import '../domain/repostories/i_auth_repository.dart';
import '../domain/repostories/i_auth_temp_credentials_repository.dart';
import '../domain/use_cases/apple_sign_in_use_case.dart';
import '../domain/use_cases/authorization_use_case.dart';
import '../domain/use_cases/complete_registration_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/logout_use_case.dart';
import '../domain/use_cases/register_use_case.dart';
import '../domain/use_cases/reset_password_by_email_use_case.dart';
import '../domain/use_cases/send_email_verification_use_case.dart';
import '../domain/use_cases/sign_in_with_google_use_case.dart';
import '../presentation/bloc/auth_bloc/auth_bloc.dart';
import '../presentation/pages/login_page/bloc/login_bloc/login_bloc.dart';
import '../presentation/pages/reset_password_page/bloc/reset_password_page/reset_password_page_bloc.dart';

void initAuthFeature(GetIt getIt) {
  getIt.registerLazySingleton<IPresenceService>(
    () => PresenceService(
      firebaseRealtimeDbService: getIt<FirebaseRealtimeDbService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerLazySingleton<IAuthTempCredentialsRepository>(
    () => AuthTempCredentialsLocalRepository(
      box: getIt<Box<AuthTempCredentials>>(),
    ),
  );

  getIt.registerLazySingleton<IAuthRepository>(
    () => FirebaseAuthRepository(
      auth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
      googleSignInService: getIt<GoogleSignInService>(),
      env: getIt<Env>(),
      cryptoService: getIt<CryptoService>(),
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
      loggerService: getIt<LoggerService>(),
    ),
  );

  getIt.registerFactory(
    () => AuthorizationUseCase(
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => LogoutUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => RegisterUseCase(
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerFactory(
    () => CompleteRegistrationUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => LoginUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => ResetPasswordByEmailUseCase(
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerFactory(
    () => SignInWithGoogleUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => SendEmailVerificationUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerLazySingleton(
    () => AppleSignInUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
      authTempCredentialsRepository: getIt<IAuthTempCredentialsRepository>(),
    ),
  );

  /// Bloc

  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<IAuthRepository>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
      appleSignInUseCase: getIt<AppleSignInUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
    ),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt<LoginUseCase>(),
      completeRegistrationUseCase: getIt<CompleteRegistrationUseCase>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
    ),
  );

  getIt.registerFactory<ResetPasswordPageBloc>(
    () => ResetPasswordPageBloc(
      resetPasswordByEmailUseCase: getIt<ResetPasswordByEmailUseCase>(),
    ),
  );
}
