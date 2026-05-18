import 'package:flutter/widgets.dart' show Size;
import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../chat/domain/repositories/i_chat_repository.dart';
import '../../user/domain/repositories/i_user_read_repository.dart';
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
import '../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

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
      authRepository: getIt<IAuthRepository>(),
      matchesRepository: getIt<IMatchesRepository>(),
    ),
  );

  getIt.registerLazySingleton<LookForMatchesUseCase>(
    () => LookForMatchesUseCase(
      authRepository: getIt<IAuthRepository>(),
      getExcludedMatchesUseCase: getIt<GetExcludedMatchesUseCase>(),
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetAUserMatchIncomeUseCase>(
    () => GetAUserMatchIncomeUseCase(
      userMatchingInRepository: getIt<IMatchesRepository>(),
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerLazySingleton<ListenTwoWayMatchUseCase>(
    () => ListenTwoWayMatchUseCase(
      userMatchingInRepository: getIt<IMatchesRepository>(),
      authRepository: getIt<IAuthRepository>(),
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetMatchByIdUseCase>(
    () => GetMatchByIdUseCase(
      matchesRepository: getIt<IMatchesRepository>(),
      authRepository: getIt<IAuthRepository>(),
      userReadRepository: getIt<IUserReadRepository>(),
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
  getIt.registerFactory<TinderCardCubit>(
    () => TinderCardCubit(
      size: const Size(300.0, 590.0),
    ),
  );
}
