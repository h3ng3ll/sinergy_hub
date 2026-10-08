import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/resources/colors/app_colors.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/utils/platform_helper.dart';
import '../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../gen/assets.gen.dart';
import 'widgets/build_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onTapNotifications;
  final VoidCallback onTapAccount;
  final VoidCallback onTapSettings;
  final VoidCallback onTapPrivacyPolicy;
  final VoidCallback onTapSupport;
  final VoidCallback onTapLogOut;

  const HomeDrawer({
    super.key,
    required this.onTapNotifications,
    required this.onTapAccount,
    required this.onTapSettings,
    required this.onTapPrivacyPolicy,
    required this.onTapSupport,
    required this.onTapLogOut,
  });


  @override
  Widget build(BuildContext context) {
    // final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Drawer(
      backgroundColor: AppColors.white.value,
      child: SafeArea(
        child: HorizontalPadding(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Sinergy Hub',
                  style: textTheme.bold32.copyWith(),
                ),
              ),
              BuildMenuItem(
                icon: Assets.icons.notification,
                text: 'Notifications',
                onTap: onTapNotifications,
              ),
              BuildMenuItem(
                icon: Assets.icons.personOutlined,
                text: 'Account',
                onTap: onTapAccount,
              ),
              BuildMenuItem(
                icon: Assets.icons.engineOutlined,
                text: 'Settings',
                onTap: onTapSettings,
              ),
              BuildMenuItem(
                icon: Assets.icons.privacy,
                text: 'Privacy Policy',
                onTap: onTapPrivacyPolicy,
              ),
              BuildMenuItem(
                icon: Assets.icons.info,
                text: 'Support',
                onTap: onTapSupport,
              ),
              BuildMenuItem(
                icon: Assets.icons.logOut,
                text: 'Log Out',
                onTap: onTapLogOut,
                color: AppColors.tartOrange.value,
              ),

              FutureBuilder(
                future: PlatformHelper.getAppVersion(),
                builder: (context, asyncSnapshot) {
                  return Text('Version ${asyncSnapshot.data ?? 1}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
