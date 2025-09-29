import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final instance = FirebaseAuthService._();

  FirebaseAuthService._() {
    _firebaseAuth.setSettings(
      // appVerificationDisabledForTesting: true,
      // forceRecaptchaFlow: true
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isAuthorized() => _firebaseAuth.currentUser != null;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get userStream => _firebaseAuth.userChanges();

  Future<UserCredential> signInAnonymously() async {
    final credentials = await _firebaseAuth.signInAnonymously();
    return credentials;
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    // return credentials;
  }

  Future<UserCredential> signInWithCredentials(
      AuthCredential credential,
      ) async {
    return await _firebaseAuth.signInWithCredential(
      credential,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount(AuthCredential authCredential) async {
    // await _firebaseAuth

    await _firebaseAuth.currentUser?.reauthenticateWithCredential(
      authCredential,
    );
    await _firebaseAuth.currentUser?.delete();
  }

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    await _firebaseAuth.currentUser!.updateProfile(
      displayName: displayName,
      photoURL: photoURL,
    );
  }

  Future<void> updateNumber(PhoneAuthCredential phoneCredential) async {
    await _firebaseAuth.currentUser?.updatePhoneNumber(
      phoneCredential,
    );
  }
}
