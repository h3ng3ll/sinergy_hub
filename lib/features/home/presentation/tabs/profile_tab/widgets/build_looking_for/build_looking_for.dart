import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../../../user/domain/models/user_data/user_data.dart';
import '../build_user_title_widget.dart';
import '../shadow_container.dart';

class BuildLookingFor extends StatelessWidget {
  final VoidCallback onTapEdit;
  final UserData userData;

  const BuildLookingFor({
    super.key,
    required this.onTapEdit,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return ShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildUserTitleWidget(
            onTapEdit: onTapEdit,
            title: 'Looking for',
          ),
          Gap(20.0),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10.0,
            runSpacing: 10.0,
            children: userData.profiler.searchingSpecializations
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 7.5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        17.5,
                      ),
                      gradient: AppGradients.bluePurple,
                    ),
                    child: Text(
                      Specializations.get(e).name,
                      style: textTheme.regular12.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
