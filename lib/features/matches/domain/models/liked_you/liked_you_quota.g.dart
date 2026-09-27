// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_you_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikedYouQuota _$LikedYouQuotaFromJson(Map json) => _LikedYouQuota(
  period:
      $enumDecodeNullable(
        _$ELikedYouQuotaPeriodEnumMap,
        json['period'],
        unknownValue: ELikedYouQuotaPeriod.weekly,
      ) ??
      ELikedYouQuotaPeriod.weekly,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  used: (json['used'] as num?)?.toInt() ?? 0,
  remaining: (json['remaining'] as num?)?.toInt() ?? 0,
  resetsAt: json['resetsAt'] == null
      ? null
      : DateTime.parse(json['resetsAt'] as String),
  isUnlimited: json['isUnlimited'] as bool? ?? false,
);

Map<String, dynamic> _$LikedYouQuotaToJson(_LikedYouQuota instance) =>
    <String, dynamic>{
      'period': _$ELikedYouQuotaPeriodEnumMap[instance.period]!,
      'limit': instance.limit,
      'used': instance.used,
      'remaining': instance.remaining,
      'resetsAt': instance.resetsAt?.toIso8601String(),
      'isUnlimited': instance.isUnlimited,
    };

const _$ELikedYouQuotaPeriodEnumMap = {
  ELikedYouQuotaPeriod.daily: 'daily',
  ELikedYouQuotaPeriod.weekly: 'weekly',
};
