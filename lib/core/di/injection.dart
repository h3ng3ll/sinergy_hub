import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/repositories/auth_repository/firebase_auth_repository.dart';
import '../../features/auth/domain/repostories/i_auth_repository.dart';
import '../../features/onboard_survey/data/repositories/onboard_survey_firebase_repository.dart';
import '../../features/onboard_survey/doman/repositories/i_onboard_survey_repository.dart';
import '../services/firebase/firebase_auth_service.dart';
import '../services/firebase/firebase_firestore_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Firebase services (core)

  getIt.registerLazySingleton(() => FirebaseFirestoreService());

  // Auth feature
  getIt.registerLazySingleton<IAuthRepository>(
    () => FirebaseAuthRepository(
      auth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn.instance,
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerLazySingleton<IOnboardSurveyRepository>(
    () => OnboardSurveyFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  // TODO: Add onboarding, profile, etc.
}
