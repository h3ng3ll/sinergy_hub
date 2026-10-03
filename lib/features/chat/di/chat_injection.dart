import 'package:get_it/get_it.dart';

import '../../../core/databases/hive_database.dart';
import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../user/domain/usecases/get_users_use_case.dart';
import '../../user/domain/usecases/listen_user_data_use_case.dart';
import '../data/repositories/chat_firebase_repository.dart';
import '../data/repositories/chat_hive_repository.dart';
import '../domain/repositories/i_chat_local_repository.dart';
import '../data/repositories/chat_message_firebase_repository.dart';
import '../data/repositories/chat_message_hive_repository.dart';
import '../domain/repositories/i_chat_message_local_repository.dart';
import '../domain/repositories/i_chat_message_repository.dart';
import '../domain/repositories/i_chat_repository.dart';
import '../domain/usecases/filter_chats_use_case.dart';
import '../domain/usecases/get_chat_by_id_use_case.dart';
import '../domain/usecases/get_chat_by_participants_case.dart';
import '../domain/usecases/get_chat_config_use_case.dart';
import '../domain/usecases/listen_chat_by_id_use_case.dart';
import '../domain/usecases/listen_chat_messages_use_case.dart';
import '../domain/usecases/listen_chat_updates_use_case.dart';
import '../domain/usecases/listen_chats_use_case.dart';
import '../domain/usecases/load_older_messages_use_case.dart';
import '../domain/usecases/open_chat_use_case.dart';
import '../domain/usecases/search_chats_use_case.dart';
import '../domain/usecases/send_message_use_case.dart';
import '../domain/usecases/toggle_archive_chat_use_case.dart';
import '../domain/usecases/toggle_block_user_use_case.dart';
import '../domain/usecases/toggle_favorite_chat_use_case.dart';
import '../domain/usecases/update_chat_info_use_case.dart';
import '../domain/usecases/update_typing_info_use_case.dart';
import '../domain/usecases/watch_chat_messages_use_case.dart';
import '../domain/usecases/watch_chats_use_case.dart';
import '../presentation/bloc/chat_page_bloc/chat_page_bloc.dart';
import '../presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';

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
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<IChatLocalRepository>(
    () => ChatHiveRepository(
      hiveDatabase: getIt<HiveDatabase>(),
    ),
  );
  getIt.registerLazySingleton<WatchChatsUseCase>(
    () => WatchChatsUseCase(
      localRepository: getIt<IChatLocalRepository>(),
      remoteRepository: getIt<IChatRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<FilterChatsUseCase>(
    FilterChatsUseCase.new,
  );
  getIt.registerLazySingleton<IChatMessageLocalRepository>(
    () => ChatMessageHiveRepository(
      hiveDatabase: getIt<HiveDatabase>(),
    ),
  );
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
  getIt.registerLazySingleton<OpenChatUseCase>(
    () => OpenChatUseCase(
      getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
      getUsersUseCase: getIt<GetUsersUseCase>(),
      getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
    ),
  );
  getIt.registerLazySingleton<ToggleBlockUserUseCase>(
    () => ToggleBlockUserUseCase(
      chatRepository: getIt<IChatRepository>(),
    ),
  );

  /// Bloc
  getIt.registerFactory<ChatPageBloc>(
    () => ChatPageBloc(
      sendMessageUseCase: getIt<SendMessageUseCase>(),
      openChatUseCase: getIt<OpenChatUseCase>(),
      listenUserDataUseCase: getIt<ListenUserDataUseCase>(),
      watchChatMessagesUseCase: getIt<WatchChatMessagesUseCase>(),
      loadOlderMessagesUseCase: getIt<LoadOlderMessagesUseCase>(),
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
}
