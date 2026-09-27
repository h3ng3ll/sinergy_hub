import 'package:freezed_annotation/freezed_annotation.dart';

import '../liked_you/liked_you_item.dart';
import '../liked_you/liked_you_quota.dart';

part 'liked_you_pg_state.freezed.dart';

@freezed
sealed class LikedYouPgState with _$LikedYouPgState {
  const factory LikedYouPgState({
    @Default(20) int pageSize,
    @Default(true) bool hasMore,

    /// Opaque backend cursor. Deviation from `UserDataPgState` /
    /// `ChatPgState`'s `DocumentSnapshot? lastDocument`: this feed comes
    /// from a callable, not a Firestore query the client runs itself, so
    /// the cursor is whatever opaque string the server hands back.
    String? cursor,
    @Default(<LikedYouItem>[]) List<LikedYouItem> items,
    LikedYouQuota? quota,
    @Default(0) int totalCount,
  }) = _LikedYouPgState;
}
