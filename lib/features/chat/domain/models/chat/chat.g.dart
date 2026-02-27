// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
  chatId: json['chatId'] as String? ?? '',
  info: ChatInfo.fromJson(json['info'] as Map<String, dynamic>),
  lastMessage: json['lastMessage'] as String? ?? '',
  lastMessageSent: DateTime.parse(json['lastMessageSent'] as String),
  typingUsers:
      (json['typingUsers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  hasRead: json['hasRead'] as bool? ?? false,
  isArchived: json['isArchived'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
  'chatId': instance.chatId,
  'info': instance.info.toJson(),
  'lastMessage': instance.lastMessage,
  'lastMessageSent': instance.lastMessageSent.toIso8601String(),
  'typingUsers': instance.typingUsers,
  'participants': instance.participants,
  'hasRead': instance.hasRead,
  'isArchived': instance.isArchived,
  'isFavorite': instance.isFavorite,
  'createdAt': instance.createdAt.toIso8601String(),
  'icon': instance.icon,
};
