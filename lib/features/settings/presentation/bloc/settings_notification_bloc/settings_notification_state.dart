part of 'settings_notification_bloc.dart';

enum ESettingsNotificationStatus {
  initial,
  loading,
  ready,
  failed,
}

@freezed
sealed class SettingsNotificationState with _$SettingsNotificationState {
  const factory SettingsNotificationState({
    @Default(ESettingsNotificationStatus.initial)
    ESettingsNotificationStatus status,
    @Default(NotificationConfig()) NotificationConfig config,
    @Default(true) bool enabledNotifications,
    @Default('') String errorMessage,
  }) = _SettingsNotificationState;
}
