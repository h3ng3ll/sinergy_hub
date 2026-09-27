// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_you_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikedYouMeta _$LikedYouMetaFromJson(Map<String, dynamic> json) =>
    _LikedYouMeta(
      pendingCount: (json['pendingCount'] as num?)?.toInt() ?? 0,
      updatedAt: const TimestampConverter().fromJson(
        json['updatedAt'] as Timestamp?,
      ),
    );

Map<String, dynamic> _$LikedYouMetaToJson(_LikedYouMeta instance) =>
    <String, dynamic>{
      'pendingCount': instance.pendingCount,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
