import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/timestamp_convertor.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/chat_info/chat_info.dart';

part 'chat_dto.g.dart';

part 'chat_dto.freezed.dart';

@freezed
abstract class ChatDto with _$ChatDto {
  const ChatDto._();

  const factory ChatDto({
    @Default('') String chatId,
    @Default('') String lastMessage,
    @Default([]) List<String> typingUsers,
    @TimestampConverter() required DateTime lastMessageSent,
    @Default([]) List<String> searchKeywords,
    @Default(false) isArchived,
    @Default(false) isFavorite,
    @Default(false) hasRead,

    /// who access this chat
    required List<String> participants,
    @TimestampConverter() required DateTime createdAt,
  }) = _ChatDto;

  factory ChatDto.fromJson(
    Map<String, Object?> json,
  ) => _$ChatDtoFromJson(
    json,
  );

  Chat toDomain({
    required ChatInfo info,
  }) => Chat(
    chatId: chatId,
    lastMessage: lastMessage,
    lastMessageSent: lastMessageSent,
    participants: participants,
    createdAt: createdAt,
    typingUsers: typingUsers,
    info: info,
    isArchived: isArchived,
    isFavorite: isFavorite,
  );

  factory ChatDto.fromDomain(
    Chat chat,
  ) => ChatDto(
    chatId: chat.chatId,
    lastMessage: chat.lastMessage,
    typingUsers: chat.typingUsers,
    lastMessageSent: chat.lastMessageSent,
    participants: chat.participants,
    createdAt: chat.createdAt,
    isArchived: chat.isArchived,
    isFavorite: chat.isFavorite,
  );
}
