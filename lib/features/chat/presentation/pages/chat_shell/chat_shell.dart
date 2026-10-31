import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/platform_helper.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../chat_page/chat_page.dart';

/// Width of the profile side panel in the desktop split view.
const double _kRightPanelWidth = 400.0;

/// Chat + (optional) peer profile.
///
/// - Native phones/tablets: the route stack as-is.
/// - Narrow web (≤450): the chat, or the profile route full-screen.
/// - Tablet width: the chat, or the profile route full-screen.
/// - Desktop width: chat edge-to-edge + profile side panel.
///
/// The shell route uses `EPageWidth.full`, so the chat spans the window;
/// change that width in `init_router.dart` to cap it.
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
  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isMobile) {
      return widget.navigationShell;
    }

    final state = GoRouterState.of(context);

    /// The profile (and its report sub-route) lives under `:userId`; the
    /// chat itself is rendered here directly, not through the navigator.
    final isDetailRoute = state.fullPath?.contains(':userId') ?? false;
    final chat = ChatPage(
      chatId: state.pathParameters['chatId']!,
    );

    if (ResponsiveHelper.isMobile(context)) {
      return isDetailRoute ? widget.navigationShell : chat;
    }

    final isDesktop = ResponsiveHelper.isDesktop(
      MediaQuery.sizeOf(context).width,
    );

    if (!isDesktop) {
      return isDetailRoute ? widget.navigationShell : chat;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: chat,
        ),
        if (isDetailRoute)
          SizedBox(
            width: _kRightPanelWidth,
            child: widget.navigationShell,
          ),
      ],
    );
  }
}
