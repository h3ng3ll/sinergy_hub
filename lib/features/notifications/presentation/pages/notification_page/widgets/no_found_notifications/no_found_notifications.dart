import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';

class NoFoundNotifications extends StatelessWidget {
  const NoFoundNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          ClipRRect(
            borderRadius: .circular(
              200.0,
            ),
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: .circle,
              ),
              child: BuildAnimatedBackground(
                child: Icon(
                  Icons.notifications,
                  color: AppColors.white.value,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Gap(20.0),
          Text(
            'Notifications not found yet',
            style: textTheme.bold17,
          ),
        ],
      ),
    );
  }
}
