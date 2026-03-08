import 'package:flutter/material.dart';

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
    return CustomTextField(
      focusNode: focusNode,
      hintText: 'Add your skill and press Enter',
      maxLength: 50,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.none,
      controller: controller,
    );
  }
}
