import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import 'build_chat_filter_item_animated.dart';
import 'build_chat_filter_item_static.dart';

class BuildChatFilterItem extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;

  const BuildChatFilterItem({
    super.key,
    required this.child,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSelected) {
      return BuildChatFilterItemStatic(
        child: child,
      );
    }
    return BuildChatFilterItemAnimated(
      child: child,
    );
  }
}
