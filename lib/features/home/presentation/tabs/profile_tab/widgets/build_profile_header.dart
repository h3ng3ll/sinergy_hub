import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../onboard_survey/doman/models/specializations/specializations.dart';
import '../../../../../onboard_survey/doman/models/user_profiler/user_profiler.dart';
import '../../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/translucent_card_container.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import '../../home_tab/widgets/build_tinder_card/widgets/build_top_tinder_card_builder/widget/tinder_card_item/widgets/build_user_avatar.dart';

class BuildProfileHeader extends StatelessWidget {
  final UserData userData;
  final VoidCallback onTapAvatar;

  const BuildProfileHeader({
    super.key,
    required this.userData,
    required this.onTapAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        children: [
          BuildUserAvatar(
            width: 100.0,
            height: 100.0,
            onTap: onTapAvatar,
            url: userData.avatarUrl,
          ),
          Gap(20.0),
          Text(
            '${userData.firstName} ${userData.lastName}',
            style: textTheme.medium24.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
          Gap(10.0),
          TranslucentCardContainer(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10,
            ),
            child: Text(
              Specializations.get(
                userData.profiler.specialization,
              ).name,
              style: textTheme.regular16.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
