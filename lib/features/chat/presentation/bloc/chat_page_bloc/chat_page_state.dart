part of 'chat_page_bloc.dart';

enum ChatPageStatus {
  initial,
  loading,
  loaded,
  failed,
  sending,
  sent,
}

extension ChatPageStateX on ChatPageState {
  bool get isLoading => status == ChatPageStatus.loading;

  bool get isFailed => status == ChatPageStatus.failed;

  bool get isSending => status == ChatPageStatus.sending;

  bool get isSent => status == ChatPageStatus.sent;
}

@freezed
sealed class ChatPageState with _$ChatPageState {
  factory ChatPageState({
    @Default('') String chatId,
    @Default([]) List<ChatMessage> messages,
    @Default([]) List<UserData> users,
    UserData? userData,
    Chat? chat,
    @Default(ChatPageStatus.loading) ChatPageStatus status,
    // @Default(true) bool isOnlineUser,
    @Default('') errorMessage,
  }) = _ChatPageState;
}
