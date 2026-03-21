// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParticipantsInfo _$ParticipantsInfoFromJson(Map<String, dynamic> json) =>
    _ParticipantsInfo(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String?,
      specialization: json['specialization'] as String? ?? '',
    );

Map<String, dynamic> _$ParticipantsInfoToJson(_ParticipantsInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'specialization': instance.specialization,
    };
