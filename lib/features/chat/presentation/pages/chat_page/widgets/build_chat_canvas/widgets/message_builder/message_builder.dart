import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../../../../domain/models/chat_message/chat_message.dart';
import '../../../../../../bloc/chat_page_bloc/chat_page_bloc.dart';
import '../../../skeleton/chat_messages_skeleton.dart';
import 'widgets/build_chat_separator.dart';
import 'widgets/build_empty_chat_messages.dart';
import 'widgets/build_message.dart';

const Duration _kContentFade = Duration(milliseconds: 300);

class MessageBuilder extends StatefulWidget {
  final VoidCallback onReachToEnd;
  final Function(String) onTapUrl;
  final Function(String) onTapEmail;
  final UserData currentUser;

  const MessageBuilder({
    super.key,
    required this.onReachToEnd,
    required this.onTapUrl,
    required this.onTapEmail,
    required this.currentUser,
  });

  @override
  State<MessageBuilder> createState() => _MessageBuilderState();
}

class _MessageBuilderState extends State<MessageBuilder> {
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

  Widget _buildContent(
    UserState userState,
    ChatPageState state,
  ) {
    if (userState.status == UserStatus.loading ||
        state.status == ChatPageStatus.loading ||
        !state.messagesLoaded) {
      return const ChatMessagesSkeleton(
        key: ValueKey('skeleton'),
      );
    }
    if (state.messages.isEmpty) {
      return const BuildEmptyChatMessages(
        key: ValueKey('empty'),
      );
    }
    return KeyedSubtree(
      key: const ValueKey('messages'),
      child: _buildMessages(userState, state),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BlocBuilder<ChatPageBloc, ChatPageState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: _kContentFade,
              child: _buildContent(userState, state),
            );
          },
        );
      },
    );
  }

  Widget _buildMessages(
    UserState userState,
    ChatPageState state,
  ) {
    final uid = context.read<AuthBloc>().state.uid;
    final curUser = userState.userData!;

    final elements = List<ChatMessage>.from(
      state.messages,
    );

    return Stack(
      children: [
        GroupedListView<ChatMessage, DateTime>(
          elements: elements,
          reverse: true,
          order: GroupedListOrder.DESC,
          groupBy: (message) => DateTime(
            message.createdAt.year,
            message.createdAt.month,
            message.createdAt.day,
          ),
          controller: _scrollController,
          groupSeparatorBuilder: (time) {
            return BuildChatSeparator(
              time: time,
            );
          },
          indexedItemBuilder: (context, message, index) {
            final isSentByCurUser = message.sentUid == uid;
            final UserData? sender = isSentByCurUser
                ? curUser
                : state.users
                      .where(
                        (e) => e.uid == message.sentUid,
                      )
                      .firstOrNull;
            if (sender == null) {
              return const SizedBox.shrink();
            }
            return BuildMessage(
              message: message,
              user: sender,
              isSentByCurUser: isSentByCurUser,
              onTapUrl: widget.onTapUrl,
              onTapEmail: widget.onTapEmail,
            );
          },
        ),
        if (state.isLoadingOlder)
          const Positioned(
            top: 12.0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox.square(
                dimension: 22.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
