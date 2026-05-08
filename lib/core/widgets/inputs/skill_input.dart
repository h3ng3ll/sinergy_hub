import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';
import '../../resources/text/app_text_theme.dart';
import '../custom_text_field.dart';

class SkillInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  final FocusNode focusNode;

  const SkillInput({
    super.key,
    required this.controller,
    required this.onFieldSubmitted,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return CustomTextField(
      focusNode: focusNode,
      // fillColor: AppColors.white.value,
      style: textTheme.bold14.copyWith(
        color: AppColors.black.value.withValues(
          alpha: 0.8,
        ),
      ),
      hintStyle: textTheme.bold14.copyWith(
        color: AppColors.black.value.withValues(
          alpha: 0.4,
        ),
      ),
      hintText: 'Add your skill and press Enter',
      maxLength: 50,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.done,
      controller: controller,
    );
  }
}
