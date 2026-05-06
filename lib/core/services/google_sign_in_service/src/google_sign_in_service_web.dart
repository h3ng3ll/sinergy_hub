import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';

import '../../../utils/env/env.dart';

class GoogleSignInServiceWeb {
  GoogleSignInServiceWeb._();

  static final instance = GoogleSignInServiceWeb._();

  late final GoogleSignInPlugin _googleSignIn;

  Future<void> init(Env env , ValueNotifier<String?> authToken) async {
    if (kIsWeb) {
      _googleSignIn = GoogleSignInPlugin();
      await _googleSignIn.init(
        InitParameters(
          clientId: env.webPushCertificate(),
        ),
      );
      _googleSignIn.renderButton();

      _googleSignIn.authenticationEvents.listen((event) {
        final data = switch (event) {
          AuthenticationEventSignIn() => event.authenticationTokens,
          _ => null,
        };

        if (data?.idToken != null) {
          final token = data!.idToken!;
          if (kDebugMode) {
            print('WEB TOKEN: $token');
          }

          /// 🔥 Пишем в ОБЩИЙ notifier
          authToken.value = token;
        }
      });
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut(
      SignOutParams(),
    );
  }

  Widget renderButton() {
    return _googleSignIn.renderButton();
  }
}

final instanceImpl = GoogleSignInServiceWeb.instance;
