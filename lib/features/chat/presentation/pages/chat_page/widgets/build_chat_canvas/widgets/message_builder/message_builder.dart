import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../../../../../user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../../../../../domain/models/chat_message/chat_message.dart';
import '../../../../../../bloc/chat_page_bloc/chat_page_bloc.dart';
import 'widgets/build_chat_separator.dart';
import 'widgets/build_empty_chat_messages.dart';
import 'widgets/build_message.dart';

class MessageBuilder extends StatefulWidget {
  final VoidCallback onReachToEnd;

  const MessageBuilder({
    super.key,
    required this.onReachToEnd,
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatPageBloc, ChatPageState>(
      builder: (context, state) {
        if (state.status == ChatPageStatus.loading) {
          return LoadingDataWidget();
        }
        if (state.status == ChatPageStatus.initial && state.messages.isEmpty) {
          return BuildEmptyChatMessages();
        }
        final uid = context.read<AuthBloc>().state.uid;
        final curUser = context.read<UserBloc>().state.userData!;

        final elements = List<ChatMessage>.from(
          state.messages,
        );

        return GroupedListView<ChatMessage, DateTime>(
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
            return BuildMessage(
              message: message,
              user: isSentByCurUser
                  ? curUser
                  : state.users.firstWhere(
                      (e) => e.uid == message.sentUid,
                    ),
              isSentByCurUser: isSentByCurUser,
            );
          },
        );
      },
    );
  }
}
