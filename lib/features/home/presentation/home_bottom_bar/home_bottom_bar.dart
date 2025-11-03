import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/app_shader.dart';
import '../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/utils/shader_painter.dart';
import '../home_drawer/home_drawer.dart';
import 'widgets/build_animated_background/build_animated_background.dart';
import 'widgets/custom_bottom_bar_container.dart';

class HomeBottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeBottomBar({
    super.key,
    required this.navigationShell,
  });

  void onTapNotifications () {

  }
  void onTapAccount () {

  }
  void onTapPrivacyPolicy () {

  }
  void onTapLogOut () {

  }

  void _goBranch(
    int index,
  ) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: onTapNotifications,
              child: Icon(
                Icons.notifications,
                color: colorScheme.secondary,
              ),
            ),
            Icon(
              Icons.more_vert,
            ),
          ],
        ),
        body: navigationShell,
        drawer: HomeDrawer(
            onTapNotifications: onTapNotifications,
            onTapAccount: onTapAccount,
            onTapPrivacyPolicy: onTapPrivacyPolicy,
            onTapLogOut: onTapLogOut,
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CustomBottomBarContainer(
          selectedIndex: navigationShell.currentIndex,
          onTapItem: _goBranch,
        ),
      ),
    );
  }
}
