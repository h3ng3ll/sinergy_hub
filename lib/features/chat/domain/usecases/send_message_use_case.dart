import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/message_not_sent_failure.dart';
import '../models/chat/chat.dart';
import '../models/chat_message/chat_message.dart';
import '../repositories/i_chat_message_repository.dart';
import 'get_chat_by_id_use_case.dart';
import 'update_chat_info_use_case.dart';

class SendMessageUseCase {
  final IChatMessageRepository _chatMessageRepository;
  final IAuthRepository _authRepository;
  final UpdateChatInfoUseCase _updateChatInfoUseCase;
  final GetChatByIdUseCase _getChatByIdUseCase;

  SendMessageUseCase({
    required IChatMessageRepository chatMessageRepository,
    required IAuthRepository authRepository,
    required UpdateChatInfoUseCase updateChatInfoUseCase,
    required GetChatByIdUseCase getChatByIdUseCase,
  }) : _chatMessageRepository = chatMessageRepository,
       _authRepository = authRepository,
       _getChatByIdUseCase = getChatByIdUseCase,
       _updateChatInfoUseCase = updateChatInfoUseCase;

  Future<Either<void, Failure>> call({
    required String message,
    required String chatId,
  }) async {
    try {
      final normalised = _normaliseMessage(message);
      if (normalised.isEmpty) {
        return Right(MessageNotSentFailure());
      }
      final uid = await _authRepository.requireUserId();
      final chatMessage = ChatMessage(
        createdAt: DateTime.now(),
        sentUid: uid,
        message: normalised,
        // hasRead: false,
      );
      await _chatMessageRepository.create(
        message: chatMessage,
        chatId: chatId,
      );
      final Chat chat = await _getChatByIdUseCase.call(
        chatId: chatId,
      );
      final updatedChat = chat.copyWith(
        lastMessage: normalised,
        lastMessageSentBy: uid,
      );
      await _updateChatInfoUseCase(
        chatId: chat.chatId,
        chat: updatedChat,
      );
      return Left(
        null,
      );
    } catch (_) {
      return Right(
        MessageNotSentFailure(),
      );
    }
  }

  /// Strips leading/trailing whitespace and collapses runs of 2+
  /// blank lines into a single line break, so a message typed with
  /// stray empty lines doesn't render with tall vertical gaps.
  String _normaliseMessage(String input) {
    final collapsed = input.replaceAll(
      RegExp(r'(\r?\n[ \t]*){2,}'),
      '\n',
    );
    return collapsed.trim();
  }
}
