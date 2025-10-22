import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../data/repositories/user_firebase_repository.dart';
import '../domain/repositories/i_user_repository.dart';

void initUserFeature(GetIt getIt) {
  getIt.registerLazySingleton<IUserRepository>(
    () => UserFirebaseRepository(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
}
