import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../user/domain/usecases/get_users_use_case.dart';
import '../../user/domain/usecases/listen_user_data_use_case.dart';
import '../data/repositories/chat_firebase_repository.dart';
import '../data/repositories/chat_message_firebase_repository.dart';
import '../domain/repositories/i_chat_message_repository.dart';
import '../domain/repositories/i_chat_repository.dart';
import '../domain/usecases/get_chat_by_id_use_case.dart';
import '../domain/usecases/get_chat_by_participants_case.dart';
import '../domain/usecases/get_chat_config_use_case.dart';
import '../domain/usecases/listen_chat_by_id_use_case.dart';
import '../domain/usecases/listen_chat_messages_use_case.dart';
import '../domain/usecases/listen_chat_updates_use_case.dart';
import '../domain/usecases/listen_chats_use_case.dart';
import '../domain/usecases/get_last_messages_use_case.dart';
import '../domain/usecases/search_chats_use_case.dart';
import '../domain/usecases/send_message_use_case.dart';
import '../domain/usecases/toggle_archive_chat_use_case.dart';
import '../domain/usecases/toggle_favorite_chat_use_case.dart';
import '../domain/usecases/update_chat_info_use_case.dart';
import '../domain/usecases/update_typing_info_use_case.dart';
import '../presentation/bloc/chat_page_bloc/chat_page_bloc.dart';

void initChatFeature(GetIt getIt) {
  getIt.registerLazySingleton<IChatRepository>(
    () => ChatFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<IChatMessageRepository>(
    () => ChatMessageFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerLazySingleton<ListenChatsUseCase>(
    () => ListenChatsUseCase(
      chatRepository: getIt<IChatRepository>(),
      userRepository: getIt<IUserRepository>(),
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
      userRepository: getIt<IUserRepository>(),
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
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerLazySingleton<UpdateTypingInfoUseCase>(
    () => UpdateTypingInfoUseCase(
      authRepository: getIt<IAuthRepository>(),
      chatRepository: getIt<IChatRepository>(),
    ),
  );
  getIt.registerLazySingleton<ChatPageBloc>(
    () => ChatPageBloc(
      sendMessageUseCase: getIt<SendMessageUseCase>(),
      getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
      getUsersUseCase: getIt<GetUsersUseCase>(),
      getLastMessageUseCase: getIt<ListenLastMessagesUseCase>(),
      updateTypingInfoUseCase: getIt<UpdateTypingInfoUseCase>(),
      listenChatByIdUseCase: getIt<ListenChatByIdUseCase>(),
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
    ),
  );
}
