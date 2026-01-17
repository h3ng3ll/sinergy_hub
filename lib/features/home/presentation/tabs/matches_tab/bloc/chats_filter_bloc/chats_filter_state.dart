part of 'chats_filter_bloc.dart';

enum ChatsFilterStatus {
  initial,
  loading,
  failed,
}

@freezed
sealed class  ChatsFilterState with _$ChatsFilterState {

  const factory  ChatsFilterState({
    @Default( ChatsFilterStatus.initial)  ChatsFilterStatus status,
    @Default(EChatFilter.recent) EChatFilter filter,
    @Default('') errorMessage,
  }) = _ChatsFilterState;
}
