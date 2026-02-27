part of 'chat_bloc.dart';

@freezed
sealed class ChatEvent with _$ChatEvent {
  const factory ChatEvent.init() = _Init;

  const factory ChatEvent.createChat({
    required String uid,
  }) = _CreateChat;
}
