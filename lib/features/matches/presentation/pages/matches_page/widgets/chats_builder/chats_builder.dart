import 'package:flutter/material.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../chat/domain/models/chat/chat.dart';

import 'widgets/chat_tile_item.dart';

class ChatsBuilder extends StatefulWidget {
  final VoidCallback onReachToEnd;
  final List<Chat> chats;
  final Function(Chat chat) onTapChat;
  final Function(Chat chat) showChatActions;

  const ChatsBuilder({
    super.key,
    required this.onReachToEnd,
    required this.onTapChat,
    required this.chats,
    required this.showChatActions,
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
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.chats.length,
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      itemBuilder: (context, index) {
        final chat = widget.chats[index];
        return ChatTileItem(
          chat: chat,
          onTap: () => widget.onTapChat(
            chat,
          ),
          onLongPress: () => widget.showChatActions(
            chat,
          ),
        );
      },
    );
  }
}
