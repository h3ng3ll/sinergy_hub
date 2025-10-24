part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<Chat> chats,
    @Default('') String errorMessage,
    @Default(ChatStatus.loading) ChatStatus status,
  }) = _ChatState;
}
