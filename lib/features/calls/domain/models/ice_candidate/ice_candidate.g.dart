// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IceCandidate _$IceCandidateFromJson(Map<String, dynamic> json) =>
    _IceCandidate(
      candidate: json['candidate'] as String,
      sdpMid: json['sdpMid'] as String?,
      sdpMineIndex: (json['sdpMineIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IceCandidateToJson(_IceCandidate instance) =>
    <String, dynamic>{
      'candidate': instance.candidate,
      'sdpMid': instance.sdpMid,
      'sdpMineIndex': instance.sdpMineIndex,
    };
