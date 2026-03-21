part of 'chats_filter_bloc.dart';

@freezed
sealed class ChatsFilterEvent with _$ChatsFilterEvent {
  const factory ChatsFilterEvent.applyFilter({
    required EChatFilter filter,
  }) = _ApplyFilter;

  const factory ChatsFilterEvent.search({
    required String query,
  }) = _Search;

  const factory ChatsFilterEvent.toggleArchived({
    required Chat chat,
  }) = _ToggleArchived;

  const factory ChatsFilterEvent.toggleFavorite({
    required Chat chat,
  }) = _ToggleFavorite;

  const factory ChatsFilterEvent.listenChatsChanges() = _ListenChatsChanges;
}
