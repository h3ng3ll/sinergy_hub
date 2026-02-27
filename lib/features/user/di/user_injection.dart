import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_storage_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../data/repositories/user_firebase_repository.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/usecases/update_user_usecase.dart';

void initUserFeature(GetIt getIt) {
  getIt.registerLazySingleton<IUserRepository>(
    () => UserFirebaseRepository(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
      firebaseStorageService: getIt<FirebaseStorageService>(),
    ),
  );
  getIt.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
}
