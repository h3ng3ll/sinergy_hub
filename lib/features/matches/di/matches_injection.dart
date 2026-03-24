import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../chat/domain/repositories/i_chat_repository.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/user_matches_firebase_repository.dart';
import '../domain/repositories/i_matches_repository.dart';
import '../domain/usecases/create_user_matches_use_case.dart';
import '../domain/usecases/find_match_chat_id_use_case.dart';
import '../domain/usecases/get_a_user_match_income_use_case.dart';
import '../domain/usecases/get_excluded_matches_use_case.dart';
import '../domain/usecases/get_match_by_id_use_case.dart';
import '../domain/usecases/look_for_matches_use_case.dart';
import '../domain/usecases/listen_two_way_match_use_case.dart';
import '../domain/usecases/mark_as_notified_match_use_case.dart';

void initMatchingFeature(GetIt getIt) {
  getIt.registerLazySingleton<IMatchesRepository>(
    () => MatchesFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<CreateUserMatchesUseCase>(
    () => CreateUserMatchesUseCase(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
    ),
  );

  getIt.registerLazySingleton<GetExcludedMatchesUseCase>(
    () => GetExcludedMatchesUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
      matchesRepository: getIt<IMatchesRepository>(),
    ),
  );

  getIt.registerLazySingleton<LookForMatchesUseCase>(
    () => LookForMatchesUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
      getExcludedMatchesUseCase: getIt<GetExcludedMatchesUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetAUserMatchIncomeUseCase>(
    () => GetAUserMatchIncomeUseCase(
      userRepository: getIt<IUserRepository>(),
      userMatchingInRepository: getIt<IMatchesRepository>(),
    ),
  );
  getIt.registerLazySingleton<ListenTwoWayMatchUseCase>(
    () => ListenTwoWayMatchUseCase(
      userMatchingInRepository: getIt<IMatchesRepository>(),
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetMatchByIdUseCase>(
    () => GetMatchByIdUseCase(
      userRepository: getIt<IUserRepository>(),
      matchesRepository: getIt<IMatchesRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<MarkAsNotifiedMatchUseCase>(
    () => MarkAsNotifiedMatchUseCase(
      matchesRepository: getIt<IMatchesRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<FindMatchChatIdUseCase>(
    () => FindMatchChatIdUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
    ),
  );
}
