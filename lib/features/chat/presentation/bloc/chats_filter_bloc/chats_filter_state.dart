part of 'chats_filter_bloc.dart';

enum ChatsFilterStatus {
  initial,
  loading,
  searching,
  failed,
  archived,
  unArchived,
  favorite,
  unFavorite,
}

extension ChatsFilterStateX on ChatsFilterState {
  get isFailed => status == ChatsFilterStatus.failed;

  get isArchived => status == ChatsFilterStatus.archived;

  get isUnArchived => status == ChatsFilterStatus.unArchived;

  get isFavorite => status == ChatsFilterStatus.favorite;

  get isUnFavorite => status == ChatsFilterStatus.unFavorite;

  ChatsFilterStatus? resolveStatus(Chat old, Chat newChat, String uid) {
    if (old.isArchived(uid) != newChat.isArchived(uid)) {
      return newChat.isArchived(uid)
          ? ChatsFilterStatus.archived
          : ChatsFilterStatus.unArchived;
    }

    if (old.isFavorite(uid) != newChat.isFavorite(uid)) {
      return newChat.isFavorite(uid)
          ? ChatsFilterStatus.favorite
          : ChatsFilterStatus.unFavorite;
    }

    return null;
  }
}

@freezed
sealed class ChatsFilterState with _$ChatsFilterState {
  const factory ChatsFilterState({
    @Default(ChatsFilterStatus.initial) ChatsFilterStatus status,
    @Default(ChatPgState()) ChatPgState chatsState,
    @Default(EChatFilter.all) EChatFilter filter,
    @Default('') String query,
    @Default('') String uid,
    @Default('') errorMessage,
  }) = _ChatsFilterState;
}
