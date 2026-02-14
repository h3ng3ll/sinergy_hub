part of 'notification_config_bloc.dart';

enum NotificationConfigStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class NotificationConfigState with _$NotificationConfigState {
  const factory NotificationConfigState({
    @Default(NotificationConfig()) NotificationConfig config,
    @Default(NotificationConfigStatus.initial) NotificationConfigStatus status,
    @Default('') String errorMessage,
  }) = _NotificationConfigState;
}
