part of 'chat_page_bloc.dart';

@freezed
sealed class ChatPageEvent with _$ChatPageEvent {
  const factory ChatPageEvent.subscribe({
    required String uid,
  }) = _Subscribe;

  const factory ChatPageEvent.init({
    required String chatId,
  }) = _Init;

  const factory ChatPageEvent.sendMessage({
    required String message,
  }) = _SendMessage;

  const factory ChatPageEvent.updateMessages({
    required List<ChatMessage> messages,
  }) = _UpdateMessages;

  const factory ChatPageEvent.updateChat({
    required Chat chat,
  }) = _UpdateChat;

  const factory ChatPageEvent.startTyping() = _StartTyping;

  const factory ChatPageEvent.endTyping() = _EndTyping;

  const factory ChatPageEvent.updateUserData({
    required UserData user,
  }) = _UpdateUserData;

  const factory ChatPageEvent.toggleBlock({
    required String targetUid,
    required bool blocked,
  }) = _ToggleBlock;

  const factory ChatPageEvent.loadOlder() = _LoadOlder;

  const factory ChatPageEvent.messagesFailed({
    required String message,
  }) = _MessagesFailed;
}
