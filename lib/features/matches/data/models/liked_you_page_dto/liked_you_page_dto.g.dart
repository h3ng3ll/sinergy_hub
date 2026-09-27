// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_you_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikedYouPageDto _$LikedYouPageDtoFromJson(Map json) => _LikedYouPageDto(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => LikedYouItem.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList() ??
      const <LikedYouItem>[],
  nextCursor: json['nextCursor'] as String?,
  hasMore: json['hasMore'] as bool,
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  quota: json['quota'] == null
      ? null
      : LikedYouQuota.fromJson(Map<String, dynamic>.from(json['quota'] as Map)),
);

Map<String, dynamic> _$LikedYouPageDtoToJson(_LikedYouPageDto instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'nextCursor': instance.nextCursor,
      'hasMore': instance.hasMore,
      'totalCount': instance.totalCount,
      'quota': instance.quota?.toJson(),
    };
