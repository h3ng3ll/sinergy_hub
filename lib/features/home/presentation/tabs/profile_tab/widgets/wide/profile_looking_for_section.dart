import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import 'profile_chip.dart';
import 'profile_section_card.dart';
import 'profile_section_header.dart';

class ProfileLookingForSection extends StatelessWidget {
  final UserData userData;
  final VoidCallback onTapEdit;

  const ProfileLookingForSection({
    super.key,
    required this.userData,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final specializations = userData.profiler.searchingSpecializations;

    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          ProfileSectionHeader(
            icon: Icons.travel_explore,
            title: 'Looking for',
            onTapEdit: onTapEdit,
          ),
          if (specializations.isEmpty)
            Text(
              'Not specified yet',
              style: textTheme.regular16.copyWith(
                color: AppColors.darkBlueGray.value,
                fontStyle: FontStyle.italic,
              ),
            )
          else
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: specializations
                  .map(
                    (e) => ProfileChip(
                      label: Specializations.get(e).name,
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
