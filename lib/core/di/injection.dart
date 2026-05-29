import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/di/auth_injection.dart';
import '../../features/chat/di/chat_injection.dart';
import '../../features/home/domain/di/home_injection.dart';
import '../../features/matches/di/matches_injection.dart';
import '../../features/notifications/di/notifications_injection.dart';
import '../../features/onboard_survey/di/onboard_survery_injection.dart';
import '../../features/settings/di/settings_injection.dart';
import '../../features/user/di/user_injection.dart';
import '../../features/user_chat/di/user_chat_injection.dart';
import '../../features/connectivity/di/connectivity_injection.dart';
import '../services/audio_service.dart';
import '../services/connectivity_service.dart';
import '../services/crypto_service.dart';
import '../services/firebase/firebase_auth_service.dart';
import '../services/firebase/firebase_firestore_service.dart';
import '../services/firebase/firebase_functions_service.dart';
import '../services/firebase/firebase_messaging_service.dart';
import '../services/firebase/firebase_realtime_db_service.dart';
import '../services/firebase/firebase_storage_service.dart';
import '../services/google_sign_in_service/google_sign_in_service.dart';
import '../services/image_service.dart';
import '../services/local_notification_service.dart';
import '../services/notification_tap_processor.dart';
import '../services/permission_requester_service.dart';
import '../utils/env/dev_env.dart';
import '../utils/env/env.dart';
import '../utils/env/prod_env.dart';
import '../utils/env_helper.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Firebase services (core)

  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseMessaging.instance);
  getIt.registerLazySingleton(() => FirebaseFunctions.instance);
  getIt.registerLazySingleton(
    () => FirebaseFirestoreService(
      firebaseFirestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => PermissionRequester());
  getIt.registerLazySingleton(() => FirebaseStorageService());
  getIt.registerLazySingleton(() => AudioService());
  getIt.registerLazySingleton(() => GoogleSignIn.instance);
  getIt.registerLazySingleton(() => NotificationTapProcessor());
  getIt.registerLazySingleton(() => ImageService());
  getIt.registerLazySingleton(() => CryptoService());
  getIt.registerLazySingleton(() => ConnectivityService());
  getIt.registerLazySingleton<Env>(() {

    switch (EnvHelper.dartEnv) {
      case EnvHelper.production:
        return ProdEnv();
      case EnvHelper.development:
        return DevEnv();
      default:
        throw Exception('Not specified environment');
    }
  });
  getIt.registerLazySingleton(
    () => GoogleSignInService.instance,
  );
  getIt.registerLazySingleton<FirebaseRealtimeDbService>(
    () => FirebaseRealtimeDbService(
      database: FirebaseDatabase.instance,
    ),
  );
  getIt.registerLazySingleton(
    () => LocalNotificationService(
      notificationTapProcessor: getIt<NotificationTapProcessor>(),
    ),
  );
  getIt.registerLazySingleton(
    () => FirebaseMessagingService(
      localNotificationService: getIt<LocalNotificationService>(),
      firebaseMessaging: getIt<FirebaseMessaging>(),
      env: getIt<Env>(),
    ),
  );
  getIt.registerLazySingleton<FirebaseFunctionsService>(
    () => FirebaseFunctionsService(
      firebaseFunctions: getIt<FirebaseFunctions>(),
    ),
  );

  // Auth feature

  initConnectivityFeature(
    getIt,
  );
  initHomeFeature(
    getIt,
  );
  initOnboardSurveyFeature(
    getIt,
  );
  initAuthFeature(
    getIt,
  );

  initUserFeature(
    getIt,
  );

  initMatchingFeature(
    getIt,
  );
  initChatFeature(
    getIt,
  );
  initNotificationFeature(
    getIt,
  );

  initSettingsFeature(
    getIt,
  );

  initUserChatFeature(
    getIt,
  );
  // TODO: Add onboarding, profile, etc.
}
