part of 'auth_cubit.dart';

enum AuthStatus {
  loading,
  authorized,
  logout,
  failed,
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.logout) AuthStatus status,
    // User? user,
    @Default('') String errorMessage,
    @Default('') String loadingMessage,
    AuthCredential? authCredential,
    /// verificationPart
    String? verificationId,
    int? resendToken,
  }) = _AuthState;


}