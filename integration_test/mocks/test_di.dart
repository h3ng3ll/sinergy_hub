// Test DI registration. Wires every mock into getIt under the same
// types the production code reads. No Firebase, no network, no
// real credentials.

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart' show Size;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/di/injection.dart';
import 'package:sinergy_hub/core/services/audio_service.dart';
import 'package:sinergy_hub/core/services/crypto_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_auth_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_firestore_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_messaging_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_realtime_db_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_storage_service.dart';
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
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/open_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_by_participants_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_chat_config_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/get_last_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_by_id_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_messages_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_updates_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/search_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_archive_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_favorite_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_chat_info_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/update_typing_info_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_page_bloc/chat_page_bloc.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'package:sinergy_hub/features/home/presentation/edit_profile_page/bloc/edit_profile_page_bloc/edit_profile_page_bloc.dart';
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
import 'package:sinergy_hub/features/user/domain/repositories/i_user_auth_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_read_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_storage_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_write_repository.dart';
import 'package:sinergy_hub/features/user/domain/services/i_app_mode_service.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_users_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_profiler_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_usecase.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/pages/edit_looking_for_page/bloc/edit_looking_for_bloc.dart';
import 'package:sinergy_hub/features/user_chat/domain/repositories/i_user_chat_repository.dart';
import 'package:sinergy_hub/features/user_chat/domain/use_cases/create_user_chat_use_case.dart';
import 'package:sinergy_hub/features/user_chat/domain/use_cases/get_user_chats_use_case.dart';

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

late MockAuthBloc testAuthBloc;
late MockUserBloc testUserBloc;
late OnboardBloc testOnboardBloc;

/// Register every mock into getIt. Must run BEFORE building MyApp.
Future<void> setupTestDI() async {
  if (getIt.isRegistered<IAuthRepository>()) {
    await getIt.reset();
  }

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
  getIt.registerFactory(
    () => AuthorizationUseCase(presenceService: getIt<IPresenceService>()),
  );
  getIt.registerFactory(
    () => LogoutUseCase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerFactory(
    () => RegisterUseCase(
      authRepository: getIt<IAuthRepository>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => CompleteRegistrationUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => LoginUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => ResetPasswordByEmailUseCase(authRepository: getIt<IAuthRepository>()),
  );
  getIt.registerFactory(
    () => SignInWithGoogleUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => SendEmailVerificationUseCase(
      authRepository: getIt<IAuthRepository>(),
      presenceService: getIt<IPresenceService>(),
    ),
  );
  getIt.registerLazySingleton(
    () => AppleSignInUseCase(
      authRepository: getIt<IAuthRepository>(),
      authorizationUseCase: getIt<AuthorizationUseCase>(),
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
  getIt.registerLazySingleton<ListenLastMessagesUseCase>(
    () => ListenLastMessagesUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
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
  getIt.registerLazySingleton<SearchChatsUseCase>(
    () => SearchChatsUseCase(
      chatRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
      getChatConfigsUseCase: getIt<GetChatConfigUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetChatConfigUseCase>(
    () => GetChatConfigUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
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
  getIt.registerLazySingleton<ListenChatUpdatesUseCase>(
    () => ListenChatUpdatesUseCase(
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

  // User-chat use cases
  getIt.registerLazySingleton<CreateUserChatUseCase>(
    () => CreateUserChatUseCase(chatRepository: getIt<IUserChatRepository>()),
  );
  getIt.registerLazySingleton<GetUserChatsUseCase>(
    () => GetUserChatsUseCase(chatRepository: getIt<IUserChatRepository>()),
  );

  // Per-screen blocs constructed via getIt
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(loginUseCase: getIt<LoginUseCase>()),
  );
  getIt.registerFactory<ResetPasswordPageBloc>(
    () => ResetPasswordPageBloc(
      resetPasswordByEmailUseCase: getIt<ResetPasswordByEmailUseCase>(),
    ),
  );
  getIt.registerFactory<EditProfilePageBloc>(
    () => EditProfilePageBloc(
      listenCurrentUserDataUseCase: getIt<ListenCurrentUserDataUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
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
  getIt.registerLazySingleton<ChatPageBloc>(
    () => ChatPageBloc(
      sendMessageUseCase: getIt<SendMessageUseCase>(),
      openChatUseCase: getIt<OpenChatUseCase>(),
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
      getLastMessageUseCase: getIt<ListenLastMessagesUseCase>(),
      updateTypingInfoUseCase: getIt<UpdateTypingInfoUseCase>(),
      listenChatByIdUseCase: getIt<ListenChatByIdUseCase>(),
    ),
  );
  getIt.registerFactory<ChatsFilterBloc>(
    () => ChatsFilterBloc(
      searchChatsUseCase: getIt<SearchChatsUseCase>(),
      toggleArchiveChatUseCase: getIt<ToggleArchiveChatUseCase>(),
      toggleFavoriteChatUseCase: getIt<ToggleFavoriteChatUseCase>(),
      listenChatUpdatesUseCase: getIt<ListenChatUpdatesUseCase>(),
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
    ),
  );
}
