import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class HomeAppBarWeb extends CustomAppBar {
  final VoidCallback onTapNotifications;
  final int selectedIndex;
  final Function(int) onTapItem;
  final VoidCallback onTapAccount;
  final VoidCallback onTapPrivacyPolicy;
  final VoidCallback onTapLogOut;

  const HomeAppBarWeb({
    super.key,
    required this.onTapNotifications,
    required this.onTapItem,
    required this.selectedIndex,
    required this.onTapAccount,
    required this.onTapPrivacyPolicy,
    required this.onTapLogOut,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return CustomAppBar(
      leading: Container(),
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  spacing: 15.0,
                  children: [
                    InkWell(
                      onTap: onTapAccount,
                      child: Icon(
                        Icons.person,
                        color: colorScheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: onTapPrivacyPolicy,
                      child: Icon(
                        Icons.privacy_tip,
                        color: colorScheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: onTapLogOut,
                      child: Icon(
                        Icons.logout,
                        color: AppColors.tartOrange.value,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                'Sinergy Hub',
                style: textTheme.bold22.copyWith(
                  color: AppColors.white.value,
                ),
              ),
              Expanded(
                child: Row(
                  spacing: 15.0,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onTapNotifications,
                      child: Icon(
                        Icons.notifications,
                        color: colorScheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTapItem(0),
                      child: Icon(
                        Icons.home,
                        color: colorScheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTapItem(1),
                      child: Icon(
                        Icons.volunteer_activism,
                        color: colorScheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () => onTapItem(2),
                      child: Icon(
                        Icons.favorite,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
