import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';

class CustomBottomBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTapItem;

  const CustomBottomBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return GestureDetector(
      onTap: onTapItem,
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.white.value : colorScheme.secondary,
          ),
          Gap(10.0),
          Text(
            text,
            style: textTheme.regular12.copyWith(
              color: isSelected ? AppColors.white.value : colorScheme.secondary,
            ),
          ),
          Gap(5.0),
        ],
      ),
    );
  }
}
