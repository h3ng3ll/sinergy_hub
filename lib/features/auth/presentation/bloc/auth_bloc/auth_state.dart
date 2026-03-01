part of 'auth_bloc.dart';

enum AuthStatus {
  loading,
  authorized,
  logout,
  failed,
}

extension AuthStateX on AuthState {
  String? get uid => user?.uid;

  bool get isAuthorized => status == AuthStatus.authorized;
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.loading) AuthStatus status,
    User? user,
    @Default('') String errorMessage,
    @Default('') String loadingMessage,
    AuthCredential? authCredential,

    /// verificationPart
    String? verificationId,
    int? resendToken,
  }) = _AuthState;
}
