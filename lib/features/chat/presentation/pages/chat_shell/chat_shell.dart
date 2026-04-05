import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatShell extends StatelessWidget {
  final Widget navigationShell;

  const ChatShell({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return navigationShell;
    // return Row(
    //   children: [
    //     // LEFT PANEL
    //     SizedBox(
    //       width: 300,
    //       child:Navigator(
    //         key: leftNavigatorKey,
    //       ),
    //     ),
    //
    //     // RIGHT PANEL
    //     Expanded(
    //       child: navigationShell.branchNavigator(1),
    //     ),
    //   ],
    // );
  }
}
