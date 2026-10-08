// Test DI registration. Wires every mock into getIt under the same
// types the production code reads. No Firebase, no network, no
// real credentials.

import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart' show Size;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_ce/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/di/injection.dart';
import 'package:sinergy_hub/core/hive/hive_adapters.dart';
import 'package:sinergy_hub/core/hive/hive_registrar.g.dart';
import 'package:sinergy_hub/features/auth/data/models/auth_temp_credentials/auth_temp_credentials.dart';
import 'package:sinergy_hub/features/auth/data/repositories/auth_temp_credentials_local_repository.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_temp_credentials_repository.dart';
import 'package:sinergy_hub/core/services/audio_service.dart';
import 'package:sinergy_hub/core/services/crypto_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_auth_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_firestore_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_messaging_service.dart';
import 'package:sinergy_hub/core/services/logger_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_realtime_db_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_storage_service.dart';
import 'package:sinergy_hub/core/services/geolocation/i_geolocation_service.dart';
import 'package:sinergy_hub/core/services/google_sign_in_service/google_sign_in_service.dart';
import 'package:sinergy_hub/core/services/image_service.dart';
import 'package:sinergy_hub/core/services/local_notification_service.dart';
import 'package:sinergy_hub/core/services/notification_tap_processor.dart';
import 'package:sinergy_hub/core/services/permission_requester_service.dart';
import 'package:sinergy_hub/core/utils/env/dev_env.dart';
import 'package:sinergy_hub/core/utils/env/env.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/apple_sign_in_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/authorization_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/login_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/complete_registration_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/register_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/reset_password_by_email_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/send_email_verification_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:sinergy_hub/features/auth/presentation/pages/login_page/bloc/login_bloc/login_bloc.dart';
import 'package:sinergy_hub/features/auth/presentation/pages/reset_password_page/bloc/reset_password_page/reset_password_page_bloc.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';
import 'package:sinergy_hub/core/services/connectivity_service.dart';
import 'package:sinergy_hub/features/connectivity/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_local_repository.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_message_local_repository.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/filter_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/open_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_participants_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/load_older_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_archive_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_block_user_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_favorite_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_chat_info_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_typing_info_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/watch_chat_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/watch_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_page_bloc/chat_page_bloc.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'package:sinergy_hub/features/home/presentation/edit_profile_page/bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
import 'package:sinergy_hub/features/home/presentation/tabs/profile_tab/bloc/profile_bloc/profile_bloc.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_candidate_distance_repository.dart';
import 'package:sinergy_hub/features/user/data/services/user_service.dart';
import 'package:sinergy_hub/features/user/domain/usecases/delete_account_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/detect_current_location_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_cached_auth_credentials_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/pages/onboard_about_you_page/bloc/onboard_about_you_bloc/onboard_about_you_bloc.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_matches_repository.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/create_user_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/find_match_chat_id_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_a_user_match_income_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_excluded_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_match_by_id_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/listen_two_way_match_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/look_for_matches_use_case.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/mark_as_notified_match_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/repositories/i_notification_config_repository.dart';
import 'package:sinergy_hub/features/notifications/domain/repositories/i_notification_repository.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/get_notification_config_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/get_notifications_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/register_current_device_token_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/save_notification_config_use_case.dart';
import 'package:sinergy_hub/features/notifications/domain/usecases/save_notification_use_case.dart';
import 'package:sinergy_hub/features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/repositories/i_onboard_survey_repository.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/repositories/i_skill_repository.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_skills_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/set_completion_status_use_case.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/bloc/onboard_bloc/onboard_bloc.dart';
import 'package:sinergy_hub/features/subscription/data/repositories/unavailable_subscription_repository.dart';
import 'package:sinergy_hub/features/subscription/domain/repositories/i_subscription_repository.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/get_subscription_management_url_use_case.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_auth_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_coordinates_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_read_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_storage_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_write_repository.dart';
import 'package:sinergy_hub/features/user/domain/services/i_app_mode_service.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_users_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_coordinates_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_profiler_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_usecase.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/pages/edit_looking_for_page/bloc/edit_looking_for_bloc.dart';
import 'package:sinergy_hub/features/user_chat/domain/repositories/i_user_chat_repository.dart';
import 'package:sinergy_hub/features/user_chat/domain/use_cases/create_user_chat_use_case.dart';
import 'package:sinergy_hub/features/user_chat/domain/use_cases/get_user_chats_use_case.dart';
import 'package:sinergy_hub/features/appearance/domain/repositories/i_background_palette_local_repository.dart';
import 'package:sinergy_hub/features/appearance/domain/repositories/i_background_palette_repository.dart';
import 'package:sinergy_hub/features/appearance/domain/usecases/get_background_palette_use_case.dart';
import 'package:sinergy_hub/features/appearance/domain/usecases/save_background_palette_use_case.dart';
import 'package:sinergy_hub/features/appearance/presentation/bloc/background_palette_bloc/background_palette_bloc.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_discovery_deck_local_repository.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_liked_you_local_repository.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_liked_you_meta_repository.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_liked_you_repository.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_cached_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/get_liked_you_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/remove_from_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/save_discovery_deck_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/sync_liked_you_use_case.dart';
import 'package:sinergy_hub/features/matches/domain/usecases/watch_liked_you_use_case.dart';
import 'package:sinergy_hub/features/report/domain/repositories/i_report_repository.dart';
import 'package:sinergy_hub/features/report/domain/usecases/report_use_case.dart';
import 'package:sinergy_hub/features/settings/presentation/bloc/settings_notification_bloc/settings_notification_bloc.dart';
import 'package:sinergy_hub/features/subscription/domain/repositories/i_premium_status_repository.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/get_plans_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/identify_subscriber_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/purchase_plan_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/restore_purchases_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/watch_current_premium_status_use_case.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/watch_premium_status_use_case.dart';
import 'package:sinergy_hub/features/subscription/presentation/bloc/premium_bloc/premium_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/pages/edit_experience_page/bloc/edit_experience_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/pages/edit_specialization_page/bloc/edit_specialization_bloc.dart';

import 'mock_blocs.dart';
import 'mock_repositories.dart';

class _FakeFirebaseMessaging extends Mock implements FirebaseMessaging {}

class _FakeGoogleSignIn extends Mock implements GoogleSignIn {}

class _FakeFirebaseAuthService extends Mock implements FirebaseAuthService {}

class _FakeFirebaseFirestoreService extends Mock
    implements FirebaseFirestoreService {}

class _FakeFirebaseStorageService extends Mock
    implements FirebaseStorageService {}

class _FakeFirebaseFunctionsService extends Mock
    implements FirebaseFunctionsService {}

class _FakeFirebaseMessagingService extends Mock
    implements FirebaseMessagingService {
  @override
  String get fcmToken => 'mock-fcm-token';

  @override
  Future<String?> get fcmTokenReady => Future<String?>.value('mock-fcm-token');

  @override
  Stream<String> get onTokenRefresh => const Stream<String>.empty();
}

class _FakeFirebaseRealtimeDbService extends Mock
    implements FirebaseRealtimeDbService {}

class _FakeLocalNotificationService extends Mock
    implements LocalNotificationService {}

class _FakeNotificationTapProcessor extends Mock
    implements NotificationTapProcessor {}

class _FakePermissionRequester extends Mock implements PermissionRequester {}

class _FakeAudioService extends Mock implements AudioService {}

class _FakeCryptoService extends Mock implements CryptoService {}

class _FakeImageService extends Mock implements ImageService {}

class _FakeGoogleSignInService extends Mock implements GoogleSignInService {}

class _FakeFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {
  @override
  Future<void> log(String message) async {}

  @override
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<Object> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {}
}

late MockAuthBloc testAuthBloc;
late MockUserBloc testUserBloc;
late OnboardBloc testOnboardBloc;

/// Register every mock into getIt. Must run BEFORE building MyApp.
Future<void> setupTestDI() async {
  if (getIt.isRegistered<IAuthRepository>()) {
    await getIt.reset();
  }

  // Hive cache (in-memory temp dir) — the Apple credentials cache repository.
  if (!Hive.isAdapterRegistered(AuthTempCredentialsAdapter().typeId)) {
    Hive.init(Directory.systemTemp.createTempSync('test_hive').path);
    Hive.registerAdapters();
  }
  final authTempCredentialsBox = await Hive.openBox<AuthTempCredentials>(
    'auth_temp_credentials_test',
  );
  getIt.registerSingleton<IAuthTempCredentialsRepository>(
    AuthTempCredentialsLocalRepository(box: authTempCredentialsBox),
  );

  // Services & wrappers (Firebase-touching ones get mocktail stubs)
  getIt.registerLazySingleton<Env>(() => DevEnv());
  getIt.registerLazySingleton<FirebaseMessaging>(
    () => _FakeFirebaseMessaging(),
  );
  getIt.registerLazySingleton<GoogleSignIn>(() => _FakeGoogleSignIn());
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => _FakeFirebaseAuthService(),
  );
  getIt.registerLazySingleton<FirebaseFirestoreService>(
    () => _FakeFirebaseFirestoreService(),
  );
  getIt.registerLazySingleton<FirebaseStorageService>(
    () => _FakeFirebaseStorageService(),
  );
  getIt.registerLazySingleton<FirebaseFunctionsService>(
    () => _FakeFirebaseFunctionsService(),
  );
  getIt.registerLazySingleton<FirebaseMessagingService>(
    () => _FakeFirebaseMessagingService(),
  );
  getIt.registerLazySingleton<FirebaseRealtimeDbService>(
    () => _FakeFirebaseRealtimeDbService(),
  );
  getIt.registerLazySingleton<LocalNotificationService>(
    () => _FakeLocalNotificationService(),
  );
  getIt.registerLazySingleton<NotificationTapProcessor>(
    () => _FakeNotificationTapProcessor(),
  );
  getIt.registerLazySingleton<PermissionRequester>(
    () => _FakePermissionRequester(),
  );
  getIt.registerLazySingleton<AudioService>(() => _FakeAudioService());
  getIt.registerLazySingleton<CryptoService>(() => _FakeCryptoService());
  getIt.registerLazySingleton<ImageService>(() => _FakeImageService());
  getIt.registerLazySingleton<GoogleSignInService>(
    () => _FakeGoogleSignInService(),
  );
  getIt.registerLazySingleton<FirebaseCrashlytics>(
    () => _FakeFirebaseCrashlytics(),
  );
  getIt.registerLazySingleton<LoggerService>(
    () => LoggerService(crashlytics: getIt<FirebaseCrashlytics>()),
  );
  getIt.registerLazySingleton<UserService>(() => UserService());

  // Interfaces (real mock impls)
  getIt.registerLazySingleton<IAuthRepository>(() => MockAuthRepository());
  getIt.registerLazySingleton<IUserReadRepository>(
    () => MockUserReadRepository(),
  );
  getIt.registerLazySingleton<IUserWriteRepository>(
    () => MockUserWriteRepository(),
  );
  getIt.registerLazySingleton<IUserStorageRepository>(
    () => MockUserStorageRepository(),
  );
  getIt.registerLazySingleton<IUserAuthRepository>(
    () => MockUserAuthRepository(),
  );
  getIt.registerLazySingleton<IChatRepository>(() => MockChatRepository());
  getIt.registerLazySingleton<IChatMessageRepository>(
    () => MockChatMessageRepository(),
  );
  getIt.registerLazySingleton<IChatLocalRepository>(
    () => MockChatLocalRepository(),
  );
  getIt.registerLazySingleton<IChatMessageLocalRepository>(
    () => MockChatMessageLocalRepository(),
  );
  getIt.registerLazySingleton<IGeolocationService>(
    () => MockGeolocationService(),
  );
  getIt.registerLazySingleton<IUserCoordinatesRepository>(
    () => MockUserCoordinatesRepository(),
  );
  getIt.registerLazySingleton<ISubscriptionRepository>(
    () => UnavailableSubscriptionRepository(),
  );
  getIt.registerLazySingleton<IPremiumStatusRepository>(
    () => MockPremiumStatusRepository(),
  );
  getIt.registerLazySingleton<ICandidateDistanceRepository>(
    () => MockCandidateDistanceRepository(),
  );
  getIt.registerLazySingleton<IDiscoveryDeckLocalRepository>(
    () => MockDiscoveryDeckLocalRepository(),
  );
  getIt.registerLazySingleton<ILikedYouRepository>(
    () => MockLikedYouRepository(),
  );
  getIt.registerLazySingleton<ILikedYouMetaRepository>(
    () => MockLikedYouMetaRepository(),
  );
  getIt.registerLazySingleton<ILikedYouLocalRepository>(
    () => MockLikedYouLocalRepository(),
  );
  getIt.registerLazySingleton<IReportRepository>(() => MockReportRepository());
  getIt.registerLazySingleton<IBackgroundPaletteRepository>(
    () => MockBackgroundPaletteRepository(),
  );
  getIt.registerLazySingleton<IBackgroundPaletteLocalRepository>(
    () => MockBackgroundPaletteLocalRepository(),
  );
  getIt.registerLazySingleton<IMatchesRepository>(
    () => MockMatchesRepository(),
  );
  getIt.registerLazySingleton<INotificationRepository>(
    () => MockNotificationRepository(),
  );
  getIt.registerLazySingleton<INotificationConfigRepository>(
    () => MockNotificationConfigRepository(),
  );
  getIt.registerLazySingleton<IOnboardSurveyRepository>(
    () => MockOnboardSurveyRepository(),
  );
  getIt.registerLazySingleton<ISkillRepository>(() => MockSkillRepository());
  getIt.registerLazySingleton<IUserChatRepository>(
    () => MockUserChatRepository(),
  );
  getIt.registerLazySingleton<IAppModeService>(() => MockAppModeService());
  getIt.registerLazySingleton<IPresenceService>(() => MockPresenceService());
  getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
  getIt.registerLazySingleton<ConnectivityBloc>(
    () => ConnectivityBloc(connectivityService: getIt<ConnectivityService>()),
  );

  // Auth use cases (production code reading mock interfaces)
  getIt.registerFactory<AuthorizationUseCase>(
    () => AuthorizationUseCase(presenceService: getIt<IPresenceService>()),
  );
  getIt.registerFactory<LogoutUseCase>(
    () => LogoutUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerFactory<CompleteRegistrationUseCase>(
    () => CompleteRegistrationUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory<LoginUseCase>(
    () => LoginUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory<ResetPasswordByEmailUseCase>(
    () => ResetPasswordByEmailUseCase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerFactory<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerLazySingleton<AppleSignInUseCase>(
    () => AppleSignInUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
      authTempCredentialsRepository: getIt<IAuthTempCredentialsRepository>(),
    ),
  );

  // User use cases
  getIt.registerLazySingleton<UpdateUserUseCase>(
    () => UpdateUserUseCase(
      userStorageRepository: getIt<IUserStorageRepository>(),
      userWriteRepository: getIt<IUserWriteRepository>(),
      authRepository: getIt<IAuthRepository>(),
      imageService: getIt<ImageService>(),
    ),
  );
  getIt.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(userReadRepository: getIt<IUserReadRepository>()),
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
  getIt.registerFactory<ListenCurrentUserDataUseCase>(
    () => ListenCurrentUserDataUseCase(
      authRepository: getIt<IAuthRepository>(),
      userReadRepository: getIt<IUserReadRepository>(),
    ),
  );
  getIt.registerFactory<ListenUserDataUseCase>(
    () =>
        ListenUserDataUseCase(userReadRepository: getIt<IUserReadRepository>()),
  );
  getIt.registerFactory<DetectCurrentLocationUseCase>(
    () => DetectCurrentLocationUseCase(
      geolocationService: getIt<IGeolocationService>(),
    ),
  );
  getIt.registerFactory<UpdateUserCoordinatesUseCase>(
    () => UpdateUserCoordinatesUseCase(
      userCoordinatesRepository: getIt<IUserCoordinatesRepository>(),
    ),
  );

  // Onboard use cases
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
    () => GetSkillsUseCase(skillRepository: getIt<ISkillRepository>()),
  );
  getIt.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerFactory<GetCachedAuthCredentialsUseCase>(
    () => GetCachedAuthCredentialsUseCase(
      authTempCredentialsRepository: getIt<IAuthTempCredentialsRepository>(),
    ),
  );
  getIt.registerFactory<OnboardAboutYouBloc>(
    () => OnboardAboutYouBloc(
      getCachedAuthCredentialsUseCase: getIt<GetCachedAuthCredentialsUseCase>(),
    ),
  );

  // Matches use cases
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
  getIt.registerLazySingleton<GetSubscriptionManagementUrlUseCase>(
    () => GetSubscriptionManagementUrlUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetPlansUseCase>(
    () => GetPlansUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<PurchasePlanUseCase>(
    () => PurchasePlanUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<RestorePurchasesUseCase>(
    () => RestorePurchasesUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<IdentifySubscriberUseCase>(
    () => IdentifySubscriberUseCase(
      subscriptionRepository: getIt<ISubscriptionRepository>(),
    ),
  );
  getIt.registerLazySingleton<WatchPremiumStatusUseCase>(
    () => WatchPremiumStatusUseCase(
      premiumStatusRepository: getIt<IPremiumStatusRepository>(),
    ),
  );
  getIt.registerLazySingleton<WatchCurrentPremiumStatusUseCase>(
    () => WatchCurrentPremiumStatusUseCase(
      premiumStatusRepository: getIt<IPremiumStatusRepository>(),
    ),
  );
  getIt.registerLazySingleton<PremiumBloc>(
    () => PremiumBloc(
      identifySubscriberUseCase: getIt<IdentifySubscriberUseCase>(),
      watchPremiumStatusUseCase: getIt<WatchPremiumStatusUseCase>(),
    ),
  );

  // Appearance
  getIt.registerLazySingleton<GetBackgroundPaletteUseCase>(
    () => GetBackgroundPaletteUseCase(
      localRepository: getIt<IBackgroundPaletteLocalRepository>(),
      remoteRepository: getIt<IBackgroundPaletteRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SaveBackgroundPaletteUseCase>(
    () => SaveBackgroundPaletteUseCase(
      localRepository: getIt<IBackgroundPaletteLocalRepository>(),
      remoteRepository: getIt<IBackgroundPaletteRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<BackgroundPaletteBloc>(
    () => BackgroundPaletteBloc(
      getBackgroundPaletteUseCase: getIt<GetBackgroundPaletteUseCase>(),
      saveBackgroundPaletteUseCase: getIt<SaveBackgroundPaletteUseCase>(),
      watchCurrentPremiumStatusUseCase:
          getIt<WatchCurrentPremiumStatusUseCase>(),
    ),
  );

  // Report
  getIt.registerLazySingleton<ReportUserUseCase>(
    () => ReportUserUseCase(reportRepository: getIt<IReportRepository>()),
  );

  // Liked you + discovery deck
  getIt.registerLazySingleton<GetLikedYouUseCase>(
    () => GetLikedYouUseCase(likedYouRepository: getIt<ILikedYouRepository>()),
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
  getIt.registerLazySingleton<GetCachedDiscoveryDeckUseCase>(
    () => GetCachedDiscoveryDeckUseCase(
      localRepository: getIt<IDiscoveryDeckLocalRepository>(),
      getExcludedMatchesUseCase: getIt<GetExcludedMatchesUseCase>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SaveDiscoveryDeckUseCase>(
    () => SaveDiscoveryDeckUseCase(
      localRepository: getIt<IDiscoveryDeckLocalRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<RemoveFromDiscoveryDeckUseCase>(
    () => RemoveFromDiscoveryDeckUseCase(
      localRepository: getIt<IDiscoveryDeckLocalRepository>(),
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
  // Cubits — registered as factory to match production. The discovery
  // screen owns the lifecycle (initState → getIt<TinderCardCubit>(),
  // dispose → close()), so a fresh instance per lookup is required.
  // Tests grab the live instance from the rendered widget tree via
  // context.read<TinderCardCubit>(), not from DI.
  getIt.registerFactory<TinderCardCubit>(
    () => TinderCardCubit(size: const Size(300.0, 590.0)),
  );

  // Chat use cases
  getIt.registerLazySingleton<ListenChatsUseCase>(
    () => ListenChatsUseCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
      authRepository: getIt<IAuthRepository>(),
      updateChatInfoUseCase: getIt<UpdateChatInfoUseCase>(),
      getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetChatByIdUseCase>(
    () => GetChatByIdUseCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<ListenChatMessagesUseCase>(
    () => ListenChatMessagesUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
    ),
  );
  getIt.registerLazySingleton<UpdateChatInfoUseCase>(
    () => UpdateChatInfoUseCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<ListenChatByIdUseCase>(
    () => ListenChatByIdUseCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetChatByParticipantsCase>(
    () => GetChatByParticipantsCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<WatchChatsUseCase>(
    () => WatchChatsUseCase(
      localRepository: getIt<IChatLocalRepository>(),
      remoteRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<FilterChatsUseCase>(FilterChatsUseCase.new);
  getIt.registerLazySingleton<WatchChatMessagesUseCase>(
    () => WatchChatMessagesUseCase(
      localRepository: getIt<IChatMessageLocalRepository>(),
      remoteRepository: getIt<IChatMessageRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<LoadOlderMessagesUseCase>(
    () => LoadOlderMessagesUseCase(
      localRepository: getIt<IChatMessageLocalRepository>(),
      remoteRepository: getIt<IChatMessageRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<ToggleArchiveChatUseCase>(
    () => ToggleArchiveChatUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
    ),
  );
  getIt.registerLazySingleton<ToggleFavoriteChatUseCase>(
    () => ToggleFavoriteChatUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
    ),
  );
  getIt.registerLazySingleton<UpdateTypingInfoUseCase>(
    () => UpdateTypingInfoUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
    ),
  );

  // Notification use cases
  getIt.registerLazySingleton<SaveNotificationUseCase>(
    () => SaveNotificationUseCase(
      notificationRepository: getIt<INotificationRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(
      notificationRepository: getIt<INotificationRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetNotificationsConfigUseCase>(
    () => GetNotificationsConfigUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SaveNotificationsConfigUseCase>(
    () => SaveNotificationsConfigUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<RegisterCurrentDeviceTokenUseCase>(
    () => RegisterCurrentDeviceTokenUseCase(
      notificationConfigRepository: getIt<INotificationConfigRepository>(),
      authRepository: getIt<IAuthRepository>(),
      firebaseMessagingService: getIt<FirebaseMessagingService>(),
      logger: getIt<LoggerService>(),
    ),
  );

  // User-chat use cases
  getIt.registerLazySingleton<CreateUserChatUseCase>(
    () => CreateUserChatUseCase(chatRepository: getIt<IUserChatRepository>()),
  );
  getIt.registerLazySingleton<GetUserChatsUseCase>(
    () => GetUserChatsUseCase(chatRepository: getIt<IUserChatRepository>()),
  );

  // Per-screen blocs constructed via getIt
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: getIt<LoginUseCase>(),
      completeRegistrationUseCase: getIt<CompleteRegistrationUseCase>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
    ),
  );
  getIt.registerFactory<ResetPasswordPageBloc>(
    () => ResetPasswordPageBloc(
      resetPasswordByEmailUseCase: getIt<ResetPasswordByEmailUseCase>(),
    ),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      deleteAccountUseCase: getIt<DeleteAccountUseCase>(),
      getSubscriptionManagementUrlUseCase:
          getIt<GetSubscriptionManagementUrlUseCase>(),
    ),
  );
  getIt.registerFactory<EditProfilePageBloc>(
    () => EditProfilePageBloc(
      listenCurrentUserDataUseCase: getIt<ListenCurrentUserDataUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
      detectCurrentLocationUseCase: getIt<DetectCurrentLocationUseCase>(),
      updateUserCoordinatesUseCase: getIt<UpdateUserCoordinatesUseCase>(),
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
  getIt.registerFactory<SettingsNotificationBloc>(
    () => SettingsNotificationBloc(
      getNotificationsConfigUseCase: getIt<GetNotificationsConfigUseCase>(),
      saveNotificationsConfigUseCase: getIt<SaveNotificationsConfigUseCase>(),
    ),
  );
  getIt.registerFactory<EditLookingForBloc>(
    () => EditLookingForBloc(
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<OpenChatUseCase>(
    () => OpenChatUseCase(
      getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
      getUsersUseCase: getIt<GetUsersUseCase>(),
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
    ),
  );
  getIt.registerLazySingleton<ToggleBlockUserUseCase>(
    () => ToggleBlockUserUseCase(chatRepository: getIt<IChatRepository>()),
  );
  getIt.registerLazySingleton<ChatPageBloc>(
    () => ChatPageBloc(
      sendMessageUseCase: getIt<SendMessageUseCase>(),
      watchChatMessagesUseCase: getIt<WatchChatMessagesUseCase>(),
      loadOlderMessagesUseCase: getIt<LoadOlderMessagesUseCase>(),
      openChatUseCase: getIt<OpenChatUseCase>(),
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
      updateTypingInfoUseCase: getIt<UpdateTypingInfoUseCase>(),
      listenChatByIdUseCase: getIt<ListenChatByIdUseCase>(),
      toggleBlockUserUseCase: getIt<ToggleBlockUserUseCase>(),
    ),
  );
  getIt.registerFactory<ChatsFilterBloc>(
    () => ChatsFilterBloc(
      watchChatsUseCase: getIt<WatchChatsUseCase>(),
      filterChatsUseCase: getIt<FilterChatsUseCase>(),
      toggleArchiveChatUseCase: getIt<ToggleArchiveChatUseCase>(),
      toggleFavoriteChatUseCase: getIt<ToggleFavoriteChatUseCase>(),
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
    ),
  );
  // SkillsBloc: provide a mock implementation so screens watching it
  // see a populated list even though the test doesn't fire the fetch
  // event.
  getIt.registerFactory<SkillsBloc>(
    () => MockSkillsBloc(getSkillsUseCase: getIt<GetSkillsUseCase>()),
  );

  // Global mock blocs
  testAuthBloc = MockAuthBloc(
    authRepository: getIt<IAuthRepository>(),
    signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
    appleSignInUseCase: getIt<AppleSignInUseCase>(),
    logoutUseCase: getIt<LogoutUseCase>(),
  );
  testUserBloc = MockUserBloc(
    listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
  );
  testOnboardBloc = OnboardBloc(
    getUserCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
    setUserCompletionStatusUseCase: getIt<SetCompletionStatusUseCase>(),
  );
  getIt.registerSingleton<AuthBloc>(testAuthBloc);
  getIt.registerSingleton<UserBloc>(testUserBloc);
  getIt.registerSingleton<OnboardBloc>(testOnboardBloc);
  getIt.registerSingleton<ChatBloc>(
    MockChatBloc(getChatsUseCase: getIt<ListenChatsUseCase>()),
  );
  getIt.registerSingleton<NotificationConfigBloc>(
    MockNotificationConfigBloc(
      getNotificationsConfigUseCase: getIt<GetNotificationsConfigUseCase>(),
      saveNotificationsConfigUseCase: getIt<SaveNotificationsConfigUseCase>(),
      registerCurrentDeviceTokenUseCase:
          getIt<RegisterCurrentDeviceTokenUseCase>(),
      firebaseMessagingService: getIt<FirebaseMessagingService>(),
    ),
  );
}
