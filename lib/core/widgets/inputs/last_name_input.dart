import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class LastNameInput extends StatelessWidget {
  final TextEditingController controller;

  const LastNameInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'LastName',
      maxLength: 50,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Last Name must not be empty';
        }
        return null;
      },
      controller: controller,
    );
  }
}
