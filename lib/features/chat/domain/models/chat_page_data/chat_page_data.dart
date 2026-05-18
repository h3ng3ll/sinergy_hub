import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../chat/chat.dart';

part 'chat_page_data.freezed.dart';

@freezed
abstract class ChatPageData with _$ChatPageData {
  const factory ChatPageData({
    required Chat chat,
    required List<UserData> users,
    required UserData currentUser,
    required String peerUid,
  }) = _ChatPageData;
}
