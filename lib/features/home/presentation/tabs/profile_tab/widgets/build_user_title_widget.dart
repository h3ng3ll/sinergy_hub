import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class BuildUserTitleWidget extends StatelessWidget {
  final VoidCallback onTapEdit;
  final String title;

  const BuildUserTitleWidget({
    super.key,
    required this.onTapEdit,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.medium18,
        ),
        InkWell(
          onTap: onTapEdit,
          child: Icon(
            Icons.edit,
            color: AppColors.black.value.withValues(
              alpha: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
