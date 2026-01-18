import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repostories/i_auth_repository.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  AuthCubit({
    required IAuthRepository authRepository,
  })
      : _authRepository = authRepository,
        super(const AuthState()) {
    _init();
  }

  Future<void> _init() async {
    if (await _authRepository.isAuthorized()) {
      emit(
        state.copyWith(
          status: AuthStatus.authorized,
        ),
      );
    }
  }

  Future<void> signInViaGoogle() async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );

      await _authRepository.signInWithGoogle();

      emit(
        state.copyWith(
          status: AuthStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      await _authRepository.signOut();

      emit(
        state.copyWith(
          status: AuthStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<bool> isAuthorized() async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
    final res =   await _authRepository.isAuthorized();

      emit(
        state.copyWith(
          status: AuthStatus.initial,
        ),
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          status: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
// Future<void> signAnonymously() async {
//   try {
//     emit(
//       state.copyWith(
//         status: AuthStatus.loading,
//       ),
//     );
//     final UserCredential userCredential = await _firebaseAuthService
//         .signInAnonymously();
//     emit(
//       state.copyWith(
//         user: userCredential.user,
//         status: AuthStatus.authorized,
//       ),
//     );
//   } catch (e) {
//     debugPrint(e.toString());
//     emit(
//       state.copyWith(
//         status: AuthStatus.failed,
//         errorMessage: e.toString(),
//       ),
//     );
//     rethrow;
//   }
// }

// Future<bool> signInViaPhone(String phoneNumber) async {
//   try {
//     emit(
//       state.copyWith(
//         status: AuthStatus.loading,
//         loadingMessage: 'Проверка номера...',
//       ),
//     );
//
//     phoneNumber = '+$phoneNumber';
//
//     final Completer<bool> completer = Completer<bool>();
//
//     await _firebaseAuthService.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         /// Android only devices
//         final credentials = await _firebaseAuthService.signInWithCredentials(
//           credential,
//         );
//         emit(
//           state.copyWith(
//             user: credentials.user,
//           ),
//         );
//         completer.complete(true);
//       },
//       verificationFailed: (FirebaseAuthException e) async {
//         emit(
//           state.copyWith(
//             status: AuthStatus.failed,
//             errorMessage: e.toString(),
//           ),
//         );
//         completer.completeError(e.toString());
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         /// resendToken always null on IOS
//
//         emit(
//           state.copyWith(
//             verificationId: verificationId,
//             resendToken: resendToken,
//           ),
//         );
//         completer.complete(true);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//
//     final res = await completer.future;
//     emit(
//       state.copyWith(
//         status: AuthStatus.initial,
//       ),
//     );
//     return res;
//   } catch (e) {
//     debugPrint(e.toString());
//     emit(
//       state.copyWith(
//         status: AuthStatus.failed,
//         errorMessage: e.toString(),
//       ),
//     );
//     rethrow;
//   }
// }

// Future<bool> verifySmsCode(String smsCode) async {
//   try {
//     emit(
//       state.copyWith(
//         status: AuthStatus.loading,
//       ),
//     );
//     if (state.verificationId == null) return false;
//
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: state.verificationId!,
//       smsCode: smsCode,
//     );
//     final userCredential = await _firebaseAuthService.signInWithCredentials(
//       credential,
//     );
//     emit(
//       state.copyWith(
//         authCredential: credential,
//         status: AuthStatus.initial,
//         user: userCredential.user,
//       ),
//     );
//     return true;
//   } catch (e) {
//     emit(
//       state.copyWith(
//         status: AuthStatus.failed,
//         errorMessage: e.toString(),
//       ),
//     );
//     rethrow;
//   }
// }

// Future<bool> deleteAccount() async {
//   try {
//     if (state.authCredential == null) return false;
//     emit(
//       state.copyWith(
//         status: AuthStatus.loading,
//       ),
//     );
//
//     await _firebaseAuthService.deleteAccount(
//       state.authCredential!,
//     );
//
//     emit(
//       state.copyWith(
//         user: null,
//         status: AuthStatus.initial,
//       ),
//     );
//     return true;
//   } catch (e) {
//     debugPrint(e.toString());
//     emit(
//       state.copyWith(
//         status: AuthStatus.failed,
//         errorMessage: e.toString(),
//       ),
//     );
//     rethrow;
//   }
// }
//
// Future<void> updateNumber(String smsCode, VoidCallback onCompleted) async {
//   try {
//     if (state.verificationId == null) return;
//
//     emit(
//       state.copyWith(
//         status: AuthStatus.loading,
//       ),
//     );
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: state.verificationId!,
//       smsCode: smsCode,
//     );
//     await _firebaseAuthService.updateNumber(
//       credential,
//     );
//     emit(
//       state.copyWith(
//         status: AuthStatus.initial,
//         authCredential: credential,
//       ),
//     );
//     onCompleted();
//   } catch (e) {
//     emit(
//       state.copyWith(
//         status: AuthStatus.failed,
//         errorMessage: e.toString(),
//       ),
//     );
//     rethrow;
//   }
// }
}
