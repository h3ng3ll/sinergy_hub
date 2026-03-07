part of 'chats_filter_bloc.dart';

enum ChatsFilterStatus {
  initial,
  loading,
  searching,
  failed,
}

extension ChatsFilterStateX on ChatsFilterState {
 get isFailed => status == ChatsFilterStatus.failed;
}
@freezed
sealed class ChatsFilterState with _$ChatsFilterState {
  const factory ChatsFilterState({
    @Default(ChatsFilterStatus.initial) ChatsFilterStatus status,
    @Default([]) List<Chat> chats,
    @Default(EChatFilter.all) EChatFilter filter,
    @Default('') String query,
    @Default('') errorMessage,
  }) = _ChatsFilterState;
}
