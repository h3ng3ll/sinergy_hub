import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../chat_dto/chat_dto.dart';



part 'chat_dto_pg_state.freezed.dart';

@freezed
abstract class ChatDtoPgState with _$ChatDtoPgState {
  const ChatDtoPgState._();

  const factory ChatDtoPgState({
    @Default(0) int startIndex,
    @Default(10) int pageSize,
    @Default(true) bool hasMore,

    /// Firebase field
    DocumentSnapshot? lastDocument,
    @Default([]) List<ChatDto> chats,

  }) = _ChatDtoPgState;

}
