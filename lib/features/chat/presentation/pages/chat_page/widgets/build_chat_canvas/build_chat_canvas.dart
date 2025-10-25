import 'package:flutter/material.dart';

import '../build_chat_bottom/widgets/build_chat_bottom_container.dart';
import 'widgets/message_builder/message_builder.dart';

class BuildChatCanvas extends StatelessWidget {
  final VoidCallback onReachToEnd;

  const BuildChatCanvas({
    super.key,
    required this.onReachToEnd,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBuilder(
      onReachToEnd: onReachToEnd,
    );
  }
}
