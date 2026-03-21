// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
  chatId: json['chatId'] as String? ?? '',
  lastMessage: json['lastMessage'] as String? ?? '',
  lastMessageSent: const TimestampConverter().fromJson(
    json['lastMessageSent'] as Timestamp,
  ),
  config: ChatConfig.fromJson(json['config'] as Map<String, dynamic>),
  typingUsers:
      (json['typingUsers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  participantInfo:
      (json['participantInfo'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ParticipantInfo.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  icon: json['icon'] as String? ?? '',
  searchKeywords:
      (json['searchKeywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
  'chatId': instance.chatId,
  'lastMessage': instance.lastMessage,
  'lastMessageSent': const TimestampConverter().toJson(
    instance.lastMessageSent,
  ),
  'config': instance.config.toJson(),
  'typingUsers': instance.typingUsers,
  'participantInfo': instance.participantInfo.map(
    (k, e) => MapEntry(k, e.toJson()),
  ),
  'participants': instance.participants,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'icon': instance.icon,
  'searchKeywords': instance.searchKeywords,
};
