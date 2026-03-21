import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_config.g.dart';

part 'chat_config.freezed.dart';

@freezed
abstract class ChatConfig with _$ChatConfig {
  const factory ChatConfig({
    @Default([]) List<String> archived,
    @Default([]) List<String> favorite,
  }) = _ChatConfig;

  @visibleForTesting
  factory ChatConfig.empty() => const ChatConfig(
    archived: [],
    favorite: [],
  );

  factory ChatConfig.fromJson(
    Map<String, Object?> json,
  ) => _$ChatConfigFromJson(
    json,
  );
}

extension ChatConfigX on ChatConfig {

  bool isArchived(
      String uid,
      ) => archived.contains(
    uid,
  );

  bool isFavorite(
      String uid,
      ) => favorite.contains(
    uid,
  );
}