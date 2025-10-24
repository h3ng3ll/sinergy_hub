// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) => _ChatDto(
  chatId: json['chatId'] as String? ?? '',
  lastMessage: json['lastMessage'] as String? ?? '',
  lastMessageSent: DateTime.parse(json['lastMessageSent'] as String),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ChatDtoToJson(_ChatDto instance) => <String, dynamic>{
  'chatId': instance.chatId,
  'lastMessage': instance.lastMessage,
  'lastMessageSent': instance.lastMessageSent.toIso8601String(),
  'participants': instance.participants,
  'createdAt': instance.createdAt.toIso8601String(),
};
