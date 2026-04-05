import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/timestamp_convertor.dart';
import '../../../domain/models/chat_message/chat_message.dart';

part 'chat_message_dto.g.dart';

part 'chat_message_dto.freezed.dart';

@freezed
abstract class ChatMessageDto with _$ChatMessageDto {
  const ChatMessageDto._();

  const factory ChatMessageDto({
    @Default('') String id,
    @Default('') String message,
    @Default('') String sentUid,
    @Default([]) List<String> readStatus,
    @TimestampConverter() required DateTime createdAt,
  }) = _ChatMessageDto;

  factory ChatMessageDto.fromJson(
    Map<String, Object?> json,
  ) => _$ChatMessageDtoFromJson(json);

  ChatMessage toDomain({
    required String uid,
  }) => ChatMessage(
    id: id,
    createdAt: createdAt,
    message: message,
    sentUid: sentUid,
    hasRead: readStatus.contains(
      uid,
    ),
  );

  factory ChatMessageDto.fromDomain({
    required ChatMessage message,
    required String uid,
  }) => ChatMessageDto(
    id: message.id,
    createdAt: message.createdAt,
    message: message.message,
    sentUid: message.sentUid,
    readStatus: message.hasRead ? [uid] : [],
  );
}
