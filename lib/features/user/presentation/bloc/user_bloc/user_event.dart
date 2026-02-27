part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.init({
    required String uid,
  }) = _Init;

  const factory UserEvent.reset() = _Reset;

  const factory UserEvent.update({
    required UserData user,
    Uint8List? img,
  }) = _Update;
}
