import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'env.dart';

class ProdEnv extends Env {
  @override
  String webPushCertificate() {
    final value = dotenv.get(
      'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
      fallback: String.fromEnvironment(
        'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
      ),
    );
    return value;
  }

  @override
  String serverClientId() {
    final value = dotenv.get(
      'PROD_SERVER_CLIENT_ID',
      fallback: String.fromEnvironment(
        'PROD_SERVER_CLIENT_ID',
      ),
    );
    return value;
  }
}
