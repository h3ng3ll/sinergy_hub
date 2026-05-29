import 'env.dart';

class ProdEnv extends Env {
  @override
  String webPushCertificate() {
    final value = String.fromEnvironment(
      'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
    );
    return value;
  }

  @override
  String serverClientId() {
    final value =  String.fromEnvironment(
      'PROD_SERVER_CLIENT_ID',
    );
    return value;
  }
}
