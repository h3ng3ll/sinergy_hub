import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/chat_config/chat_config.dart';

part 'chat_config_dto.g.dart';

part 'chat_config_dto.freezed.dart';

@freezed
abstract class ChatConfigDto with _$ChatConfigDto {
  const ChatConfigDto._();

  const factory ChatConfigDto({

    @Default([]) List<String> archived,
    @Default([]) List<String> favorite,
  }) = _ChatConfigDto;

  factory ChatConfigDto.fromJson(
    Map<String, Object?> json,
  ) => _$ChatConfigDtoFromJson(
    json,
  );

  ChatConfig toDomain(
    String uid,
  ) => ChatConfig(
    archived: archived.contains(
      uid,
    ),
    favorite: favorite.contains(
      uid,
    ),
  );

}
