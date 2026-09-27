import 'package:flutter/material.dart';

import '../../resources/translations/app_localizations.dart';
import '../custom_text_field.dart';

class CityInput extends StatelessWidget {
  final TextEditingController controller;

  const CityInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final lo = AppLocalizations.of(context)!;
    return CustomTextField(
      hintText: lo.location_city_hint,
      maxLength: 60,
      textInputAction: TextInputAction.done,
      controller: controller,
    );
  }
}
