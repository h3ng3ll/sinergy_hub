import '../../../../core/failures/failure.dart';

abstract class NotificationConfigFailure extends Failure {
  const NotificationConfigFailure({
    required String message,
  }) : super(message);
}
