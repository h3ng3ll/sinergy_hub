import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../../../core/services/ui_message_service.dart';
import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../chat/domain/models/chat/chat.dart';
import '../../../../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'widgets/build_chats_empty.dart';
import 'widgets/chat_actions_dialog.dart';
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
