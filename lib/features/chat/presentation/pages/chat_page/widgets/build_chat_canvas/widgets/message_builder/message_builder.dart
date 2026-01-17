import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../../../../../core/utils/extensions/scroll_controller_ext.dart';
import '../../../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../../../../../domain/models/chat_message/chat_message.dart';
import '../../../../bloc/chat_page_bloc/chat_page_bloc.dart';
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
    final userCubit = context.watch<UserCubit>();
    return BlocBuilder<ChatPageBloc, ChatPageState>(
      builder: (context, state) {
        if (state.status == ChatPageStatus.loading) {
          return LoadingDataWidget();
        }
        if (state.status == ChatPageStatus.initial && state.messages.isEmpty) {
          return BuildEmptyChatMessages();
        }

        final typingUid = state.chat!.typingUsers.firstWhereOrNull(
              (e) => state.chat!.user.uid == e,
        );
        final elements = List<ChatMessage>.from(state.messages);
        if (typingUid != null) {
          elements.add(
            ChatMessage(
              createdAt: DateTime.now(),
            ),
          );
        }

        return GroupedListView<ChatMessage, DateTime>(
          elements: elements,
          reverse: true,
          order: GroupedListOrder.DESC,
          groupBy: (message) =>
              DateTime(
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
            if (typingUid != null && index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BuildMessage.loading(
                  user: state.chat!.user,
                ),
              );
            }
            return BuildMessage(
              message: message,
              user: state.chat!.user,
              isSentByCurUser: message.sentUid == userCubit.uid,
            );
          },

        );
      },
    );
  }
}
