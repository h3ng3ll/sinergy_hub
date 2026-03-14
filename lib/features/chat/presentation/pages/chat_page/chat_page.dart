import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';

import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_users_use_case.dart';
import '../../../domain/models/chat/chat.dart';
import '../../../domain/usecases/get_chat_by_id_use_case.dart';
import '../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../domain/usecases/listen_chat_messages_use_case.dart';
import '../../../domain/usecases/send_message_use_case.dart';
import '../../bloc/chat_bloc/chat_bloc.dart';
import '../../bloc/chat_page_bloc/chat_page_bloc.dart';
import 'widgets/app_bar/chat_app_bar.dart';
import 'widgets/build_chat_bottom/build_chat_bottom.dart';
import 'widgets/build_chat_canvas/build_chat_canvas.dart';

class ChatPage extends StatefulWidget {
  final String chatId;

  const ChatPage({
    super.key,
    required this.chatId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late final ChatPageBloc _chatPageBloc;

  @override
  void initState() {
    _chatPageBloc =
        ChatPageBloc(
          chatId: widget.chatId,
          sendMessageUseCase: getIt<SendMessageUseCase>(),
          getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
          listenChatMessagesUseCase: getIt<ListenChatMessagesUseCase>(),
          getUsersUseCase: getIt<GetUsersUseCase>(),
          getLastMessageUseCase: getIt<GetLastMessagesUseCase>(),
        )..add(
          ChatPageEvent.init(),
        );

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onSendMessage(BuildContext context) {
    if (_textEditingController.text.isEmpty) {
      return;
    }
    context.read<ChatPageBloc>().add(
      ChatPageEvent.sendMessage(
        message: _textEditingController.text,
      ),
    );
    _textEditingController.clear();
  }

  void onAttachMedia() {}

  void onReachToEndMessages() {}

  void onTapUser() {}

  void onTapVideoCall(String calleeId) {
    CallPageRoute(
      calleeId: calleeId,
    ).push(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _chatPageBloc,
      child: SafeArea(
        top: false,
        child: Builder(
          builder: (context) {
            final chatBloc = context.watch<ChatBloc>();
            // final authBloc = context.read<AuthBloc>();

            return BlocBuilder<ChatPageBloc, ChatPageState>(
              builder: (context, chatPageState) {
                if (chatPageState.isLoading) {
                  return LoadingDataWidget();
                }
                final Chat chat = chatBloc.state.chats.firstWhere(
                  (e) => e.chatId == widget.chatId,
                );

                /// Todo: refactor for grouped chats
                final UserData chatterUser = chatPageState.users.first;

                return Scaffold(
                  appBar: ChatAppBar(
                    onTapVideoCall: () => onTapVideoCall(
                      chatterUser.uid,
                    ),
                    onTapUser: onTapUser,
                    user: chatterUser,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: BuildChatCanvas(
                          onReachToEnd: onReachToEndMessages,
                          chat: chat,
                          users: [chatterUser],
                        ),
                      ),
                      BuildChatBottom(
                        onSendMessage: () => onSendMessage(
                          context,
                        ),
                        onAttachMedia: onAttachMedia,
                        chatController: _textEditingController,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
