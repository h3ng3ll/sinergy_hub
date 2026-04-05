import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_config.g.dart';

part 'chat_config.freezed.dart';

@freezed
abstract class ChatConfig with _$ChatConfig {
  const factory ChatConfig({
    /// Fix to check if web don't broke and
    /// it properly accept List<bool> data
    @JsonKey(fromJson: _listFromJson)
    @Default([]) List<String> archived,

    @JsonKey(fromJson: _listFromJson)
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

List<String> _listFromJson(dynamic value) {
  if (value == null) return [];

  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }

  return [];
}

extension ChatConfigX on ChatConfig {

  /// Fix: TypeError: $this.archived[$contains] is not a function
  bool isArchived(
      String uid,
      ) {
    try {
      return archived.contains(
        uid,
      );
    } catch(_) {
      return false;
    }
  }

  bool isFavorite(
      String uid,
      ) {
    return  favorite.contains(
      uid,
    );
  }
}