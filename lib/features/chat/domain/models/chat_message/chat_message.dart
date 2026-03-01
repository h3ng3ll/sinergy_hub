import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.g.dart';

part 'chat_message.freezed.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @Default('') String id,
    @Default('') String message,
    @Default('') String sentUid,
    // @Default(false) bool hasRead,
    required DateTime createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(
    Map<String, Object?> json,
  ) => _$ChatMessageFromJson(json);
}
