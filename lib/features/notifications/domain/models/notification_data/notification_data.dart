

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

@Freezed(unionKey: 'type')
sealed class NotificationData with _$NotificationData {
  const factory NotificationData.match({
    required String matchId,
  }) = MatchNotificationData;

  const factory NotificationData.chat({
    required String chatId,
    required String sentUid,
    required String? senderAvatar,
  }) = ChatNotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

