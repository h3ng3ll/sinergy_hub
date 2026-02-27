import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../../user/domain/usecases/update_user_profiler_use_case.dart';
import '../data/repositories/onboard_survey_firebase_repository.dart';
import '../domain/repositories/i_onboard_survey_repository.dart';
import '../domain/use_cases/get_completion_status_use_case.dart';
import '../domain/use_cases/set_completion_status_use_case.dart';

void initOnboardSurveyFeature(GetIt getIt) {
  getIt.registerLazySingleton<IOnboardSurveyRepository>(
    () => OnboardSurveyFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
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
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
