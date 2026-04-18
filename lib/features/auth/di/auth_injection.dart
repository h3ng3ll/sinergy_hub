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
import '../domain/use_cases/reload_use_case.dart';
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
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => LoginUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
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
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => SendEmailVerificationUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory(
    () => ReloadUseCase(
      authRepository: getIt<IAuthRepository>(),
    ),
  );

  /// Bloc

  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<IAuthRepository>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
    ),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt<LoginUseCase>(),
      reloadUseCase: getIt<ReloadUseCase>(),
    ),
  );

  getIt.registerFactory<ResetPasswordPageBloc>(
    () => ResetPasswordPageBloc(
      resetPasswordByEmailUseCase: getIt<ResetPasswordByEmailUseCase>(),
    ),
  );
}
