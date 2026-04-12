import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../core/services/firebase/firebase_storage_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../home/presentation/edit_profile_page/bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import '../../onboard_survey/domain/use_cases/get_skills_use_case.dart';
import '../data/repositories/user_firebase_repository.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/usecases/get_current_user_data_use_case.dart';
import '../domain/usecases/get_user_data_use_case.dart';
import '../domain/usecases/get_users_use_case.dart';
import '../domain/usecases/listen_current_user_data_use_case.dart';
import '../domain/usecases/listen_user_data_use_case.dart';
import '../domain/usecases/update_user_profiler_use_case.dart';
import '../domain/usecases/update_user_usecase.dart';
import '../presentation/bloc/skills_bloc/skills_bloc.dart';
import '../presentation/pages/edit_looking_for_page/bloc/edit_looking_for_bloc.dart';

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
  getIt.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetCurrentUserDataUseCase>(
    () => GetCurrentUserDataUseCase(
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerFactory<EditLookingForBloc>(
    () => EditLookingForBloc(
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
      authRepository: getIt<IAuthRepository>(),
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
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerFactory<ListenUserDataUseCase>(
    () => ListenUserDataUseCase(
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerFactory<EditProfilePageBloc>(
    () => EditProfilePageBloc(
      listenCurrentUserDataUseCase: getIt<ListenCurrentUserDataUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
    ),
  );
}
