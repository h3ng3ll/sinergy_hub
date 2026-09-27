import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/liked_you/liked_you_item.dart';
import '../../../domain/models/liked_you/liked_you_quota.dart';
import '../../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';

part 'liked_you_page_dto.freezed.dart';

part 'liked_you_page_dto.g.dart';

/// The `getLikedYou` callable response envelope.
@freezed
sealed class LikedYouPageDto with _$LikedYouPageDto {
  const LikedYouPageDto._();

  @JsonSerializable(anyMap: true)
  const factory LikedYouPageDto({
    @Default(<LikedYouItem>[]) List<LikedYouItem> items,
    String? nextCursor,
    required bool hasMore,
    @Default(0) int totalCount,
    LikedYouQuota? quota,
  }) = _LikedYouPageDto;

  factory LikedYouPageDto.fromJson(Map<String, dynamic> json) =>
      _$LikedYouPageDtoFromJson(json);

  LikedYouPgState toPgState(LikedYouPgState state) => state.copyWith(
    items: items,
    hasMore: hasMore,
    cursor: nextCursor,
    totalCount: totalCount,
    quota: quota,
  );
}
