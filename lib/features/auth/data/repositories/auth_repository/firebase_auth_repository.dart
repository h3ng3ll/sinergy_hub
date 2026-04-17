import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/models/exceptions.dart';
import '../../../../../core/models/failures.dart';
import '../../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../domain/exception/failed_sign_with_google.dart';
import '../../../domain/exception/max_tries_exceeded_exception.dart';
import '../../../domain/exception/user_canceled_sign_in_exception.dart';
import '../../../domain/failures/auth_failures.dart';
import '../../../domain/failures/auth_unreachable_failure.dart';
import '../../../domain/failures/login_or_password_incorrect_failure.dart';
import '../../../domain/failures/something_went_wrong_sign_in_failure.dart';
import '../../../domain/failures/such_user_not_exists_failure.dart';
import '../../../domain/failures/unauthorized_failure.dart';
import '../../../domain/failures/user_exists_with_such_email_failure.dart';
import '../../../domain/repostories/i_auth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository {
  // final FirebaseAuthService _firebaseAuthService;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final GoogleSignInService _googleSignInService;

  FirebaseAuthRepository({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestoreService firebaseFirestoreService,
    required GoogleSignInService googleSignInService,
  }) : _auth = auth,
       _googleSignInService = googleSignInService,
       _googleSignIn = googleSignIn {
    if (kIsWeb) {
      _initSignInEvents();
    }
  }

  @override
  Stream<User?> watchUser() => Rx.merge([
    _auth.userChanges(),
    _auth.authStateChanges(),
    _auth.idTokenChanges(),
  ]);

  @override
  Future<bool> isAuthorized() => Future.value(
    _auth.currentUser != null,
  );

  @override
  Future<User?> getCurrentUser() async => _auth.currentUser;

  @override
  Future<UserCredential> signInAnonymously() => _auth.signInAnonymously();

  void _initSignInEvents() {
    _googleSignInService.authToken.addListener(
      () {
        final token = _googleSignInService.authToken.value;
        if (token != null) {
          _signInWithCredentials(
            token,
          );
        }
      },
    );
  }

  Future<Either<UserCredential, Exceptions>> _signInWithCredentials(
    String idToken,
  ) async {
    try {
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
      );

      // Retry logic for transient network errors
      const maxRetries = 3;
      int attempts = 0;

      while (attempts < maxRetries) {
        try {
          final authRes = await _auth.signInWithCredential(
            credential,
          );

          return Left(authRes);
        } on FirebaseAuthException catch (e) {
          attempts++;
          // Retry only on network-related errors
          if (attempts >= maxRetries ||
              !(e.code == 'unknown' ||
                  e.message?.contains('I/O error') == true ||
                  e.message?.contains('Connection reset') == true)) {
            rethrow;
          }
          // Wait before retrying (exponential backoff)
          await Future.delayed(Duration(milliseconds: 500 * attempts));
        }
      }
      return Right(
        MaxTriesExceededException(),
      );
    } catch (_) {
      return Right(
        FailedSignWithGoogle(),
      );
    }
  }

  @override
  Future<Either<UserCredential, Exceptions>> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
        serverClientId: dotenv.get('FIREBASE_WEB_API_KEY'),
      );
      final GoogleSignInAccount res = await _googleSignIn.authenticate();

      return await _signInWithCredentials(
        res.authentication.idToken!,
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Right(UserCanceledSignInException());
      }
      return Right(FailedSignWithGoogle());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignInService.signOut();
    await _auth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }

  @override
  Future<Either<void, AuthFailure>> register({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Left(
        null,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown') {
        return Right(AuthUnreachableFailure());
      } else if (e.code == 'email-already-in-use') {
        return Right(UserExistsWithSuchEmailFailure());
      }
      rethrow;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<void, AuthFailure>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Left(
        null,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return Right(
          LoginOrPasswordIncorrectFailure(),
        );
      } else if (e.code == 'user-not-found') {
        return Right(
          SuchUserNotExistsFailure(),
        );
      }
      rethrow;
    } catch (_) {
      return Right(
        SomethingWentWrongSignInFailure(),
      );
    }
  }

  @override
  Future<String> requireUserId() async {
    final user = await getCurrentUser();
    final uid = user?.uid;

    if (uid == null) {
      throw UnauthorizedFailure();
    }

    return uid;
  }

  @override
  Future<Either<void, AuthFailure>> sendEmailVerification() async {
    try {
      final user = await getCurrentUser();
      final uid = user?.uid;

      if (uid == null) {
        throw UnauthorizedFailure();
      }

      await user!.sendEmailVerification();
      return Left(
        null,
      );
    } catch (e) {
      return Right(
        AuthUnreachableFailure(),
      );
    }
  }

  @override
  Future<Either<void, AuthFailure>> reload() async {
    try {
      await _auth.currentUser?.reload();
      return Left(
        null,
      );
    } catch (e) {
      return Right(
        AuthUnreachableFailure(),
      );
    }
  }
}
