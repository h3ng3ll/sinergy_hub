import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/auth_repository/firebase_auth_repository.dart';
import '../domain/repostories/i_auth_repository.dart';
import '../domain/use_cases/register_use_case.dart';

void initAuthFeature(GetIt getIt) {
  getIt.registerLazySingleton<IAuthRepository>(
    () => FirebaseAuthRepository(
      auth: getIt<FirebaseAuth>(),
      googleSignIn: GoogleSignIn.instance,
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerFactory(
    () => RegisterUseCase(
      authRepository: getIt<IAuthRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
