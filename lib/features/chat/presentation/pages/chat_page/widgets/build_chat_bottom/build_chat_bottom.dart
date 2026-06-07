import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../inputs/chat_input.dart';
import 'widgets/build_attach_btn.dart';
import 'widgets/build_chat_bottom_container.dart';
import 'widgets/build_send_btn.dart';

class BuildChatBottom extends StatelessWidget {
  final TextEditingController chatController;
  final VoidCallback onSendMessage;
  final VoidCallback onAttachMedia;

  /// True only when the OTHER party blocked the current user.
  final bool isBlocked;

  const BuildChatBottom({
    super.key,
    required this.chatController,
    required this.onSendMessage,
    required this.onAttachMedia,
    this.isBlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return BuildChatBottomContainer(
      child: HorizontalPadding(
        child: Row(
          spacing: 20.0,
          children: [
            /// Todo: In future plans
            // BuildAttachBtn(
            //   onTap: onAttachMedia,
            // ),
            Expanded(
              child: ChatInput(
                textEditingController: chatController,
                isBlocked: isBlocked,
              ),
            ),
            BuildSendBtn(
              onTap: onSendMessage,
              isBlocked: isBlocked,
            ),
          ],
        ),
      ),
    );
  }
}
