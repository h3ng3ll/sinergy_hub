import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import 'build_chat_filter_item_static.dart';

class BuildChatFilterItemAnimated extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const BuildChatFilterItemAnimated({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<BuildChatFilterItemAnimated> createState() =>
      _BuildChatFilterItemAnimatedState();
}

class _BuildChatFilterItemAnimatedState
    extends State<BuildChatFilterItemAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 800,
          ),
        )..repeat(
          reverse: true,
        );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              17.5,
            ),
            border: Border.all(
              color: AppColors.lavenderFloral.value,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkOrchid.value,
                blurRadius: 15,
                spreadRadius: animation.value * 5,
              ),
            ],
          ),
          child: child,
        );
      },
      child: BuildChatFilterItemStatic(
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
