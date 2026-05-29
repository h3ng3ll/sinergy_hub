import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/models/exceptions.dart';
import '../../../../../core/models/failures.dart';
import '../../../../../core/services/crypto_service.dart';
import '../../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../../../core/utils/env/env.dart';
import '../../../domain/exception/failed_sign_with_google.dart';
import '../../../domain/exception/max_tries_exceeded_exception.dart';
import '../../../domain/exception/user_canceled_sign_in_exception.dart';
import '../../../domain/failures/apple_no_support_platform_failure.dart';
import '../../../domain/failures/auth_failures.dart';
import '../../../domain/failures/auth_unreachable_failure.dart';
import '../../../domain/failures/failed_sign_in_with_apple.dart';
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
  final CryptoService _cryptoService;

  final Env _env;

  FirebaseAuthRepository({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestoreService firebaseFirestoreService,
    required GoogleSignInService googleSignInService,
    required Env env,
    required CryptoService cryptoService,
  }) : _auth = auth,
       _googleSignInService = googleSignInService,
       _env = env,
       _googleSignIn = googleSignIn,
       _cryptoService = cryptoService {
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
      final clientId = _env.serverClientId();
      await _googleSignIn.initialize(
        serverClientId: clientId,
      );
      final GoogleSignInAccount res = await _googleSignIn.authenticate();

      return await _signInWithCredentials(
        res.authentication.idToken!,
      );
    } on GoogleSignInException catch (e) {
      /// Process carefully
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Right(UserCanceledSignInException());
      }
      return Right(FailedSignWithGoogle());
    } catch (e) {
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
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
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
      return Right(
        SomethingWentWrongSignInFailure(),
      );
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
  Future<bool> isEmailVerified() async {
    return _auth.currentUser?.emailVerified ?? false;
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

  @override
  Future<Either<void, AuthFailure>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
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

  /// Entry point for Apple Sign-In.
  /// Chooses flow based on platform.
  @override
  Future<Either<UserCredential?, Failure>> signInWithApple() async {
    if (Platform.isAndroid) {
      final res = await _androidCall();
      return Left(
        res,
      );
    } else if (Platform.isIOS) {
      return await _iosCall();
    } else {
      return Right(
        AppleNoSupportPlatformFailure(),
      );
    }
  }

  // =========================
  // ANDROID (Firebase Web OAuth)
  // =========================
  Future<UserCredential?> _androidCall() async {
    try {
      final provider =
          OAuthProvider(
              'apple.com',
            )
            ..addScope('email')
            ..addScope('name');

      return await _auth.signInWithProvider(
        provider,
      );
    } catch (e) {
      throw Exception('Android Apple Sign-In failed: $e');
    }
  }

  // =====================
  // iOS (Native Apple API)
  // =====================
  Future<Either<UserCredential, Failure>> _iosCall() async {
    try {
      // Generate secure nonce
      final rawNonce = _cryptoService.generateNonce();
      final hashedNonce = _cryptoService.sha256ofString(
        rawNonce,
      );

      // Request Apple credential
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        // nonce: hashedNonce,
      );
      final oauthCredentials =
          OAuthProvider(
            'apple.com',
          ).credential(
            idToken: credential.identityToken,
            accessToken: credential.authorizationCode,
          );
      // Convert Apple credential to Firebase credential
      // final oauthCredential =
      //     OAuthProvider(
      //       'apple.com',
      //     ).credential(
      //       idToken: credential.identityToken,
      //       rawNonce: rawNonce,
      //     );

      final res = await _auth.signInWithCredential(
        oauthCredentials,
      );
      return Left(
        res,
      );
    } catch (e) {
      return Right(
        FailedSignInWithApple(),
      );
    }
  }
}
