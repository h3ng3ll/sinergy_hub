import 'package:get_it/get_it.dart';

import '../../../core/services/firebase/firebase_firestore_service.dart';
import '../data/repositories/user_chat_firebase_repository.dart';
import '../domain/repositories/i_user_chat_repository.dart';
import '../domain/use_cases/create_user_chat_use_case.dart';
import '../domain/use_cases/get_user_chats_use_case.dart';

void initUserChatFeature(GetIt getIt) {
  getIt.registerLazySingleton<IUserChatRepository>(
    () => UserChatFirebaseRepository(
      firebaseFirestoreService: getIt<FirebaseFirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<CreateUserChatUseCase>(
    () => CreateUserChatUseCase(
      chatRepository: getIt<IUserChatRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetUserChatsUseCase>(
    () => GetUserChatsUseCase(
      chatRepository: getIt<IUserChatRepository>(),
    ),
  );
}
