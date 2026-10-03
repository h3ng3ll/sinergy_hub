import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../core/widgets/inputs/city_input.dart';
import '../../../../../../core/widgets/inputs/country_input.dart';
import '../../../../domain/models/e_location_filter_mode.dart';

/// Home filter's location criterion — City (country/city text match) or
/// Distance (a server-side radius search). The two modes are mutually
/// exclusive; tapping the already-active option turns location filtering
/// off entirely.
class LocationSection extends StatelessWidget {
  final ELocationFilterMode? mode;
  final ValueChanged<ELocationFilterMode> onModeSelected;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final int radiusKm;
  final ValueChanged<int> onRadiusChanged;
  final bool hasCoordinates;

  const LocationSection({
    super.key,
    required this.mode,
    required this.onModeSelected,
    required this.countryController,
    required this.cityController,
    required this.radiusKm,
    required this.onRadiusChanged,
    required this.hasCoordinates,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final fieldFill = AppColors.antiFlashWhite.value;
    final fieldStyle = textTheme.medium14.copyWith(
      color: AppColors.black.value.withValues(alpha: 0.85),
    );
    final fieldHintStyle = textTheme.regular14.copyWith(
      color: AppColors.black.value.withValues(alpha: 0.4),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.0,
      children: [
        Text(
          lo.filter_location_title,
          style: textTheme.medium18,
        ),
        Row(
          spacing: 8.0,
          children: [
            Expanded(
              child: _LocationModeChip(
                label: lo.filter_location_city_option,
                isSelected: mode == ELocationFilterMode.place,
                onTap: () => onModeSelected(ELocationFilterMode.place),
              ),
            ),
            Expanded(
              child: _LocationModeChip(
                label: lo.filter_location_distance_option,
                isSelected: mode == ELocationFilterMode.radius,
                onTap: () => onModeSelected(ELocationFilterMode.radius),
              ),
            ),
          ],
        ),
        if (mode == ELocationFilterMode.place)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              CountryInput(
                controller: countryController,
                fillColor: fieldFill,
                style: fieldStyle,
                hintStyle: fieldHintStyle,
              ),
              CityInput(
                controller: cityController,
                fillColor: fieldFill,
                style: fieldStyle,
                hintStyle: fieldHintStyle,
              ),
            ],
          ),
        if (mode == ELocationFilterMode.radius)
          hasCoordinates
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lo.filter_location_radius_km(radiusKm),
                      style: textTheme.regular14,
                    ),
                    Slider(
                      value: radiusKm.toDouble(),
                      min: 5.0,
                      max: 300.0,
                      divisions: 59,
                      activeColor: AppColors.darkOrchid.value,
                      onChanged: (value) => onRadiusChanged(value.round()),
                    ),
                  ],
                )
              : Text(
                  lo.filter_location_distance_locked,
                  style: textTheme.regular12.copyWith(
                    color: AppColors.tartOrange.value,
                  ),
                ),
      ],
    );
  }
}

class _LocationModeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LocationModeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected ? null : const Color(0xfff5f5f5),
          gradient: isSelected ? AppGradients.bluePurple : null,
        ),
        child: Center(
          child: Text(
            label,
            style: textTheme.medium12.copyWith(
              color: isSelected ? Colors.white : const Color(0xff666666),
            ),
          ),
        ),
      ),
    );
  }
}
