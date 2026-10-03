import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_text_field.dart';

const int kMinAge = 18;
const int kMaxAge = 99;

class AgeInput extends StatelessWidget {
  final TextEditingController controller;

  const AgeInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Age',
      maxLength: 2,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Age must not be empty';
        }
        final age = int.tryParse(value);
        if (age == null || age < kMinAge || age > kMaxAge) {
          return 'Age must be between $kMinAge and $kMaxAge';
        }
        return null;
      },
      controller: controller,
    );
  }
}
