// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: json['id'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      deviceToken: json['deviceToken'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      hasRead: json['hasRead'] as bool? ?? false,
      createdAt: const TimestampConverter().fromJson(
        json['createdAt'] as Timestamp,
      ),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'deviceToken': instance.deviceToken,
      'title': instance.title,
      'description': instance.description,
      'hasRead': instance.hasRead,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
