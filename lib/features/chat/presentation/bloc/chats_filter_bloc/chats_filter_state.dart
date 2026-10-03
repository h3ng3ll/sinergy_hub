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
  bool get isFailed => status == ChatsFilterStatus.failed;

  bool get isArchived => status == ChatsFilterStatus.archived;

  bool get isUnArchived => status == ChatsFilterStatus.unArchived;

  bool get isFavorite => status == ChatsFilterStatus.favorite;

  bool get isUnFavorite => status == ChatsFilterStatus.unFavorite;

  List<String> get onlineUsers => onlineStatuses.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

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
    @Default(ChatsFilterStatus.loading) ChatsFilterStatus status,
    @Default(ChatPgState()) ChatPgState chatsState,

    /// Every cached chat of the user; [chatsState] is its filtered view.
    @Default([]) List<Chat> allChats,
    @Default({}) Map<String, bool> onlineStatuses,
    @Default(<String, StreamSubscription<UserData?>>{})
    Map<String, StreamSubscription<UserData?>> peerSubs,
    @Default(EChatFilter.all) EChatFilter filter,
    @Default('') String query,
    @Default('') String uid,
    @Default('') errorMessage,
  }) = _ChatsFilterState;
}
