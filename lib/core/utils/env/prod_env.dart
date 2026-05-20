import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../firebase/firebase_options_prod.dart' as prod;
import 'env.dart';

class ProdEnv extends Env {
  @override
  String webPushCertificate() => dotenv.get(
    'PROD_FIREBASE_WEB_PUSH_CERTIFICATE',
  );

  @override
  String serverClientId() => dotenv.get(
    'PROD_SERVER_CLIENT_ID',
  );
}
