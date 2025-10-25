import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../../user/domain/repositories/i_user_repository.dart';
import '../data/repositories/chat_firebase_repository.dart';
import '../data/repositories/chat_message_firebase_repository.dart';
import '../domain/models/chat_message/chat_message.dart';
import '../domain/repositories/i_chat_message_repository.dart';
import '../domain/repositories/i_chat_repository.dart';
import '../domain/usecases/get_chat_by_id_use_case.dart';
import '../domain/usecases/get_chats_use_case.dart';
import '../domain/usecases/get_last_messages_use_case.dart';
import '../domain/usecases/init_chat_use_case.dart';
import '../domain/usecases/send_message_use_case.dart';

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

  getIt.registerLazySingleton<GetChatsUseCase>(
    () => GetChatsUseCase(
      chatRepository: getIt<IChatRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetLastMessagesUseCase>(
    () => GetLastMessagesUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
    ),
  );
  getIt.registerLazySingleton<InitChatUseCase>(
    () => InitChatUseCase(
      chatRepository: getIt<IChatRepository>(),
    ),
  );
  getIt.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(
      chatMessageRepository: getIt<IChatMessageRepository>(),
    ),
  );
 getIt.registerLazySingleton<GetChatByIdUseCase>(
    () => GetChatByIdUseCase(
      chatRepository: getIt<IChatRepository>(),
      userRepository: getIt<IUserRepository>(),
    ),
  );
}
