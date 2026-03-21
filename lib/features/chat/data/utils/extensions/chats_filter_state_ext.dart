import '../../../presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/models/e_chat_filter.dart';

extension ChatsFilterStateExt on ChatsFilterState {
  // Iterable<Chat> _filterByQuery(Iterable<Chat> chats) {
  //   if (query.trim().isEmpty) return chats;
  //
  //   final q = query.toLowerCase().trim();
  //
  //   return chats.where((e) {
  //     final first = e.user.firstName ?? '';
  //     final last = e.user.lastName ?? '';
  //
  //     final fullName = '$first $last'.toLowerCase();
  //
  //     return fullName.contains(q);
  //   });
  // }
  bool get isInitial => status == ChatsFilterStatus.initial;
  bool get isEmpty => chatsState.chats.isEmpty;

  bool get isLoading => status == ChatsFilterStatus.loading;

  bool get isApplied => query.isNotEmpty || filter != EChatFilter.all;

  // Iterable<Chat> filterByType(Iterable<Chat> chats) {
  //   switch (filter) {
  //     ///Todo Came up with some logic
  //     case EChatFilter.recent:
  //       return chats;
  //
  //     // case EChatFilter.unread:
  //     //   return chats.where(
  //     //     (e) => !e.hasRead,
  //     //   );
  //
  //     case EChatFilter.all:
  //       return chats;
  //
  //     case EChatFilter.favorite:
  //       return chats.where(
  //         (e) => e.isFavorite,
  //       );
  //     case EChatFilter.archived:
  //       return chats.where(
  //         (e) => e.isArchived,
  //       );
  //   }
  // }
}
