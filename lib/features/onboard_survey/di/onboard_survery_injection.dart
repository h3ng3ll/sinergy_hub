import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/repositories/i_user_write_repository.dart';
import '../../user/domain/usecases/update_user_profiler_use_case.dart';
import '../data/repositories/onboard_survey_firebase_repository.dart';
import '../data/repositories/skills_local_repository.dart';
import '../domain/repositories/i_onboard_survey_repository.dart';
import '../domain/repositories/i_skill_repository.dart';
import '../../auth/domain/repostories/i_auth_temp_credentials_repository.dart';
import '../domain/use_cases/get_cached_auth_credentials_use_case.dart';
import '../domain/use_cases/get_completion_status_use_case.dart';
import '../domain/use_cases/get_skills_use_case.dart';
import '../domain/use_cases/set_completion_status_use_case.dart';
import '../presentation/bloc/onboard_bloc/onboard_bloc.dart';
import '../presentation/pages/onboard_about_you_page/bloc/onboard_about_you_bloc/onboard_about_you_bloc.dart';

void initOnboardSurveyFeature(GetIt getIt) {
  getIt.registerLazySingleton<IOnboardSurveyRepository>(
    () => OnboardSurveyFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerLazySingleton<ISkillRepository>(
    () => SkillsLocalRepository(),
  );

  getIt.registerFactory<SetCompletionStatusUseCase>(
    () => SetCompletionStatusUseCase(
      onboardSurveyRepository: getIt<IOnboardSurveyRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerFactory<GetCompletionStatusUseCase>(
    () => GetCompletionStatusUseCase(
      onboardSurveyRepository: getIt<IOnboardSurveyRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerFactory<UpdateUserProfilerUseCase>(
    () => UpdateUserProfilerUseCase(
      authRepository: getIt<IAuthRepository>(),
      userWriteRepository: getIt<IUserWriteRepository>(),
    ),
  );
  getIt.registerFactory<GetSkillsUseCase>(
    () => GetSkillsUseCase(
      skillRepository: getIt<ISkillRepository>(),
    ),
  );

  getIt.registerFactory<GetCachedAuthCredentialsUseCase>(
    () => GetCachedAuthCredentialsUseCase(
      authTempCredentialsRepository: getIt<IAuthTempCredentialsRepository>(),
    ),
  );

  getIt.registerLazySingleton<OnboardBloc>(
    () => OnboardBloc(
      getUserCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
      setUserCompletionStatusUseCase: getIt<SetCompletionStatusUseCase>(),
    ),
  );

  getIt.registerFactory<OnboardAboutYouBloc>(
    () => OnboardAboutYouBloc(
      getCachedAuthCredentialsUseCase: getIt<GetCachedAuthCredentialsUseCase>(),
    ),
  );
}
