// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMatch _$UserMatchFromJson(Map<String, dynamic> json) => _UserMatch(
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  matchStatus: $enumDecode(_$TinderCardStatusEnumMap, json['matchStatus']),
  completeness:
      $enumDecodeNullable(
        _$EUserMatchCompletenessEnumMap,
        json['completeness'],
      ) ??
      EUserMatchCompleteness.none,
  time: DateTime.parse(json['time'] as String),
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$UserMatchToJson(_UserMatch instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'matchStatus': _$TinderCardStatusEnumMap[instance.matchStatus]!,
      'completeness': _$EUserMatchCompletenessEnumMap[instance.completeness]!,
      'time': instance.time.toIso8601String(),
      'icon': instance.icon,
    };

const _$TinderCardStatusEnumMap = {
  TinderCardStatus.none: 'none',
  TinderCardStatus.liked: 'liked',
  TinderCardStatus.reject: 'reject',
};

const _$EUserMatchCompletenessEnumMap = {
  EUserMatchCompleteness.oneWayMatch: 'oneWayMatch',
  EUserMatchCompleteness.twoWayMatch: 'twoWayMatch',
  EUserMatchCompleteness.none: 'none',
};
