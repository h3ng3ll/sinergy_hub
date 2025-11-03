import 'package:flutter/material.dart';

import '../../../../../../../../../core/widgets/custom_text_field.dart';

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

      controller: controller,
    );
  }
}
