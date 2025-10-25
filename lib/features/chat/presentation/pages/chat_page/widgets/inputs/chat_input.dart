import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController textEditingController;

  const ChatInput({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return CustomTextField(
      controller: textEditingController,
      hintText: 'Message...',
      style: textTheme.regular14.copyWith(
        color: colorScheme.onSecondary,
      ),
      hintStyle: textTheme.regular14.copyWith(
        color: AppColors.black.value.withValues(
          alpha: 0.4
        ),
      ),
    );
  }
}
