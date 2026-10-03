import 'package:flutter/material.dart';

import '../../resources/translations/app_localizations.dart';
import '../custom_text_field.dart';

class CityInput extends StatelessWidget {
  final TextEditingController controller;

  /// Overrides for light surfaces (e.g. a sheet) where the default
  /// translucent-white field and white text are unreadable.
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const CityInput({
    super.key,
    required this.controller,
    this.fillColor,
    this.style,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final lo = AppLocalizations.of(context)!;
    return CustomTextField(
      hintText: lo.location_city_hint,
      maxLength: 60,
      textInputAction: TextInputAction.done,
      controller: controller,
      fillColor: fillColor,
      style: style,
      hintStyle: hintStyle,
    );
  }
}
