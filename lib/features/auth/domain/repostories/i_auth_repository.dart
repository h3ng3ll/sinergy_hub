import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/failures/failure.dart';
import '../failures/auth_failures.dart';
import '../models/apple_sign_in_result/apple_sign_in_result.dart';

abstract class IAuthRepository {
  Stream<User?> watchUser();

  Future<User?> getCurrentUser();

  Future<bool> isAuthorized();

  Future<UserCredential> signInAnonymously();

  Future<Either<void, Exceptions>> signInWithGoogle();
  Future<Either<AppleSignInResult, Failure>> signInWithApple();

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

  Future<bool> isEmailVerified();

  Future<Either<void, AuthFailure>> sendPasswordResetEmail({
    required String email,
  });
}
