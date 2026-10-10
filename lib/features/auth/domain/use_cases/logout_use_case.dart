import 'package:flutter/foundation.dart';

import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../repostories/i_auth_repository.dart';

/// Bounds the backend call so a slow / offline network never holds logout.
const Duration _kOnLogoutTimeout = Duration(seconds: 5);

class LogoutUseCase {
  final IAuthRepository _authRepository;
  final FirebaseFunctionsService _firebaseFunctionsService;
  final FirebaseMessagingService _firebaseMessagingService;

  LogoutUseCase({
    required this._authRepository,
    required this._firebaseFunctionsService,
    required this._firebaseMessagingService,
  });

  /// ONE backend call (`onLogout`) does the server-side sign-out work —
  /// detaches this device's FCM token from the account and marks the user
  /// offline with admin rights — then the auth session is dropped.
  /// It must run BEFORE `signOut()`: the callable needs the authenticated user.
  /// A failed call never blocks logout.
  Future<void> call() async {
    try {
      final platform = _firebaseMessagingService.platformKey;
      final token = await _firebaseMessagingService.fcmTokenReady;
      await _firebaseFunctionsService.call(
        functionName: 'onLogout',
        data: {
          if (platform != null && token != null) ...{
            'platform': platform,
            'token': token,
          },
        },
        timeout: _kOnLogoutTimeout,
      );
    } catch (e) {
      debugPrint('onLogout failed: $e');
    }
    await _authRepository.signOut();
  }
}
