// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConfig _$ChatConfigFromJson(Map<String, dynamic> json) => _ChatConfig(
  archived: json['archived'] == null
      ? const []
      : _listFromJson(json['archived']),
  favorite: json['favorite'] == null
      ? const []
      : _listFromJson(json['favorite']),
);

Map<String, dynamic> _$ChatConfigToJson(_ChatConfig instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'favorite': instance.favorite,
    };
