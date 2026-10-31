part of 'settings_notification_bloc.dart';

extension SettingsNotificationStateX on SettingsNotificationState {
  bool get isInitial => status == ESettingsNotificationStatus.initial;

  bool get isLoading => status == ESettingsNotificationStatus.loading;

  bool get isSaving => status == ESettingsNotificationStatus.saving;

  bool get isReady => status == ESettingsNotificationStatus.ready;

  bool get isFailed => status == ESettingsNotificationStatus.failed;
}
