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
        if (value?.isEmpty ?? true) {
          return 'Error . Email is empty ';
        } else if (!value!.contains('@')) {
          return 'Invalid email format';
        }
        return null;
      },
      controller: controller,
    );
  }
}
