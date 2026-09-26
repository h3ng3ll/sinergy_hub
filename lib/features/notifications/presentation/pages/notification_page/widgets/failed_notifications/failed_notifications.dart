import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';

class FailedNotifications extends StatelessWidget {
  final String errorMessage;

  const FailedNotifications({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Center(
      child: HorizontalPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.0,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.heartRed.value,
              size: 48.0,
            ),
            Text(
              'Failed to fetch notifications',
              textAlign: TextAlign.center,
              style: textTheme.bold17,
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: textTheme.regular14.copyWith(
                color: AppColors.greyLight.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
