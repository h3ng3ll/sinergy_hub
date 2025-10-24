import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/models/chat/chat.dart';

part 'chat_dto.g.dart';

part 'chat_dto.freezed.dart';

@freezed
sealed class ChatDto with _$ChatDto {

  const ChatDto._();

  const factory ChatDto({
    @Default('') String chatId,
    @Default('') String lastMessage,
    required DateTime lastMessageSent,

    /// who access this chat
    required List<String> participants,
    required DateTime createdAt,
  }) = _ChatDto;

  factory ChatDto.fromJson(
    Map<String, Object?> json,
  ) => _$ChatDtoFromJson(
    json,
  );

  Chat toDomain(UserData user) => Chat(
    chatId: chatId,
    user: user,
    lastMessage: lastMessage,
    lastMessageSent: lastMessageSent,
    participants: participants,
    createdAt: createdAt,
  );

  factory ChatDto.fromDomain(
    Chat chat,
  ) => ChatDto(

    chatId: chat.chatId,
    lastMessageSent: chat.lastMessageSent,
    participants: chat.participants,
    createdAt: chat.createdAt,
  );
}
