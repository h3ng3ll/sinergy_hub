// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  message: json['message'] as String? ?? '',
  sentUid: json['sentUid'] as String? ?? '',
  createdAt: DateTime.parse(json['createdAt'] as String),
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'user': instance.user,
      'message': instance.message,
      'sentUid': instance.sentUid,
      'createdAt': instance.createdAt.toIso8601String(),
      'icon': instance.icon,
    };
