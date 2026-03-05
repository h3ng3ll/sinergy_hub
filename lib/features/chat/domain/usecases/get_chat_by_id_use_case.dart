import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/exception/no_found_user_exception.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../models/chat/chat.dart';
import '../models/chat_info/chat_info.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';

class GetChatByIdUseCase {
  final IChatRepository _chatRepository;
  final BundleChatUseCase _bundleChatUseCase;

  GetChatByIdUseCase({
    required IChatRepository chatRepository,
    required BundleChatUseCase bundleChatUseCase,
  }) : _chatRepository = chatRepository,
       _bundleChatUseCase = bundleChatUseCase;

  Future<Chat> call({
    required String chatId,
  }) async {
    final chat = await _chatRepository.getById(
      chatId: chatId,
    );
    return await _bundleChatUseCase.call(
      chat: chat,
    );
  }
}
