import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class ImageSourceOptionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ImageSourceOptionRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final contentColor = AppColors.jacarta.value;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.0,
              color: contentColor,
            ),
            const Gap(16.0),
            Text(
              label,
              style: textTheme.medium16.copyWith(
                color: contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
