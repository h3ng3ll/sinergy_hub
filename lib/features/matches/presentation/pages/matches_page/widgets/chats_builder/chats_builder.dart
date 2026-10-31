import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../chat/domain/models/chat/chat.dart';

import '../../../../../../chat/domain/models/participant_info/participant_info.dart';
import '../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../../core/widgets/wide/staggered_entrance.dart';
import 'widgets/chat_tile_item.dart';
import 'widgets/chat_tile_wide.dart';

/// Total length of the staggered entrance of the first tiles.
const Duration _kEntranceDuration = Duration(milliseconds: 900);

/// Fixed height of a wide chat tile in the desktop grid.
const double _kWideTileExtent = 128.0;

class ChatsBuilder extends StatefulWidget {
  final VoidCallback onReachToEnd;
  final List<Chat> chats;
  final Function(Chat chat) onTapChat;
  final Function(Chat chat) showChatActions;
  final List<String> onlineUsers;
  final String uid;

  /// Tablet/desktop: compact white tiles (a 2-column grid on desktop).
  final bool wide;

  const ChatsBuilder({
    super.key,
    required this.onReachToEnd,
    required this.onTapChat,
    required this.chats,
    required this.showChatActions,
    required this.onlineUsers,
    required this.uid,
    this.wide = false,
  });

  @override
  State<ChatsBuilder> createState() => _ChatsBuilderState();
}

class _ChatsBuilderState extends State<ChatsBuilder>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: _kEntranceDuration,
  )..forward();

  @override
  void dispose() {
    _entrance.dispose();
    _scrollController.dispose();
    super.dispose();
  }

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

  Widget _buildWideItem(BuildContext context, int index) {
    final Chat chat = widget.chats[index];
    final String? otherUid = chat.otherUserUid(widget.uid);

    return StaggeredEntrance(
      animation: _entrance,
      index: index,
      child: ChatTileWide(
        chat: chat,
        uid: widget.uid,
        onTap: () => widget.onTapChat(
          chat,
        ),
        onLongPress: () => widget.showChatActions(
          chat,
        ),
        isOnlineUser: otherUid != null && widget.onlineUsers.contains(otherUid),
        otherUser: chat.otherUser(widget.uid),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.wide) {
      const padding = EdgeInsets.only(
        top: 12.0,
        bottom: 32.0,
      );
      final isDesktop = ResponsiveHelper.isDesktop(
        MediaQuery.sizeOf(context).width,
      );

      if (isDesktop) {
        return GridView.builder(
          controller: _scrollController,
          padding: padding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: _kWideTileExtent,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: widget.chats.length,
          itemBuilder: _buildWideItem,
        );
      }

      return ListView.separated(
        controller: _scrollController,
        padding: padding,
        itemCount: widget.chats.length,
        itemBuilder: _buildWideItem,
        separatorBuilder: (_, _) => Gap(
          12.0,
        ),
      );
    }

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
          isOnlineUser:
              otherUid != null && widget.onlineUsers.contains(otherUid),
          otherUser: otherUser,
        );
      },
      separatorBuilder: (_, _) => Gap(
        15.0,
      ),
    );
  }
}
