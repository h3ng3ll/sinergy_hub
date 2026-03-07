// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConfig _$ChatConfigFromJson(Map<String, dynamic> json) => _ChatConfig(
  chatId: json['chatId'] as String,
  archived: json['archived'] as bool? ?? false,
  favorite: json['favorite'] as bool? ?? false,
);

Map<String, dynamic> _$ChatConfigToJson(_ChatConfig instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'archived': instance.archived,
      'favorite': instance.favorite,
    };
