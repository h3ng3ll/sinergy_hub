import 'package:firebase_core/firebase_core.dart';

abstract class Env {

  abstract FirebaseOptions firebaseOptions;

  Env() {
    init();
  }

  String serverClientId();
  String webPushCertificate();

  Future<void> init() async {

    await Firebase.initializeApp(
      options: firebaseOptions,
    );
  }
}
