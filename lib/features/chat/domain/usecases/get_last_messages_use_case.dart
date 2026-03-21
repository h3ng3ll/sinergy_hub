import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';

class ListenLastMessagesUseCase {
  final IChatMessageRepository _chatMessageRepository;
  final IAuthRepository _authRepository;

  ListenLastMessagesUseCase({
    required IChatMessageRepository chatMessageRepository,
    required IAuthRepository authRepository,
  }) : _chatMessageRepository = chatMessageRepository,
       _authRepository = authRepository;

  /// At the beginning Load last 30 messages
  /// and added 1 by 1 data after
  /// creation
  Stream<List<ChatMessage>> call({
    required String chatId,
  }) async* {
    final uid = await _authRepository.requireUserId();
    yield* _chatMessageRepository.getLastMessagesStream(
      chatId: chatId,
      uid: uid,
    );
  }
}
