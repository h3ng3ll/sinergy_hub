import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Stream<User?> watchUser();
  Future<User?> getCurrentUser();
  Future<bool> isAuthorized();
  Future<UserCredential> signInAnonymously();
  Future<UserCredential> signInWithGoogle();
  Future<void> signOut();
  Future<void> deleteAccount();
}
