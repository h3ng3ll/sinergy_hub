// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchesDto _$MatchesDtoFromJson(Map<String, dynamic> json) => _MatchesDto(
  answeredUids: (json['answeredUids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  completeness: $enumDecode(
    _$EMatchesCompletenessEnumMap,
    json['completeness'],
  ),
  experienceScore: (json['experienceScore'] as num?)?.toInt() ?? 0,
  matchId: json['matchId'] as String,
  matchStatus: $enumDecode(_$TinderCardStatusEnumMap, json['matchStatus']),
  skillsMatch: json['skillsMatch'] ?? 0,
  skillsScore: (json['skillsScore'] as num?)?.toInt() ?? 0,
  time: const TimestampConverter().fromJson(json['time'] as Timestamp?),
  users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
  visionScore: (json['visionScore'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MatchesDtoToJson(_MatchesDto instance) =>
    <String, dynamic>{
      'answeredUids': instance.answeredUids,
      'completeness': _$EMatchesCompletenessEnumMap[instance.completeness]!,
      'experienceScore': instance.experienceScore,
      'matchId': instance.matchId,
      'matchStatus': _$TinderCardStatusEnumMap[instance.matchStatus]!,
      'skillsMatch': instance.skillsMatch,
      'skillsScore': instance.skillsScore,
      'time': const TimestampConverter().toJson(instance.time),
      'users': instance.users,
      'visionScore': instance.visionScore,
    };

const _$EMatchesCompletenessEnumMap = {
  EMatchesCompleteness.none: 'none',
  EMatchesCompleteness.twoWayMatch: 'twoWayMatch',
  EMatchesCompleteness.oneWayMatch: 'oneWayMatch',
};

const _$TinderCardStatusEnumMap = {
  TinderCardStatus.none: 'none',
  TinderCardStatus.liked: 'liked',
  TinderCardStatus.reject: 'reject',
};
