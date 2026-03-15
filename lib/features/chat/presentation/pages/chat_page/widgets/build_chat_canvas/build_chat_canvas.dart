import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../domain/models/chat/chat.dart';
import 'widgets/message_builder/message_builder.dart';
import 'widgets/message_builder/widgets/build_message.dart';

class BuildChatCanvas extends StatelessWidget {
  final VoidCallback onReachToEnd;
  final Chat chat;
  final List<UserData> users;

  const BuildChatCanvas({
    super.key,
    required this.onReachToEnd,
    required this.chat,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MessageBuilder(
            onReachToEnd: onReachToEnd,
          ),
        ),
        ...chat.typingUsers.map(
          (e) {
            final user = users.firstWhereOrNull(
                  (u) => e == u.uid,
            );
            if(user == null) return Container();
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: BuildMessage.loading(
                user: user,
              ),
            );
          },
        ),
      ],
    );
  }
}
