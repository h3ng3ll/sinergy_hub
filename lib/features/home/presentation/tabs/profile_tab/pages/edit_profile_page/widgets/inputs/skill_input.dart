import 'package:flutter/material.dart';

import '../../../../../../../../../core/widgets/custom_text_field.dart';

class SkillInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;

  const SkillInput({
    super.key,
    required this.controller,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Add your skill and press Enter',
      maxLength: 50,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
    );
  }
}
