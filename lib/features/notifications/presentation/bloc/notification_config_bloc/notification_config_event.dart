part of 'notification_config_bloc.dart';

@freezed
class NotificationConfigEvent with _$NotificationConfigEvent {
  const factory NotificationConfigEvent.init() = _Init;

  const factory NotificationConfigEvent.save({
    bool? isEnabledNotifications,
  }) = _Save;
}
