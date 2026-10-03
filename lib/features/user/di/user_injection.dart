import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_functions_service.dart';
import '../../../core/services/firebase/firebase_storage_service.dart';
import '../../../core/services/geolocation/i_geolocation_service.dart';
import '../../../core/services/image_service.dart';
import '../../../core/services/logger_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../home/presentation/edit_profile_page/bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import '../../home/presentation/tabs/profile_tab/bloc/profile_bloc/profile_bloc.dart';
import '../../matches/domain/repositories/i_nearby_candidates_repository.dart';
import '../../onboard_survey/domain/use_cases/get_completion_status_use_case.dart';
import '../../onboard_survey/domain/use_cases/get_skills_use_case.dart';
import '../data/repositories/fake_user_firebase_repository.dart';
import '../data/repositories/user_coordinates_functions_repository.dart';
import '../data/repositories/user_composite_repository.dart';
import '../data/repositories/user_firebase_repository.dart';
import '../data/services/app_mode_service.dart';
import '../data/services/user_service.dart';
import '../domain/repositories/i_user_auth_repository.dart';
import '../domain/repositories/i_user_coordinates_repository.dart';
import '../domain/repositories/i_user_read_repository.dart';
import '../domain/repositories/i_user_storage_repository.dart';
import '../domain/repositories/i_user_write_repository.dart';
import '../domain/services/i_app_mode_service.dart';
import '../domain/usecases/delete_account_use_case.dart';
import '../domain/usecases/detect_current_location_use_case.dart';
import '../domain/usecases/get_current_user_data_use_case.dart';
import '../domain/usecases/get_user_data_use_case.dart';
import '../domain/usecases/get_users_use_case.dart';
import '../domain/usecases/listen_current_user_data_use_case.dart';
import '../domain/usecases/listen_user_data_use_case.dart';
import '../domain/usecases/update_user_coordinates_use_case.dart';
import '../domain/usecases/update_user_profiler_use_case.dart';
import '../domain/usecases/update_user_usecase.dart';
import '../presentation/bloc/skills_bloc/skills_bloc.dart';
import '../presentation/bloc/user_bloc/user_bloc.dart';
import '../presentation/pages/edit_experience_page/bloc/edit_experience_bloc.dart';
import '../presentation/pages/edit_looking_for_page/bloc/edit_looking_for_bloc.dart';
import '../presentation/pages/edit_specialization_page/bloc/edit_specialization_bloc.dart';

void initUserFeature(GetIt getIt) {
  getIt.registerLazySingleton<IAppModeService>(
    () => AppModeService(
      getCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
    ),
  );

  /// Repositories

  getIt.registerLazySingleton<UserFirebaseRepository>(
    () => UserFirebaseRepository(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
      firebaseStorageService: getIt<FirebaseStorageService>(),
      nearbyCandidatesRepository: getIt<INearbyCandidatesRepository>(),
    ),
  );

  getIt.registerLazySingleton<FakeUserFirebaseRepository>(
    () => FakeUserFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerLazySingleton<IUserReadRepository>(
    () => UserReadCompositeRepository(
      real: getIt<UserFirebaseRepository>(),
      fake: getIt<FakeUserFirebaseRepository>(),
      modeService: getIt<IAppModeService>(),
    ),
  );

  getIt.registerLazySingleton<IUserWriteRepository>(
    () => getIt<UserFirebaseRepository>(),
  );

  getIt.registerLazySingleton<IUserStorageRepository>(
    () => getIt<UserFirebaseRepository>(),
  );

  getIt.registerLazySingleton<IUserAuthRepository>(
    () => getIt<UserFirebaseRepository>(),
  );

  getIt.registerLazySingleton<IUserCoordinatesRepository>(
    () => UserCoordinatesFunctionsRepository(
      firebaseFunctionsService: getIt<FirebaseFunctionsService>(),
      loggerService: getIt<LoggerService>(),
    ),
  );

  /// Use Cases
  getIt.registerLazySingleton<DetectCurrentLocationUseCase>(
    () => DetectCurrentLocationUseCase(
      geolocationService: getIt<IGeolocationService>(),
    ),
  );
  getIt.registerLazySingleton<UpdateUserCoordinatesUseCase>(
    () => UpdateUserCoordinatesUseCase(
      userCoordinatesRepository: getIt<IUserCoordinatesRepository>(),
    ),
  );
  getIt.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(
      userStorageRepository: getIt<IUserStorageRepository>(),
      userWriteRepository: getIt<IUserWriteRepository>(),
      authRepository: getIt<IAuthRepository>(),
      imageService: getIt<ImageService>(),
    ),
  );
  getIt.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(
      userReadRepository: getIt<IUserReadRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetCurrentUserDataUseCase>(
    () => GetCurrentUserDataUseCase(
      userReadRepository: getIt<IUserReadRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<UserService>(
    () => UserService(),
  );
  getIt.registerFactory<EditLookingForBloc>(
    () => EditLookingForBloc(
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerFactory<EditExperienceBloc>(
    () => EditExperienceBloc(
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
    ),
  );
  getIt.registerFactory<EditSpecializationBloc>(
    () => EditSpecializationBloc(
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
    ),
  );
  getIt.registerFactory<SkillsBloc>(
    () => SkillsBloc(
      getSkillsUseCase: getIt<GetSkillsUseCase>(),
    ),
  );
  getIt.registerFactory<ListenCurrentUserDataUseCase>(
    () => ListenCurrentUserDataUseCase(
      authRepository: getIt<IAuthRepository>(),
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerFactory<ListenUserDataUseCase>(
    () => ListenUserDataUseCase(
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );

  /// Bloc
  getIt.registerFactory<EditProfilePageBloc>(
    () => EditProfilePageBloc(
      listenCurrentUserDataUseCase: getIt<ListenCurrentUserDataUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
      detectCurrentLocationUseCase: getIt<DetectCurrentLocationUseCase>(),
      updateUserCoordinatesUseCase: getIt<UpdateUserCoordinatesUseCase>(),
    ),
  );
  getIt.registerLazySingleton<UserBloc>(
    () => UserBloc(
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
    ),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      deleteAccountUseCase: getIt<DeleteAccountUseCase>(),
    ),
  );
}
