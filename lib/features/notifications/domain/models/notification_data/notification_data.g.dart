// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchNotificationData _$MatchNotificationDataFromJson(
  Map<String, dynamic> json,
) => MatchNotificationData(
  matchId: json['matchId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$MatchNotificationDataToJson(
  MatchNotificationData instance,
) => <String, dynamic>{'matchId': instance.matchId, 'type': instance.$type};

ChatNotificationData _$ChatNotificationDataFromJson(
  Map<String, dynamic> json,
) => ChatNotificationData(
  chatId: json['chatId'] as String,
  sentUid: json['sentUid'] as String,
  senderAvatar: json['senderAvatar'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ChatNotificationDataToJson(
  ChatNotificationData instance,
) => <String, dynamic>{
  'chatId': instance.chatId,
  'sentUid': instance.sentUid,
  'senderAvatar': instance.senderAvatar,
  'type': instance.$type,
};
