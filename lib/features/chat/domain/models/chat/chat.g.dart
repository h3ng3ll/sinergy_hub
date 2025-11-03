// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
  chatId: json['chatId'] as String? ?? '',
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  lastMessage: json['lastMessage'] as String? ?? '',
  lastMessageSent: DateTime.parse(json['lastMessageSent'] as String),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
  'chatId': instance.chatId,
  'user': instance.user.toJson(),
  'lastMessage': instance.lastMessage,
  'lastMessageSent': instance.lastMessageSent.toIso8601String(),
  'participants': instance.participants,
  'createdAt': instance.createdAt.toIso8601String(),
  'icon': instance.icon,
};
