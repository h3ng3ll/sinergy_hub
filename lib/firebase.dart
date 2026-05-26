// firebase.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'core/utils/env_helper.dart';
import 'firebase/firebase_options_prod.dart' as prod;

// import 'package:flutter_ship_app/firebase_options_stg.dart' as stg;
import 'firebase/firebase_options_dev.dart' as dev;

FirebaseOptions _findFromEnv() {
  final value = switch (EnvHelper.dartEnv) {
    EnvHelper.production => prod.DefaultFirebaseOptions.currentPlatform,
    // 'stg' => stg.DefaultFirebaseOptions.currentPlatform,
    EnvHelper.development => dev.DefaultFirebaseOptions.currentPlatform,
    _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  };
  return value;
}

Future<void> initFirebase() async {
  // Determine which Firebase options to use based on the flavor
  final firebaseOptions = switch (appFlavor) {
    EnvHelper.production => prod.DefaultFirebaseOptions.currentPlatform,
    // 'stg' => stg.DefaultFirebaseOptions.currentPlatform,
    EnvHelper.development => dev.DefaultFirebaseOptions.currentPlatform,
    _ => _findFromEnv(),
  };
  print('Firebase apps before init: ${Firebase.apps.length}');
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
}
