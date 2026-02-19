part of 'chat_page_bloc.dart';


enum ChatPageStatus {
  initial,
  loading,
  loaded,
  failed,
}

@freezed
sealed class  ChatPageState with _$ChatPageState {

   factory  ChatPageState({
    Chat? chat,
    @Default([]) List<ChatMessage> messages,
    @Default( ChatPageStatus.loading)  ChatPageStatus status,
    @Default(true) bool isOnlineUser,
    @Default('') errorMessage,
  }) = _ChatPageState;
}
