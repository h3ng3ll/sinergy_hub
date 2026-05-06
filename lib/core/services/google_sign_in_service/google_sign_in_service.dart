import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../utils/env/env.dart';
import 'src/google_sign_in_service_mobile.dart'
    if (dart.library.html) 'src/google_sign_in_service_web.dart';

class GoogleSignInService {
  GoogleSignInService._();

  static final instance = GoogleSignInService._();

  final ValueNotifier<String?> authToken = ValueNotifier(null);

  Future<void> init(Env env) async {
    instanceImpl.init(
      env,
      authToken,
    );
  }

  Future<void> signOut() async {
    await instanceImpl.signOut();
  }

  Widget renderButton() {
    return instanceImpl.renderButton();
  }
}
