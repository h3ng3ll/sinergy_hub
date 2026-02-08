part of 'notification_bloc.dart';

enum NotificationStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<Notification> notifications,
    @Default(NotificationStatus.initial) NotificationStatus status,
    @Default('') String errorMessage,
  }) = _NotificationState;
}
