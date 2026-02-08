part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.get() = _Get;

  const factory NotificationEvent.push({
    required Notification notification,
  }) = _Push;
}
