// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatPayload _$ChatPayloadFromJson(Map<String, dynamic> json) => _ChatPayload(
  type: json['type'] as String? ?? '',
  chatId: json['chatId'] as String? ?? '',
  sentUid: json['sentUid'] as String? ?? '',
);

Map<String, dynamic> _$ChatPayloadToJson(_ChatPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'chatId': instance.chatId,
      'sentUid': instance.sentUid,
    };
