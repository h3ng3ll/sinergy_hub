import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/user_matching_in_firebase_repository.dart';
import '../data/repositories/user_matching_out_firebase_repository.dart';
import '../domain/repositories/i_user_matching_in_repository.dart';
import '../domain/repositories/i_user_matching_out_repository.dart';
import '../domain/usecases/create_user_matches_use_case.dart';
import '../domain/usecases/get_a_user_match_income_use_case.dart';
import '../domain/usecases/listen_user_matches_income_use_case.dart';
import '../domain/usecases/get_user_matches_outcome_use_case.dart';
import '../domain/usecases/look_for_matches_use_case.dart';

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

      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
    ),
  );
  getIt.registerLazySingleton<ListenUserMatchesIncomeUseCase>(
    () => ListenUserMatchesIncomeUseCase(
      userMatchingInRepository: getIt<IUserMatchingInRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUserMatchesOutcomeUseCase>(
    () => GetUserMatchesOutcomeUseCase(
      userMatchingOutRepository: getIt<IUserMatchingOutRepository>(),
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<LookForMatchesUseCase>(
    () => LookForMatchesUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
      matchingOutRepository: getIt<IUserMatchingOutRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetAUserMatchIncomeUseCase>(
    () => GetAUserMatchIncomeUseCase(
      userRepository: getIt<IUserRepository>(),
      userMatchingInRepository: getIt<IUserMatchingInRepository>(),
    ),
  );
}
