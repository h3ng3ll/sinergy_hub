import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_config.g.dart';

part 'chat_config.freezed.dart';

@freezed
abstract class ChatConfig with _$ChatConfig {
  const factory ChatConfig({
    required String chatId,
    @Default(false) bool archived,
    @Default(false) bool favorite,
  }) = _ChatConfig;

  @visibleForTesting
  factory ChatConfig.empty() => const ChatConfig(
    chatId: '',
    archived: false,
    favorite: false,
  );

  factory ChatConfig.fromJson(
    Map<String, Object?> json,
  ) => _$ChatConfigFromJson(
    json,
  );
}