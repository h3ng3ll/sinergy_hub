import 'package:flutter/material.dart';

import '../../../../../../../../../core/widgets/custom_text_field.dart';

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

      controller: controller,
    );
  }
}
