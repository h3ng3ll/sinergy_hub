import 'package:flutter/material.dart';

import '../../../../../../../../../core/widgets/custom_text_field.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Email',
      maxLength: 50,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Error . Email is empty ';
        }
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
          r'[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?'
          r'(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
        );

        if (!emailRegex.hasMatch(value)) {
          return 'Invalid email format';
        }
        return null;
      },
      controller: controller,
    );
  }
}
