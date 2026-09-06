import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'env.dart';

class ProdEnv extends Env {
  @override
  String webPushCertificate() {
    final value = kIsWeb
        ? const String.fromEnvironment(
            'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
          )
        : dotenv.get(
            'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
          );
    return value;
  }

  @override
  String serverClientId() {
    final value = kIsWeb
        ? const String.fromEnvironment(
            'PROD_SERVER_CLIENT_ID',
          )
        : dotenv.get(
            'PROD_SERVER_CLIENT_ID',
          );
    return value;
  }

  @override
  String get appName => 'Synergy Hub';
}
