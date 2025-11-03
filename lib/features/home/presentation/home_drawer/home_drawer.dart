import 'package:flutter/material.dart';

import '../../../../core/resources/colors/app_colors.dart';
import '../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../gen/assets.gen.dart';
import 'widgets/build_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onTapNotifications;
  final VoidCallback onTapAccount;
  final VoidCallback onTapPrivacyPolicy;
  final VoidCallback onTapLogOut;

  const HomeDrawer({
    super.key,
    required this.onTapNotifications,
    required this.onTapAccount,
    required this.onTapPrivacyPolicy,
    required this.onTapLogOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white.value,
      child: SafeArea(
        child: HorizontalPadding(
          child: Column(
            children: [
              BuildMenuItem(
                icon: Assets.icons.notification,
                text: 'Notifications',
                onTap: onTapNotifications,
              ),
              BuildMenuItem(
                icon: Assets.icons.personOutlined,
                text: 'Account',
                onTap: onTapNotifications,
              ),
              BuildMenuItem(
                icon: Assets.icons.privacy,
                text: 'Notifications',
                onTap: onTapNotifications,
              ),
              BuildMenuItem(
                icon: Assets.icons.logOut,
                text: 'Log Out',
                onTap: onTapNotifications,
                color: AppColors.tartOrange.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
