import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../chat/domain/models/chat/chat.dart';

import '../../../../../../chat/domain/models/participant_info/participant_info.dart';
import '../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import 'widgets/chat_tile_item.dart';

class ChatsBuilder extends StatefulWidget {
  final VoidCallback onReachToEnd;
  final List<Chat> chats;
  final Function(Chat chat) onTapChat;
  final Function(Chat chat) showChatActions;
  final List<String> onlineUsers;
  final String uid;

  const ChatsBuilder({
    super.key,
    required this.onReachToEnd,
    required this.onTapChat,
    required this.chats,
    required this.showChatActions,
    required this.onlineUsers,
    required this.uid,
  });

  @override
  State<ChatsBuilder> createState() => _ChatsBuilderState();
}

class _ChatsBuilderState extends State<ChatsBuilder> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      scrollListener,
    );
    super.initState();
  }

  void scrollListener() {
    if (_scrollController.reachToEnd) {
      widget.onReachToEnd();
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.chats.length,
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      itemBuilder: (context, index) {
        final Chat chat = widget.chats[index];
        final ParticipantInfo? otherUser = chat.otherUser(
          widget.uid,
        );
        final String? otherUid = chat.otherUserUid(widget.uid);

        return ChatTileItem(
          chat: chat,
          onTap: () => widget.onTapChat(
            chat,
          ),
          onLongPress: () => widget.showChatActions(
            chat,
          ),
          isOnlineUser: otherUid != null &&
              widget.onlineUsers.contains(otherUid),
          otherUser: otherUser,
        );
      },
      separatorBuilder: (_, _) => Gap(
        15.0,
      ),
    );
  }
}
