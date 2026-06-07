

import '../../../../core/failures/failure.dart';

class MessageNotSentFailure implements Failure{
  @override
  String get message => 'Failed to sent message . Try again';
}