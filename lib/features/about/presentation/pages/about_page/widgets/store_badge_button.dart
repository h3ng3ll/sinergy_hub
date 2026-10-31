import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

/// "Download on …" store button: dark pill with the store mark and a
/// two-line caption.
class StoreBadgeButton extends StatelessWidget {
  final String icon;
  final String caption;
  final String storeName;
  final VoidCallback onTap;

  const StoreBadgeButton({
    super.key,
    required this.icon,
    required this.caption,
    required this.storeName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final white = AppColors.white.value;

    return Material(
      color: AppColors.black.value,
      borderRadius: BorderRadius.circular(14.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12.0,
            children: [
              SvgPicture.asset(
                icon,
                width: 26.0,
                height: 26.0,
                colorFilter: ColorFilter.mode(
                  white,
                  BlendMode.srcIn,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caption,
                    style: textTheme.regular10.copyWith(
                      color: white.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                  Text(
                    storeName,
                    style: textTheme.bold17.copyWith(
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
