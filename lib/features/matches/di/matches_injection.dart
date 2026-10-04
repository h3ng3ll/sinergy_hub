import 'package:flutter/widgets.dart' show Size;
import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../../core/services/logger_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../chat/domain/repositories/i_chat_repository.dart';
import '../../user/data/services/user_service.dart';
import '../../user/domain/repositories/i_user_read_repository.dart';
import '../data/repositories/candidate_distance_functions_repository.dart';
import '../data/repositories/liked_you_meta_firestore_repository.dart';
import '../data/repositories/nearby_candidates_functions_repository.dart';
import '../domain/repositories/i_candidate_distance_repository.dart';
import '../domain/repositories/i_liked_you_meta_repository.dart';
import '../domain/repositories/i_nearby_candidates_repository.dart';
import '../../subscription/domain/repositories/i_premium_status_repository.dart';
import '../../../core/databases/hive_database.dart';
import '../data/repositories/liked_you_hive_repository.dart';
import '../domain/repositories/i_liked_you_local_repository.dart';
import '../domain/usecases/sync_liked_you_use_case.dart';
import '../domain/usecases/watch_liked_you_use_case.dart';
import '../data/repositories/liked_you_functions_repository.dart';
import '../data/repositories/user_matches_firebase_repository.dart';
import '../domain/repositories/i_liked_you_repository.dart';
import '../domain/repositories/i_matches_repository.dart';
import '../domain/usecases/create_user_matches_use_case.dart';
import '../domain/usecases/find_match_chat_id_use_case.dart';
import '../domain/usecases/get_a_user_match_income_use_case.dart';
import '../domain/usecases/get_excluded_matches_use_case.dart';
import '../domain/usecases/get_liked_you_use_case.dart';
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

  getIt.registerLazySingleton<ICandidateDistanceRepository>(
    () => CandidateDistanceFunctionsRepository(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
      loggerService: getIt<LoggerService>(),
    ),
  );
  getIt.registerLazySingleton<INearbyCandidatesRepository>(
    () => NearbyCandidatesFunctionsRepository(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
    ),
  );

  getIt.registerLazySingleton<LookForMatchesUseCase>(
    () => LookForMatchesUseCase(
      authRepository: getIt<IAuthRepository>(),
      getExcludedMatchesUseCase: getIt<GetExcludedMatchesUseCase>(),
      userReadRepository: getIt<IUserReadRepository>(),
      candidateDistanceRepository: getIt<ICandidateDistanceRepository>(),
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
      userService: getIt<UserService>(),
    ),
  );
  getIt.registerFactory<TinderCardCubit>(
    () => TinderCardCubit(
      size: const Size(300.0, 590.0),
    ),
  );

  getIt.registerLazySingleton<ILikedYouRepository>(
    () => LikedYouFunctionsRepository(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
      loggerService: getIt<LoggerService>(),
    ),
  );
  getIt.registerLazySingleton<GetLikedYouUseCase>(
    () => GetLikedYouUseCase(
      likedYouRepository: getIt<ILikedYouRepository>(),
    ),
  );
  getIt.registerLazySingleton<ILikedYouMetaRepository>(
    () => LikedYouMetaFirestoreRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<ILikedYouLocalRepository>(
    () => LikedYouHiveRepository(
      hiveDatabase: getIt<HiveDatabase>(),
    ),
  );
  getIt.registerLazySingleton<SyncLikedYouUseCase>(
    () => SyncLikedYouUseCase(
      likedYouRepository: getIt<ILikedYouRepository>(),
      localRepository: getIt<ILikedYouLocalRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<WatchLikedYouUseCase>(
    () => WatchLikedYouUseCase(
      localRepository: getIt<ILikedYouLocalRepository>(),
      premiumStatusRepository: getIt<IPremiumStatusRepository>(),
      likedYouMetaRepository: getIt<ILikedYouMetaRepository>(),
      syncLikedYouUseCase: getIt<SyncLikedYouUseCase>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
}
