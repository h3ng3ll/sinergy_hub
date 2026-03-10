// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Matches _$MatchesFromJson(Map<String, dynamic> json) => _Matches(
  matchId: json['matchId'] as String,
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  matchStatus: $enumDecode(_$TinderCardStatusEnumMap, json['matchStatus']),
  completeness:
      $enumDecodeNullable(
        _$EMatchesCompletenessEnumMap,
        json['completeness'],
      ) ??
      EMatchesCompleteness.none,
  time: DateTime.parse(json['time'] as String),
  align: (json['align'] as num?)?.toInt(),
  experienceScore: (json['experienceScore'] as num?)?.toInt(),
  skillsMatch: (json['skillsMatch'] as num?)?.toInt(),
  visionScore: (json['visionScore'] as num?)?.toInt(),
);

Map<String, dynamic> _$MatchesToJson(_Matches instance) => <String, dynamic>{
  'matchId': instance.matchId,
  'user': instance.user.toJson(),
  'matchStatus': _$TinderCardStatusEnumMap[instance.matchStatus]!,
  'completeness': _$EMatchesCompletenessEnumMap[instance.completeness]!,
  'time': instance.time.toIso8601String(),
  'align': instance.align,
  'experienceScore': instance.experienceScore,
  'skillsMatch': instance.skillsMatch,
  'visionScore': instance.visionScore,
};

const _$TinderCardStatusEnumMap = {
  TinderCardStatus.none: 'none',
  TinderCardStatus.liked: 'liked',
  TinderCardStatus.reject: 'reject',
};

const _$EMatchesCompletenessEnumMap = {
  EMatchesCompleteness.none: 'none',
  EMatchesCompleteness.twoWayMatch: 'twoWayMatch',
  EMatchesCompleteness.oneWayMatch: 'oneWayMatch',
};
