import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../../../../bloc/chat_cubit/chat_cubit.dart';
import '../../bloc/chat_page_bloc/chat_page_bloc.dart';
import '../build_chat_bottom/widgets/build_chat_bottom_container.dart';
import 'widgets/message_builder/message_builder.dart';
import 'widgets/message_builder/widgets/build_message.dart';

class BuildChatCanvas extends StatelessWidget {
  final VoidCallback onReachToEnd;

  const BuildChatCanvas({
    super.key,
    required this.onReachToEnd,
  });

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.watch<ChatPageBloc>().state;
    final typingUsers = chatBloc.chat!.typingUsers;
    return Column(
      children: [
        Expanded(
          child: MessageBuilder(
            onReachToEnd: onReachToEnd,
          ),
        ),
        ...typingUsers.map(
          (e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: BuildMessage.loading(
                user: chatBloc.users.firstWhere(
                  (u) => e == u.uid,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
