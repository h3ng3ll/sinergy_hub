part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  authorized,
  failed,
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    // User? user,
    @Default('') String errorMessage,
    @Default('') String loadingMessage,
    AuthCredential? authCredential,
    /// verificationPart
    String? verificationId,
    int? resendToken,
  }) = _AuthState;


}