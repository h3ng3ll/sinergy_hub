import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/widgets/custom_text_field.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;

  const SearchInput({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      controller: controller,
      onChanged: onChanged,
      prefixIcon: Padding(
        padding: EdgeInsetsGeometry.only(
          top: 7.0,
          bottom: 7.0,
          left: 5.0,
          // right: 0.0,
        ),
        child: Icon(
          Icons.search,
          color: AppColors.white.value.withValues(
            alpha: 0.6,
          ),
        ),
      ),
    );
  }
}
