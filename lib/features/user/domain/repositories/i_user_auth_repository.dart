
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data/user_data.dart';

abstract class IUserAuthRepository {
  Future<User?> currentUserFuture();
  Stream<User?> currentUserStream();
  // Future<UserData?> currentUserDataFuture();
}