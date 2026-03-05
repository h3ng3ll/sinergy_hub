import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../user/domain/repositories/i_user_repository.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';

class GetChatByParticipantsCase {
  final IChatRepository _chatRepository;
  final BundleChatUseCase _bundleChatUseCase;

  GetChatByParticipantsCase({
    required IChatRepository chatRepository,
    required BundleChatUseCase bundleChatUseCase,
  }) : _chatRepository = chatRepository,
       _bundleChatUseCase = bundleChatUseCase;

  Future<Chat?> call({
    required List<String> participates,
  }) async {
    final ChatDto? chat = await _chatRepository.chatByParticipates(
      participates: participates,
    );
    return await _bundleChatUseCase.call(
      chat: chat,
    );
  }
}
