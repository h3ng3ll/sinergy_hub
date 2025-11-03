import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../resources/colors/app_color_scheme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return AppBar(
      leadingWidth: 20.0 + 15,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: InkWell(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            Assets.icons.arrowLeftOutlined,
            width: 20.0,
            height: 20.0,
            colorFilter: ColorFilter.mode(
              colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    60,
  );
}
