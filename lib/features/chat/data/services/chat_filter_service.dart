import '../../domain/models/chat/chat.dart';
import '../../domain/models/e_chat_filter.dart';

// class ChatFilterService {
//   static Iterable<Chat> filterByType(
//     Iterable<Chat> chats,
//     EChatFilter filter,
//   ) {
//     switch (filter) {
//       ///Todo Came up with some logic
//       case EChatFilter.recent:
//         return chats;
//
//       case EChatFilter.unread:
//         return chats.where(
//           (e) => !e.hasRead,
//         );
//
//       case EChatFilter.all:
//         return chats;
//
//       case EChatFilter.favorite:
//         return chats.where(
//           (e) => e.isFavorite,
//         );
//       case EChatFilter.archived:
//         return chats.where(
//           (e) => e.isArchived,
//         );
//     }
//   }
// }
