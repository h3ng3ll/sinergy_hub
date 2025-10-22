// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMatchDto _$UserMatchDtoFromJson(Map<String, dynamic> json) =>
    _UserMatchDto(
      userId: json['userId'] as String,
      matchStatus: $enumDecode(_$TinderCardStatusEnumMap, json['matchStatus']),
      completeness: $enumDecode(
        _$EUserMatchCompletenessEnumMap,
        json['completeness'],
      ),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$UserMatchDtoToJson(_UserMatchDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'matchStatus': _$TinderCardStatusEnumMap[instance.matchStatus]!,
      'completeness': _$EUserMatchCompletenessEnumMap[instance.completeness]!,
      'time': instance.time.toIso8601String(),
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
