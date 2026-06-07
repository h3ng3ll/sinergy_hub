import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

/// A plain text label rendered above a form field on the report page.
///
/// Used instead of a floating `labelText`, which visually merges into the
/// animated gradient background when the field is focused.
class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: textTheme.regular14.copyWith(
          color: AppColors.white.value.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
