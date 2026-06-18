import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/env/env.dart';

class GoogleSignInServiceMobile {
  GoogleSignInServiceMobile._();

  static final instance = GoogleSignInServiceMobile._();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> init(Env env, ValueNotifier<String?> authToken) async {
    await _googleSignIn.initialize(
      serverClientId: env.webPushCertificate(),
    );
    _googleSignIn.authenticationEvents.listen((event) {
      final user = switch (event) {
        GoogleSignInAuthenticationEventSignIn() => event.user,
        _ => null,
      };

      if (user?.authentication.idToken != null) {
        final token = user!.authentication.idToken!;
        if (kDebugMode) {
          print('MOBILE TOKEN: $token');
        }

        /// 🔥 тот же notifier
        authToken.value = token;
      }
    });
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
  }

  Widget renderButton() {
    return Container();
  }
}

final instanceImpl = GoogleSignInServiceMobile.instance;
