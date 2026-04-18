import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/exceptions.dart';
import '../../../user/domain/models/user_data/user_data.dart';
import '../failures/auth_failures.dart';

abstract class IAuthRepository {
  Stream<User?> watchUser();

  Future<User?> getCurrentUser();

  Future<bool> isAuthorized();

  Future<UserCredential> signInAnonymously();

  Future<Either<void, Exceptions>> signInWithGoogle();

  Future<void> signOut();

  Future<void> deleteAccount();

  Future<Either<void, AuthFailure>> register({
    required String email,
    required String password,
  });

  Future<Either<void, AuthFailure>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String> requireUserId();

  Future<Either<void, AuthFailure>> sendEmailVerification();

  Future<Either<void, AuthFailure>> reload();

  Future<Either<void, AuthFailure>> sendPasswordResetEmail({
    required String email,
  });
}
