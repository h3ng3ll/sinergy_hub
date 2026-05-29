part of 'settings_notification_bloc.dart';

@freezed
sealed class SettingsNotificationEvent with _$SettingsNotificationEvent {
  const factory SettingsNotificationEvent.load() = _Load;

  const factory SettingsNotificationEvent.toggle({
    required bool enabled,
  }) = _Toggle;
}
