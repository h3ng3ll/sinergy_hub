import '../../../../core/models/exceptions.dart';

class FailedSignWithGoogle implements Exceptions {
  @override
  final String message;

  FailedSignWithGoogle({
    this.message = 'Failed sign in with google. Try again',
  });
}
