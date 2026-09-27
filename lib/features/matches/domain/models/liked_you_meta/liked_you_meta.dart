import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/timestamp_convertor.dart';

part 'liked_you_meta.freezed.dart';

part 'liked_you_meta.g.dart';

/// Mirrors the backend-owned `likedYouMeta/{uid}` signal document. It carries
/// no feed data; a change only tells the client to re-fetch the first page.
@freezed
sealed class LikedYouMeta with _$LikedYouMeta {
  const factory LikedYouMeta({
    @Default(0) int pendingCount,
    @TimestampConverter() required DateTime updatedAt,
  }) = _LikedYouMeta;

  factory LikedYouMeta.fromJson(Map<String, dynamic> json) =>
      _$LikedYouMetaFromJson(json);
}
