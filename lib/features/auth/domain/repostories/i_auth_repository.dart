import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/exceptions.dart';
import '../failures/auth_failures.dart';

abstract class IAuthRepository {
  Stream<User?> watchUser();

  Future<User?> getCurrentUser();

  Future<bool> isAuthorized();

  Future<UserCredential> signInAnonymously();

  Future<Either<UserCredential, Exceptions>> signInWithGoogle();

  Future<void> signOut();

  Future<void> deleteAccount();

  Future<Either<void, AuthFailure>> register({
    required String email,
    required String password,
  });

  Future<String> requireUserId();
}
