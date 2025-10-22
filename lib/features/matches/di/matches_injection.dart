import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/user_matching_firebase_repository.dart';
import '../domain/repositories/i_user_matching_repository.dart';
import '../domain/usecases/create_user_matches_use_case.dart';
import '../domain/usecases/get_user_matches_use_case.dart';

void initMatchingFeature(GetIt getIt) {
  getIt.registerLazySingleton<IUserMatchingRepository>(
    () => UserMatchingFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<CreateUserMatchesUseCase>(
    () => CreateUserMatchesUseCase(
      userMatchingRepository: getIt<IUserMatchingRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUserMatchesUseCase>(
    () => GetUserMatchesUseCase(
      userMatchingRepository: getIt<IUserMatchingRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
