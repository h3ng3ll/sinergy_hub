import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/routes/init_router/init_router.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../home_drawer/home_drawer.dart';
import 'widgets/build_animated_background/build_animated_background.dart';
import 'widgets/custom_bottom_bar_container.dart';
import 'widgets/custom_bottom_bar_item.dart';
import 'widgets/home_app_bar_web.dart';

class HomeBottomBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeBottomBar({
    super.key,
    required this.navigationShell,
  });

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  void onTapNotifications() {
    NotificationPageRoute().push(
      context,
    );
  }

  void onTapAccount() {
    ProfilePageRoute().push(
      context,
    );
  }

  void onTapPrivacyPolicy() {}

  void onTapLogOut() => context.read<AuthBloc>().add(
    AuthEvent.signOut(),
  );

  void _goBranch(
    int index,
  ) => widget.navigationShell.goBranch(
    index,
    initialLocation: index == widget.navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final geTablet = ResponsiveBreakpoints.of(context).largerOrEqualTo(
      TABLET,
    );
    final selectedIndex = widget.navigationShell.currentIndex;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.logout) {
          AuthorizationPageRoute().go(context);
        }
      },
      child: BuildAnimatedBackground(
        child: Scaffold(
          appBar: geTablet
              ? HomeAppBarWeb(
                  onTapNotifications: onTapNotifications,
                  onTapItem: _goBranch,
                  selectedIndex: selectedIndex,
                  onTapAccount: onTapAccount,
                  onTapPrivacyPolicy: onTapPrivacyPolicy,
                  onTapLogOut: onTapLogOut,
                )
              : CustomAppBar(
                  leading: Container(),
                  actions: [
                    InkWell(
                      onTap: onTapNotifications,
                      child: Icon(
                        Icons.notifications,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
          body: widget.navigationShell,
          drawer: geTablet
              ? null
              : HomeDrawer(
                  onTapNotifications: onTapNotifications,
                  onTapAccount: onTapAccount,
                  onTapPrivacyPolicy: onTapPrivacyPolicy,
                  onTapLogOut: onTapLogOut,
                ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: geTablet
              ? null
              : CustomBottomBarContainer(
                  selectedIndex: selectedIndex,
                  onTapItem: _goBranch,
                ),
        ),
      ),
    );
  }
}
