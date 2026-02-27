import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';
import '../models/user_data/user_data.dart';
import '../models/users_data_pg_state/users_data_pg_state.dart';

abstract class IUserRepository {
  Stream<User?> currentUserStream();

  Stream<UserData?> userDataStream(
    String uid,
  );

  Future<User?> currentUserFuture();

  Future<List<UserData>> getUsersById({
    required List<String> ids,
  });

  Future<UserData?> getUserById({
    required String id,
  });

  Future<List<UserData>> get({
    required UserDataPgState userDataState,
  });

  Future<void> setUserProfiler({
    required String uid,
    required UserProfiler userProfiler,
  });

  Future<void> update({
    required UserData userData,
  });

  Future<String> updateAvatar({
    required String uid,
    required Uint8List avatar,
  });

  Future<void> deleteAvatar({
    required String uid,
    required String name,
  });
}
