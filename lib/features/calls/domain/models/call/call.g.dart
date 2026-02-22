// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Call _$CallFromJson(Map<String, dynamic> json) => _Call(
  id: json['id'] as String? ?? '',
  callerId: json['callerId'] as String? ?? '',
  calleeId: json['calleeId'] as String? ?? '',
  status:
      $enumDecodeNullable(_$ECallStatusEnumMap, json['status']) ??
      ECallStatus.idle,
  offerSdp: json['offerSdp'] as String?,
  answerSdp: json['answerSdp'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$CallToJson(_Call instance) => <String, dynamic>{
  'id': instance.id,
  'callerId': instance.callerId,
  'calleeId': instance.calleeId,
  'status': _$ECallStatusEnumMap[instance.status]!,
  'offerSdp': instance.offerSdp,
  'answerSdp': instance.answerSdp,
  'createdAt': instance.createdAt.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
};

const _$ECallStatusEnumMap = {
  ECallStatus.idle: 'idle',
  ECallStatus.calling: 'calling',
  ECallStatus.loading: 'loading',
  ECallStatus.accepted: 'accepted',
  ECallStatus.ended: 'ended',
  ECallStatus.declined: 'declined',
};
