part of 'chats_filter_bloc.dart';

@freezed
sealed class ChatsFilterEvent with _$ChatsFilterEvent {
  const factory ChatsFilterEvent.applyFilter({
    required EChatFilter filter,
  }) = _ApplyFilter;

  const factory ChatsFilterEvent.search({
    required String query,
  }) = _Search;
}
