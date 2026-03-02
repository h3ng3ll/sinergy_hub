import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class FirstNameInput extends StatelessWidget {
  final TextEditingController controller;

  const FirstNameInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'FirstName',
      maxLength: 50,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'First Name must not be empty';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      controller: controller,
    );
  }
}
