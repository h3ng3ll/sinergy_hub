part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;
  const factory AuthEvent.listen() = _Listen;
  const factory AuthEvent.signInViaGoogle() = _SignInViaGoogle;
  const factory AuthEvent.signOut() = _SignOut;
}
