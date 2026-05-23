// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationConfig _$NotificationConfigFromJson(Map<String, dynamic> json) =>
    _NotificationConfig(
      fcmTokens:
          (json['fcmTokens'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
      enabledNotifications: json['enabledNotifications'] as bool? ?? true,
    );

Map<String, dynamic> _$NotificationConfigToJson(_NotificationConfig instance) =>
    <String, dynamic>{
      'fcmTokens': instance.fcmTokens,
      'enabledNotifications': instance.enabledNotifications,
    };
