// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMatch _$UserMatchFromJson(Map<String, dynamic> json) => _UserMatch(
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  status: $enumDecode(_$TinderCardStatusEnumMap, json['status']),
  time: DateTime.parse(json['time'] as String),
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$UserMatchToJson(_UserMatch instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': _$TinderCardStatusEnumMap[instance.status]!,
      'time': instance.time.toIso8601String(),
      'icon': instance.icon,
    };

const _$TinderCardStatusEnumMap = {
  TinderCardStatus.none: 'none',
  TinderCardStatus.liked: 'liked',
  TinderCardStatus.reject: 'reject',
};
