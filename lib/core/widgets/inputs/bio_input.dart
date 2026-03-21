import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class BioInput extends StatelessWidget {
  final TextEditingController controller;

  const BioInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Tell about yourself what goals are you looking for and about your plans .',
      maxLength: 800,
      maxLines: 5,
      controller: controller,
    );
  }
}
