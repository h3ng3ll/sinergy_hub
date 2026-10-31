import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';

class ProfileSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTapEdit;

  const ProfileSectionHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final accent = AppColors.majorelleBlue.value;

    return Row(
      spacing: 12.0,
      children: [
        Container(
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accent.withValues(
              alpha: 0.10,
            ),
          ),
          child: Icon(
            icon,
            size: 20.0,
            color: accent,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: textTheme.bold17.copyWith(
              color: AppColors.jacarta.value,
            ),
          ),
        ),
        IconButton(
          onPressed: onTapEdit,
          tooltip: 'Edit',
          splashRadius: 20.0,
          hoverColor: accent.withValues(
            alpha: 0.08,
          ),
          icon: Icon(
            Icons.edit_outlined,
            size: 20.0,
            color: AppColors.darkBlueGray.value,
          ),
        ),
      ],
    );
  }
}
