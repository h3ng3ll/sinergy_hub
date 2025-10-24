part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.update({
    required List<Chat> chats,
  }) = _Update;

  const factory ChatEvent.create({
    required String uid,
  }) = _Create;
}
