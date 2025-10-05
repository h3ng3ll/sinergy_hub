import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../domain/repostories/i_auth_repository.dart';

class FirebaseAuthRepository extends IAuthRepository {
  // final FirebaseAuthService _firebaseAuthService;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestoreService _firebaseFirestoreService;

  FirebaseAuthRepository({
    // required FirebaseAuthService firebaseAuthService,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : // _firebaseAuthService = firebaseAuthService,
       _auth = auth,
       _firebaseFirestoreService = firebaseFirestoreService,
       _googleSignIn = googleSignIn;

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

  @override
  Future<UserCredential> signInWithGoogle() async {
    await _googleSignIn.initialize(
      serverClientId: dotenv.get('FIREBASE_WEB_API_KEY'),
    );
    final GoogleSignInAccount res = await _googleSignIn.authenticate();

    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: res.authentication.idToken,
    );

    final authRes = await _auth.signInWithCredential(
      credential,
    );

    // final uDoc = _firebaseFirestoreService.userDocument(
    //   authRes.user!.uid,
    // );
    // final bool isExists = await _firebaseFirestoreService.isExistsDocument(
    //   uDoc,
    // );
    // if (!isExists) {
    //   uDoc.set(
    //     {},
    //   );
    // }
    return authRes;
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }
}
