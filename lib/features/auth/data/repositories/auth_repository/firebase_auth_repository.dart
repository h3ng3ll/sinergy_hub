import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../../core/services/google_sign_in_service/google_sign_in_service.dart';
import '../../../domain/failures/auth_failures.dart';
import '../../../domain/repostories/i_auth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository {
  // final FirebaseAuthService _firebaseAuthService;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final GoogleSignInService _googleSignInService;

  FirebaseAuthRepository({
    // required FirebaseAuthService firebaseAuthService,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestoreService firebaseFirestoreService,
    required GoogleSignInService googleSignInService,
  }) : // _firebaseAuthService = firebaseAuthService,
       _auth = auth,
       _googleSignInService = googleSignInService,
       _googleSignIn = googleSignIn {
    if (kIsWeb) {
      _initSignInEvents();
    }
  }

  @override
  Stream<User?> watchUser() => _auth.userChanges();

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
    // _googleSignIn.authenticationEvents.listen(
    //   (event) => listenAuthEvents(
    //     event,
    //   ),
    //   onError: (e) {
    //     print(
    //       e.toString(),
    //     );
    //   },
    // );
  }

  Future<void> listenAuthEvents(
    GoogleSignInAuthenticationEvent event,
  ) async {
    // final GoogleSignIn
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };
    if (user != null) {
      // Retrieve the authentication tokens (synchronous getter in v7.0.0+)
      final GoogleSignInAuthentication auth = user.authentication;

      // **CRITICAL FIX: Retrieve and Store the ID Token**
      final String? token = auth.idToken;
      if (token != null) {
        _signInWithCredentials(
          token,
        );
      }
    }
  }

  Future<UserCredential> _signInWithCredentials(String idToken) async {
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

        return authRes;
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

    throw FirebaseAuthException(
      code: 'max-retries-exceeded',
      message: 'Failed to sign in after $maxRetries attempts',
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    await _googleSignIn.initialize(
      serverClientId: dotenv.get('FIREBASE_WEB_API_KEY'),
    );
    final GoogleSignInAccount res = await _googleSignIn.authenticate();

    return await _signInWithCredentials(
      res.authentication.idToken!,
    );
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
  Future<void> register({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<String> requireUserId() async {
    final user = await getCurrentUser();
    final uid = user?.uid;

    if (uid == null) {
      throw AuthFailure();
    }

    return uid;
  }
}
