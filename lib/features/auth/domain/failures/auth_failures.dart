import '../../../../core/failures/failure.dart';

abstract class AuthFailure extends Failure {
  const AuthFailure({
    required String message,
  }) : super(
         message,
       );
}
