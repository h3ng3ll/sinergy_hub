import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../chat/chat.dart';



part 'chat_pg_state.freezed.dart';

@freezed
abstract class ChatPgState with _$ChatPgState {
  const factory ChatPgState({

    @Default(0) int startIndex,
    @Default(10) int pageSize,
    @Default(true) bool hasMore,

    /// Firebase field
    DocumentSnapshot? lastDocument,
    @Default({}) Set<String> excludedUids,
    @Default([]) List<Chat> chats,
  }) = _ChatPgState;

}
