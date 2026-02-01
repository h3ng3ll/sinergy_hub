import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';

part 'chat.g.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    @Default('') String chatId,
    required UserData user,
    @Default('') String lastMessage,
    required DateTime lastMessageSent,
    @Default([]) List<String> typingUsers,
    /// who access this chat
    required List<String> participants,
    @Default(false) bool hasRead ,
    @Default(false) bool isArchived ,
    @Default(false) bool isFavorite ,
    required DateTime createdAt,
    @Default('') String icon,
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}
