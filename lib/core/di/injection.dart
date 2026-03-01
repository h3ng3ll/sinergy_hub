import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/di/auth_injection.dart';
import '../../features/auth/domain/services/i_webrtc_service.dart';
import '../../features/calls/domain/di/calls_injection.dart';
import '../../features/chat/di/chat_injection.dart';
import '../../features/home/domain/di/home_injection.dart';
import '../../features/matches/di/matches_injection.dart';
import '../../features/notifications/di/notifications_injection.dart';
import '../../features/onboard_survey/di/onboard_survery_injection.dart';
import '../../features/user/di/user_injection.dart';
import '../services/audio_service.dart';
import '../services/firebase/firebase_auth_service.dart';
import '../services/firebase/firebase_firestore_service.dart';
import '../services/firebase/firebase_messaging_service.dart';
import '../services/firebase/firebase_storage_service.dart';
import '../services/local_notification_service.dart';
import '../services/permission_requester_service.dart';
import '../services/webrtc_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Firebase services (core)

  getIt.registerLazySingleton(() => FirebaseFirestoreService());
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseMessaging.instance);
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => PermissionRequester());
  getIt.registerLazySingleton(() => FirebaseStorageService());
  getIt.registerLazySingleton(() => LocalNotificationService());
  getIt.registerLazySingleton(() => AudioService());

  getIt.registerLazySingleton(
    () => FirebaseMessagingService(
      localNotificationService: getIt<LocalNotificationService>(),
      firebaseMessaging: getIt<FirebaseMessaging>(),
    ),
  );
  getIt.registerLazySingleton<IWebRtcService>(
    () => WebrtcService(),
  );

  // Auth feature

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
  initCallsFeature(
    getIt,
  );
  // TODO: Add onboarding, profile, etc.
}
