import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/models/exceptions.dart';
import '../../../../../core/failures/failure.dart';
import '../../../../../core/services/crypto_service.dart';
import '../../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../../../core/services/logger_service.dart';
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
import '../../../domain/models/apple_sign_in_result/apple_sign_in_result.dart';
import '../../../domain/repostories/i_auth_repository.dart';
import '../../models/apple_credentials/apple_credentials.dart';

class FirebaseAuthRepository extends IAuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final GoogleSignInService _googleSignInService;
  final CryptoService _cryptoService;
  final FirebaseFunctionsService _firebaseFunctionsService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final LoggerService _loggerService;
  final Env _env;

  FirebaseAuthRepository({
    required this._loggerService,
    required this._auth,
    required this._googleSignIn,
    required this._firebaseFirestoreService,
    required this._googleSignInService,
    required this._env,
    required this._cryptoService,
    required this._firebaseFunctionsService,
  }) {
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
    } catch (e) {
      _loggerService.error(
        'Failed sign with google',
        error: e,
      );
      return Right(
        FailedSignWithGoogle(
          message: e.toString(),
        ),
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
      _loggerService.error(
        'Failed sign in ${e.toString()}',
        error: e,
      );
      return Right(
        FailedSignWithGoogle(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> signOut() async {
    await _signOutGoogleSafely();
    await _auth.signOut();
  }

  /// Google revoke is best-effort: it throws on iOS when the session was not
  /// created by Google (e.g. Apple sign-in), and must never block Firebase
  /// sign-out.
  Future<void> _signOutGoogleSafely() async {
    try {
      await _googleSignInService.signOut();
    } catch (e) {
      debugPrint('Google sign-out skipped: $e');
    }
  }

  @override
  Future<void> deleteAccount() async {
    await _firebaseFunctionsService.call(
      functionName: 'deleteAccount',
    );
    // Revoke the local session so watchUser() emits null →
    // AuthBloc → logout → GoRouter redirects to the auth page.
    await _signOutGoogleSafely();
    await _auth.signOut();
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
    } on FirebaseException catch (_) {
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
  ///
  /// Returns the Firebase credential alongside the [AppleCredentials] Apple
  /// provided (name/email — first authorization only). The repository does NOT
  /// persist them; the use case decides what to cache.
  @override
  Future<Either<AppleSignInResult, Failure>> signInWithApple() async {
    if (Platform.isAndroid) {
      final res = await _androidCall();
      return res;
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
  Future<Either<AppleSignInResult, AuthFailure>> _androidCall() async {
    try {
      final provider =
          OAuthProvider(
              'apple.com',
            )
            ..addScope('email')
            ..addScope('name');

      final res = await _auth.signInWithProvider(
        provider,
      );

      // On first sign-in the display name arrives on the Firebase user.
      final parts = res.user?.displayName?.trim().split(
        ' ',
      );
      return Left(
        AppleSignInResult(
          userCredential: res,
          credentials: AppleCredentials(
            firstName: parts != null && parts.isNotEmpty ? parts.first : null,
            lastName: parts != null && parts.length > 1
                ? parts.sublist(1).join(' ')
                : null,
            email: res.user?.email,
          ),
        ),
      );
    } catch (e) {
      _loggerService.error(
        'Auth with Apple Android $e',
        error: e,
      );
      return Right(
        FailedSignInWithApple(
          message: e.toString(),
        ),
      );
    }
  }

  // =====================
  // iOS (Native Apple API)
  // =====================
  Future<Either<AppleSignInResult, Failure>> _iosCall() async {
    try {
      // Generate secure nonce
      final rawNonce = _cryptoService.generateNonce();
      _cryptoService.sha256ofString(
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

      final res = await _auth.signInWithCredential(
        oauthCredentials,
      );
      return Left(
        AppleSignInResult(
          userCredential: res,
          // Apple only returns the name/email on the FIRST authorization.
          credentials: AppleCredentials(
            firstName: credential.givenName,
            lastName: credential.familyName,
            email: credential.email,
          ),
        ),
      );
    } catch (e) {
      _loggerService.error(
        'Google auth with Apple Ios',
        error: e,
      );
      return Right(
        FailedSignInWithApple(
          message: e.toString(),
        ),
      );
    }
  }
}
