import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/exceptions.dart';
import '../liked_you_pg_state/liked_you_pg_state.dart';

part 'liked_you_feed_update.freezed.dart';

/// One event of the cache-first Liked you feed.
@freezed
sealed class LikedYouFeedUpdate with _$LikedYouFeedUpdate {
  /// The cached first page — emitted right away, then whenever a sync found
  /// a different frame and replaced it.
  const factory LikedYouFeedUpdate.page(LikedYouPgState page) =
      LikedYouFeedPage;

  /// A backend sync finished; the cache now matches the server.
  const factory LikedYouFeedUpdate.synced() = LikedYouFeedSynced;

  const factory LikedYouFeedUpdate.failed(Exceptions failure) =
      LikedYouFeedFailed;
}
