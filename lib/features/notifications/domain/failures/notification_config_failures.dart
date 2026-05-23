import '../../../../core/models/failures.dart';

abstract class NotificationConfigFailure extends Failure {
  const NotificationConfigFailure({
    required String message,
  }) : super(message);
}
