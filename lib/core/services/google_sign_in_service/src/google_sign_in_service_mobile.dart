import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInServiceMobile {
  GoogleSignInServiceMobile._();

  static final instance = GoogleSignInServiceMobile._();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> init(ValueNotifier<String?> authToken) async {
    await _googleSignIn.initialize(
      serverClientId: dotenv.get(
        'FIREBASE_WEB_API_KEY',
      ),
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


  Future<void>  signOut() async {
    await _googleSignIn.signOut();
  }

  Widget renderButton() {
    return Container();
  }

}

final instanceImpl = GoogleSignInServiceMobile.instance;
