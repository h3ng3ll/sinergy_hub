

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

/// `type` selects the variant. Types this app version does not know yet
/// (new backend notifications) parse as [UnknownNotificationData] instead of
/// throwing, so a new notification type can never crash the handler.
@Freezed(unionKey: 'type', fallbackUnion: 'unknown')
sealed class NotificationData with _$NotificationData {
  const factory NotificationData.match({
    required String matchId,
  }) = MatchNotificationData;

  const factory NotificationData.chat({
    required String chatId,
    required String sentUid,
    required String? senderAvatar,
  }) = ChatNotificationData;

  /// Sent after a successful purchase, e.g. `{type: premium, productId: yearly}`.
  const factory NotificationData.premium({
    String? productId,
  }) = PremiumNotificationData;

  const factory NotificationData.unknown() = UnknownNotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

