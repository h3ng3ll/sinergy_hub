import 'package:flutter/material.dart';

import '../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../../../../../core/widgets/build_user_avatar.dart';

class BuildTopTinderCard extends StatelessWidget {
  final String? imgUrl;
  final double borderRadius;
  final Specialization specialization;

  const BuildTopTinderCard({
    super.key,
    required this.imgUrl,
    required this.borderRadius,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            borderRadius,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            specialization.colors.first.withValues(
              alpha: 0.4,
            ),
            specialization.colors[1].withValues(
              alpha: 0.7,
            ),
          ],
        ),
        // color: AppColors.pinkLace.value,
      ),
      child: Center(
        child: BuildUserAvatar(
          height: 120.0,
          width: 120.0,
          url: imgUrl,
        ),
      ),
    );
  }
}
