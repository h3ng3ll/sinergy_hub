import 'package:flutter/material.dart';

import '../../../../../../../../../core/widgets/custom_text_field.dart';

class PasswordInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      maxLength: 50,
      obscureText: true,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Error . Password is empty ';
        } else if (value!.length < 6) {
          return 'Password must be greater 6 characters';
        }
        return null;
      },
      controller: controller,
    );
  }
}
