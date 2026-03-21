// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConfigDto _$ChatConfigDtoFromJson(
  Map<String, dynamic> json,
) => _ChatConfigDto(
  archived:
      (json['archived'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  favorite:
      (json['favorite'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$ChatConfigDtoToJson(_ChatConfigDto instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'favorite': instance.favorite,
    };
