part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authorized,
  logout,
  failed,
}

extension AuthStateX on AuthState {
  String? get uid => user?.uid;

  bool get isAuthorized => status == AuthStatus.authorized && isEmailVerified;
  bool get isLogout => status == AuthStatus.logout;
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    User? user,
    @Default('') String errorMessage,
    @Default('') String loadingMessage,
    AuthCredential? authCredential,
    @Default(false) isEmailVerified,
    /// verificationPart
    String? verificationId,
    int? resendToken,
  }) = _AuthState;
}
