import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/user_matching_in_firebase_repository.dart';
import '../data/repositories/user_matching_out_firebase_repository.dart';
import '../domain/repositories/i_user_matching_in_repository.dart';
import '../domain/repositories/i_user_matching_out_repository.dart';
import '../domain/usecases/create_user_matches_use_case.dart';
import '../domain/usecases/get_user_matches_use_case.dart';

void initMatchingFeature(GetIt getIt) {
  getIt.registerLazySingleton<IUserMatchingOutRepository>(
    () => UserMatchingOutFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
   getIt.registerLazySingleton<IUserMatchingInRepository>(
    () => UserMatchingInFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<CreateUserMatchesUseCase>(
    () => CreateUserMatchesUseCase(
      userMatchingOutRepository: getIt<IUserMatchingOutRepository>(),
      userMatchingInRepository: getIt<IUserMatchingInRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUserMatchesUseCase>(
    () => GetUserMatchesUseCase(
      userMatchingInRepository: getIt<IUserMatchingInRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
