import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';

abstract class Env {
  abstract FirebaseOptions firebaseOptions;

  Env() {
    if (kDebugMode) {
      _checkBundle();
    }
  }

  Future<void> _checkBundle() async {
    final info = await PackageInfo.fromPlatform();

    if (kDebugMode) {
      print('APP ID: ${info.packageName}');
      print('APP NAME: ${info.appName}');
      print('Flavor: $appFlavor');
    }
  }

  String serverClientId();

  String webPushCertificate();

  Future<void> init() async {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
  }
}
