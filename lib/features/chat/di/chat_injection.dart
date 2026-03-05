import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../auth/domain/repostories/i_auth_repository.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/chat_firebase_repository.dart';
import '../data/repositories/chat_message_firebase_repository.dart';
import '../domain/repositories/i_chat_message_repository.dart';
import '../domain/repositories/i_chat_repository.dart';
import '../domain/usecases/bundle_chat_use_case.dart';
import '../domain/usecases/get_chat_by_id_use_case.dart';
import '../domain/usecases/get_chat_by_participants_case.dart';
import '../domain/usecases/listen_chats_use_case.dart';
import '../domain/usecases/get_last_messages_use_case.dart';
import '../domain/usecases/listen_chat_by_id_use_case.dart';
import '../domain/usecases/listen_chat_messages_use_case.dart';
import '../domain/usecases/send_message_use_case.dart';
import '../domain/usecases/update_chat_info_use_case.dart';

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

  getIt.registerLazySingleton<BundleChatUseCase>(
    () => BundleChatUseCase(
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<ListenChatsUseCase>(
    () => ListenChatsUseCase(
      chatRepository: getIt<IChatRepository>(),
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
      bundleChatUseCase: getIt<BundleChatUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetLastMessagesUseCase>(
    () => GetLastMessagesUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
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
      bundleChatUseCase: getIt<BundleChatUseCase>(),
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
    ),
  );
  getIt.registerLazySingleton<ListenChatByIdUseCase>(
    () => ListenChatByIdUseCase(
      chatRepository: getIt<IChatRepository>(),
      userRepository: getIt<IUserRepository>(),
      authRepository: getIt<IAuthRepository>(),
      bundleChatUseCase: getIt<BundleChatUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetChatByParticipantsCase>(
    () => GetChatByParticipantsCase(
      chatRepository: getIt<IChatRepository>(),
      bundleChatUseCase: getIt<BundleChatUseCase>(),
    ),
  );
}
