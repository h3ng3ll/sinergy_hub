import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../data/extensions/chat_list_config_ext.dart';
import '../../data/extensions/chat_list_filter_ext.dart';
import '../../data/models/chat_dto/chat_dto.dart';
import '../models/chat/chat.dart';
import '../models/chat_config/chat_config.dart';
import '../models/e_chat_filter.dart';
import '../repositories/i_chat_config_repository.dart';
import '../repositories/i_chat_repository.dart';
import 'bundle_chat_use_case.dart';
import 'get_chat_config_use_case.dart';
import 'get_chat_configs_use_case.dart';

class SearchChatsUseCase {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final BundleChatUseCase _bundleChatUseCase;
  final IChatConfigRepository _chatConfigRepository;
  final GetChatConfigsUseCase _getChatConfigsUseCase;

  SearchChatsUseCase({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required BundleChatUseCase bundleChatUseCase,
    required IChatConfigRepository chatConfigRepository,
    required GetChatConfigsUseCase getChatConfigsUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _bundleChatUseCase = bundleChatUseCase,
       _getChatConfigsUseCase = getChatConfigsUseCase,
       _chatConfigRepository = chatConfigRepository;

  /// Accept UID of participants which not include current user
  Future<List<Chat>> call({
    required String query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    final uid = await _authRepository.requireUserId();

    // 1. Получаем все персональные чаты пользователя
    final userChatConfigs = await _getChatConfigsUseCase.call();

    // Map chatId → ChatConfig
    final configMap = {
      for (final config in userChatConfigs) config.chatId: config,
    };
    // 2. Берём chatId, где пользователь участвует
    final List<String> chatIds = configMap.keys.toList();

    if (chatIds.isEmpty) return [];

    final List<ChatDto> chatsDto = await _chatRepository.get(
      uid: uid,
      chatIds: chatIds,
      query: query,
    );

    // 4. Объединяем с настройками пользователя
    final List<ChatDto> chatsWithConfig = chatsDto.map(
      (chat) {
        final config = configMap[chat.chatId];
        return chat.copyWith(
          isArchived: config?.archived ?? false,
          isFavorite: config?.favorite ?? false,
        );
      },
    ).toList();

    // 5. Применяем фильтр и поиск
    final List<ChatDto> filtered = chatsWithConfig.toList().filterBy(
      filter,
    ); // extension из data layer

    final bundledChats =
        await Stream.fromIterable(
          filtered,
        ).asyncMap(
          (e) async {
            return await _bundleChatUseCase.call(
              chat: e,
            );
          },
        ).toList();

    return bundledChats;
  }
}
