// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConfig _$ChatConfigFromJson(Map<String, dynamic> json) => _ChatConfig(
  archived:
      (json['archived'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  favorite:
      (json['favorite'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$ChatConfigToJson(_ChatConfig instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'favorite': instance.favorite,
    };
