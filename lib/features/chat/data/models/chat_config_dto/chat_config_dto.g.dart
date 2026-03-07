// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConfigDto _$ChatConfigDtoFromJson(Map<String, dynamic> json) =>
    _ChatConfigDto(
      chatId: json['chatId'] as String,
      archived: json['archived'] as bool? ?? false,
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatConfigDtoToJson(_ChatConfigDto instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'archived': instance.archived,
      'favorite': instance.favorite,
    };
