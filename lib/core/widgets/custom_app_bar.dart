import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/extensions/go_router_x.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final double? height;
  final double? leadingWidth;
  final EdgeInsetsGeometry? actionsPadding;
  final bool centerTitle;
  final Widget? title;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final bool? forceMaterialTransparency;
  final Color? shadowColor;

  const CustomAppBar({
    super.key,
    this.actions,
    this.leading,
    this.leadingWidth = 60,
    this.actionsPadding = const EdgeInsets.symmetric(
      horizontal: 25.0,
    ),
    this.height = 80.0,
    this.centerTitle = true,
    this.title,
    this.backgroundColor,
    this.shape,
    this.forceMaterialTransparency,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      title: title,
      centerTitle: centerTitle,
      forceMaterialTransparency: forceMaterialTransparency ?? false,
      shadowColor: shadowColor,

      leading: leading != null
          ? null
          : Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Center(
                child: leading ?? InkWell(
                  onTap: context.goBack,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
      actionsPadding: actionsPadding,
      backgroundColor: backgroundColor ?? Colors.transparent,
      toolbarHeight: height ?? 120,
      actions: actions,
      shape: shape,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    height ?? 110.0,
  );
}
