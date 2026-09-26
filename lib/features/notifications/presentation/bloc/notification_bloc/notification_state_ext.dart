part of 'notification_bloc.dart';

extension NotificationStateX on NotificationState {
  bool get isInitial => status == NotificationStatus.initial;

  bool get isLoading => status == NotificationStatus.loading;

  bool get isFailed => status == NotificationStatus.failed;
}
