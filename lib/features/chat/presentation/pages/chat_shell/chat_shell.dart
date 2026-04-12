import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/utils/platform_helper.dart';

import '../chat_page/chat_page.dart';

class ChatShell extends StatefulWidget {
  final Widget navigationShell;

  const ChatShell({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ChatShell> createState() => _ChatShellState();
}

class _ChatShellState extends State<ChatShell> {
  /// Fixed width for the chat panel in split-view mode (desktop only).
  /// This width provides enough space for chat content while leaving
  /// ample room for the user profile panel on the right.
  /// Only shown when ResponsiveBreakpoints >= DESKTOP (901px+).
  static const double _rightPanelWidth = 450.0;

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isMobile) {
      return widget.navigationShell;
    }

    final state = GoRouterState.of(context);
    final isDesktop = ResponsiveBreakpoints.of(
      context,
    ).largerOrEqualTo(DESKTOP);
    final isDetail = (state.fullPath?.contains(':userId') ?? false) && isDesktop;

    return Row(
      children: [
        Expanded(
          child: ChatPage(
            chatId: state.pathParameters['chatId']!,
          ),
        ),
        if (isDetail)
          SizedBox(
            width: _rightPanelWidth,
            child: widget.navigationShell, // ← only detail goes here
          ),
      ],
    );
  }
}
