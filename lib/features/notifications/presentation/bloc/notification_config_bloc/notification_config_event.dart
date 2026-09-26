part of 'notification_config_bloc.dart';

@freezed
class NotificationConfigEvent with _$NotificationConfigEvent {
  const factory NotificationConfigEvent.init() = _Init;

  const factory NotificationConfigEvent.save({
    bool? isEnabledNotifications,
  }) = _Save;

  /// FCM rotated the device token while the app was running — re-register
  /// it with the backend so pushes don't silently stop. Dispatched only
  /// from this bloc's own FirebaseMessagingService.onTokenRefresh
  /// subscription, never from the UI.
  const factory NotificationConfigEvent.tokenRefreshed({
    required String token,
  }) = _TokenRefreshed;
}
