import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../firebase/firebase_options_prod.dart' as prod;
import 'env.dart';

class ProdConfig extends Env {
  @override
  FirebaseOptions get firebaseOptions =>
      prod.DefaultFirebaseOptions.currentPlatform;

  @override
  set firebaseOptions(
    FirebaseOptions value,
  ) => firebaseOptions = value;

  @override
  String serverClientId() {
    return dotenv.get('DEV_SERVER_CLIENT_ID');
  }
}
