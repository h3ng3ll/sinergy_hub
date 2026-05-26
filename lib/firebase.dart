// firebase.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase/firebase_options_prod.dart' as prod;

// import 'package:flutter_ship_app/firebase_options_stg.dart' as stg;
import 'firebase/firebase_options_dev.dart' as dev;

FirebaseOptions _findFromEnv() {
  const rawFlavor = String.fromEnvironment(
    'DARTENV',
    defaultValue: 'production',
  );

  final value = switch (rawFlavor) {
    'production' => prod.DefaultFirebaseOptions.currentPlatform,
    // 'stg' => stg.DefaultFirebaseOptions.currentPlatform,
    'development' => dev.DefaultFirebaseOptions.currentPlatform,
    _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  };
  return value;
}

Future<void> initFirebase() async {
  // Determine which Firebase options to use based on the flavor
  final firebaseOptions = switch (appFlavor) {
    'prod' => prod.DefaultFirebaseOptions.currentPlatform,
    // 'stg' => stg.DefaultFirebaseOptions.currentPlatform,
    'development' => dev.DefaultFirebaseOptions.currentPlatform,
    _ => _findFromEnv(),
  };
  print('Firebase apps before init: ${Firebase.apps.length}');
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
}
