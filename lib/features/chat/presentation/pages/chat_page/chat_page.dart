import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';

import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../user/presentation/bloc/user_cubit/user_cubit.dart';
import '../../../domain/usecases/get_chat_by_id_use_case.dart';
import '../../../domain/usecases/get_last_messages_use_case.dart';
import '../../../domain/usecases/send_message_use_case.dart';
import '../../bloc/chat_cubit/chat_cubit.dart';
import 'bloc/chat_page_bloc/chat_page_bloc.dart';
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

  @override
  void initState() {
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

  void onTapVideoCall() {
    CallPageRoute().go(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatPageBloc(
        chatId: widget.chatId,
        chatCubit: context.read<ChatCubit>(),
        getLastMessageUseCase: getIt<GetLastMessagesUseCase>(),
        sendMessageUseCase: getIt<SendMessageUseCase>(),
        userCubit: context.read<UserCubit>(),
        getChatByIdUseCase: getIt<GetChatByIdUseCase>(),
      ),
      child: SafeArea(
        top: false,
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: ChatAppBar(
                onTapVideoCall: onTapVideoCall,
                onTapUser: onTapUser,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: BuildChatCanvas(
                      onReachToEnd: onReachToEndMessages,
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
        ),
      ),
    );
  }
}
