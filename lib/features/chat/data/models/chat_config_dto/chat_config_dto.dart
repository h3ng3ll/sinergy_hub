import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat_config/chat_config.dart';

part 'chat_config_dto.g.dart';

part 'chat_config_dto.freezed.dart';

@freezed
abstract class ChatConfigDto with _$ChatConfigDto {
  const ChatConfigDto._();

  const factory ChatConfigDto({
    required String chatId,
    @Default(false) bool archived,
    @Default(false) bool favorite,
  }) = _ChatConfigDto;

  factory ChatConfigDto.fromJson(
    Map<String, Object?> json,
  ) => _$ChatConfigDtoFromJson(
    json,
  );

  ChatConfig toDomain() => ChatConfig(
    chatId: chatId,
    archived: archived,
    favorite: favorite,
  );

  factory ChatConfigDto.fromDomain(
    ChatConfig chatConfig,
  ) => ChatConfigDto(
    chatId: chatConfig.chatId,
    archived: chatConfig.archived,
    favorite: chatConfig.favorite,
  );
}