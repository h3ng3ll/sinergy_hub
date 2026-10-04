import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/liked_you/liked_you_item.dart';
import '../../../domain/models/liked_you/liked_you_quota.dart';
import '../../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';

part 'liked_you_cache.freezed.dart';

/// Locally cached first page of one signed-in user's Liked you feed.
@freezed
sealed class LikedYouCache with _$LikedYouCache {
  const LikedYouCache._();

  const factory LikedYouCache({
    @Default(<LikedYouItem>[]) List<LikedYouItem> items,
    String? nextCursor,
    @Default(true) bool hasMore,
    @Default(0) int totalCount,
    LikedYouQuota? quota,
  }) = _LikedYouCache;

  factory LikedYouCache.fromPgState(LikedYouPgState page) => LikedYouCache(
    items: page.items,
    nextCursor: page.cursor,
    hasMore: page.hasMore,
    totalCount: page.totalCount,
    quota: page.quota,
  );

  LikedYouPgState toPgState() => LikedYouPgState(
    items: items,
    cursor: nextCursor,
    hasMore: hasMore,
    totalCount: totalCount,
    quota: quota,
  );
}
