import '../../../../core/models/exceptions.dart';

class UserCanceledSignInException implements Exceptions {
  @override
  final String message;

  UserCanceledSignInException({
    this.message = 'Canceled',
  });
}
