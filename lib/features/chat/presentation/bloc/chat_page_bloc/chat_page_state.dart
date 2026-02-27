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
  get isLoading => status == ChatPageStatus.loading;

  get isFailed => status == ChatPageStatus.failed;
  get isSending => status == ChatPageStatus.sending;
  get isSent => status == ChatPageStatus.sent;
}

@freezed
sealed class ChatPageState with _$ChatPageState {
  factory ChatPageState({
    required String chatId,
    @Default([]) List<ChatMessage> messages,
    @Default([]) List<UserData> users,
    @Default(ChatPageStatus.loading) ChatPageStatus status,
    // @Default(true) bool isOnlineUser,
    @Default('') errorMessage,
  }) = _ChatPageState;
}
