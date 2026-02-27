part of 'chat_page_bloc.dart';

@freezed
sealed class ChatPageEvent with _$ChatPageEvent {
  const factory ChatPageEvent.subscribe() = _Subscribe;
  const factory ChatPageEvent.init() = _Init;

  const factory ChatPageEvent.sendMessage({
    required String message,
  }) = _SendMessage;

  const factory ChatPageEvent.updateMessages({
    required List<ChatMessage> messages,
  }) = _UpdateMessages;
}
