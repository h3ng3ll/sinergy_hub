import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data/user_data.dart';
import '../models/users_data_pg_state/users_data_pg_state.dart';

abstract class IUserRepository {
  Stream<User?> currentUserStream();

  Future<User?> currentUserFuture();

  Future<List<UserData>> getUsersById({
    required List<String> ids,
  });

  Future<List<UserData>> get({
    required UserDataPgState userDataState,
  });
}
