


import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../data/repositories/onboard_survey_firebase_repository.dart';
import '../doman/repositories/i_onboard_survey_repository.dart';

void initOnboardSurveyFeature(GetIt getIt) {
  getIt.registerLazySingleton<IOnboardSurveyRepository>(
        () => OnboardSurveyFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
}
