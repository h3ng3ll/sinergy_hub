import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/services/geolocation/models/e_geo_settings_target.dart';
import '../../../../../core/widgets/btn/custom_text_btn.dart';
import '../../../../../core/widgets/btn/translucent_btn.dart';
import '../../../../../core/widgets/inputs/city_input.dart';
import '../../../../../core/widgets/inputs/country_input.dart';

/// Shared Country/City + "Use my location" block, used by both Edit Profile
/// and the onboarding "Tell about yourself" page.
class BuildLocationSection extends StatelessWidget {
  final TextEditingController countryController;
  final TextEditingController cityController;
  final bool isDetecting;
  final String errorMessage;

  /// The settings screen that fixes [errorMessage]; `null` hides the button.
  final EGeoSettingsTarget? settingsTarget;
  final VoidCallback onUseMyLocation;
  final VoidCallback onOpenSettings;

  const BuildLocationSection({
    super.key,
    required this.countryController,
    required this.cityController,
    required this.isDetecting,
    required this.errorMessage,
    required this.onUseMyLocation,
    required this.onOpenSettings,
    this.settingsTarget,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.0,
      children: [
        CountryInput(
          controller: countryController,
        ),
        CityInput(
          controller: cityController,
        ),
        if (!kIsWeb)
          TranslucentBtn(
            onPressed: isDetecting ? null : onUseMyLocation,
            child: isDetecting
                ? SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: colorScheme.onPrimary,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    children: [
                      Icon(
                        Icons.my_location,
                        size: 18.0,
                        color: colorScheme.onPrimary,
                      ),
                      Text(
                        lo.location_use_my_location,
                      ),
                    ],
                  ),
          ),
        if (errorMessage.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              Text(
                errorMessage,
                style: textTheme.regular12.copyWith(
                  color: colorScheme.onError,
                ),
              ),
              if (settingsTarget != null)
                CustomTextBtn(
                  onPressed: onOpenSettings,
                  text: settingsTarget == EGeoSettingsTarget.locationServices
                      ? lo.location_open_location_settings
                      : lo.location_open_settings,
                ),
            ],
          ),
      ],
    );
  }
}
