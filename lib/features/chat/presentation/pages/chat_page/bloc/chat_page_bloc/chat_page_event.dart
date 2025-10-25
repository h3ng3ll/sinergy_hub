part of 'chat_page_bloc.dart';

@freezed
sealed class ChatPageEvent with _$ChatPageEvent {
  const factory ChatPageEvent.load() = _Load;

  const factory ChatPageEvent.sendMessage({
    required String message,
  }) = _SendMessage;

  const factory ChatPageEvent.updateChat({
    required Chat chat,
  }) = _UpdateChat;

  const factory ChatPageEvent.updateMessages({
    required List<ChatMessage> messages,
  }) = _UpdateMessages;
}
